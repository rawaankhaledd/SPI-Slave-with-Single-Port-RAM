# SPI Slave with Single-Port RAM

A Verilog implementation of an **SPI slave** interface connected to a **synchronous single-port RAM**, wrapped in a top-level module. The design was verified in simulation, linted, and taken through Vivado synthesis and implementation, including a comparison of three FSM encoding styles (one-hot, sequential, gray).

**Authors**
- Rawan Khaled Yahia
- Waad Rabie Mahmoud

---

## Table of Contents

- [Overview](#overview)
- [Design Hierarchy](#design-hierarchy)
- [Module Details](#module-details)
- [Operation](#operation)
- [Simulation Results](#simulation-results)
- [Linting](#linting)
- [Synthesis](#synthesis)
- [FSM Encoding Comparison](#fsm-encoding-comparison)
- [Implementation Results](#implementation-results)
- [Tools Used](#tools-used)
- [Authors](#authors)

---

## Overview

The design lets an external SPI master read from and write to an on-chip memory using only four SPI signals (`MOSI`, `MISO`, `SS_n`, `clk`) plus an active-low reset.

- The **SPI slave** deserializes incoming bits from `MOSI` into a 10-bit word (`rx_data`), and serializes 8-bit read data (`tx_data`) back out on `MISO`.
- The **RAM** stores 256 bytes with an 8-bit address, and is accessed through the 10-bit `din` bus.
- The **wrapper** connects the two blocks and exposes only the SPI pins.

## Design Hierarchy

```
spi_wrapper
├── spi  (spi_slave)   FSM + serial-to-parallel / parallel-to-serial logic
└── RAM  (spr_sync)    256 x 8 synchronous single-port RAM
```

```
            ┌────────────────────────── spi_wrapper ───────────────────────────┐
 MOSI ─────►│                                                                  │
 SS_n ─────►│   ┌───────────┐  rx_data[9:0]   ┌──────────┐                     │
 clk  ─────►│   │ spi_slave │ ───────────────►│ spr_sync │                     │
 rst_n ────►│   │           │  rx_valid       │  (RAM)   │                     │
 MISO ◄─────│   │           │ ───────────────►│          │                     │
            │   │           │◄─────────────── │          │                     │
            │   └───────────┘  tx_data[7:0]   └──────────┘                     │
            │                  tx_valid                                        │
            └──────────────────────────────────────────────────────────────────┘
```

## Module Details

### `spi_wrapper`

Top-level module.

| Parameter    | Default | Description                  |
|--------------|---------|------------------------------|
| `MEM_DEPTH`  | `256`   | Number of RAM words          |
| `ADDR_SIZE`  | `8`     | Address width in bits        |

| Port    | Direction | Description                  |
|---------|-----------|------------------------------|
| `MOSI`  | input     | Serial data from the master  |
| `SS_n`  | input     | Slave select (active low)    |
| `clk`   | input     | Clock                        |
| `rst_n` | input     | Active-low reset             |
| `MISO`  | output    | Serial data to the master    |

### `spi_slave`

Controls the SPI protocol with a five-state FSM (state register `cs_reg`):

| State       | Purpose                                              |
|-------------|------------------------------------------------------|
| `IDLE`      | Wait for the master to assert `SS_n`                 |
| `CHK_CMD`   | Check the command bit to decide between read and write |
| `WRITE`     | Receive a write (address or data) from `MOSI`        |
| `READ_ADD`  | Receive the read address from `MOSI`                 |
| `READ_DATA` | Shift the data returned by the RAM out on `MISO`     |

Interface to the RAM: `rx_data[9:0]` and `rx_valid` go to the RAM; `tx_data[7:0]` and `tx_valid` come back from it.

### `spr_sync`

Synchronous single-port RAM with 256 locations of 8 bits (inferred as a `RAMB18E1` block RAM). It takes the 10-bit `din` and `rx_valid`, and returns `dout[7:0]` with `tx_valid`.

## Operation

The master drives `SS_n` low and shifts a 10-bit word in on `MOSI`. The FSM then does one of the following:

1. **Write address**: the address is captured in an internal address register (`temp` in the waveforms).
2. **Write data**: the data is written to `mem[address]`.
3. **Read address**: the read address is captured.
4. **Read data**: the RAM returns `dout`, which the slave serializes bit by bit on `MISO` while the master clocks.

On the waveforms, the internal `counter` counts down from 9 to 0 while receiving the 10-bit word, and from 7 to 0 while transmitting the 8-bit read data.

## Simulation Results

Simulated in **Questasim** with the `spiwrapper_tb` testbench. The following scenario was checked on address 255:

| Step | Operation                        | Result                                                                        |
|------|----------------------------------|-------------------------------------------------------------------------------|
| 1    | Write address `255`              | `rx_data` = `din`; `temp` updates to `0xFF` one clock cycle later             |
| 2    | Write data `11111010` (`0xFA`)   | `rx_data` = `din`; `mem[255]` updates to `0xFA` one clock cycle later         |
| 3    | Read address `255`               | `rx_data` = `din`; `temp` updates to `0xFF` one clock cycle later             |
| 4    | Read data from address `255`     | `tx_data` = `dout` = `0xFA`, serialized on `MISO`                             |

## Linting

Linted with **Questa Lint**. The run reports **no errors**; the 6 findings are all informational style items:

- Same parameter name used in more than one module (x2)
- `always` block with a large number of signal assignments (`spi_slave`)
- Multiple ports declared on one line (x3)

## Synthesis

Targeted device: `xc7a35ticpg236-1L` (Artix-7), using **Vivado 2018.2**.

| Stage       | Cells | I/O Ports | Nets |
|-------------|------:|----------:|-----:|
| Elaboration | 2     | 5         | 25   |
| Synthesis   | 10    | 5         | 85   |

The RAM is inferred as block RAM (`mem_reg`, `RAMB18E1`).

**Timing after synthesis** (identical for all three FSM encodings):

| WNS      | WHS      | WPWS     | Failing Endpoints |
|---------:|---------:|---------:|------------------:|
| 5.898 ns | 0.146 ns | 4.500 ns | 0                 |

**Critical path:** `RAM/mem_reg` (block RAM clock-to-output) to `spi/MISO_reg/D`, with a setup slack of 5.898 ns and a total delay of about 3.95 ns.

## FSM Encoding Comparison

The `spi_slave` state register (`cs_reg`) was synthesized with three encodings using the `fsm_encoding` attribute:

| State       | One-hot | Sequential | Gray |
|-------------|---------|------------|------|
| `IDLE`      | `00001` | `000`      | `000` |
| `CHK_CMD`   | `00010` | `001`      | `001` |
| `WRITE`     | `00100` | `010`      | `011` |
| `READ_ADD`  | `01000` | `011`      | `010` |
| `READ_DATA` | `10000` | `100`      | `111` |

Post-synthesis timing was identical for all three. After implementation they diverge:

| Encoding   | WNS (setup) | WHS (hold) | WPWS     | Endpoints |
|------------|------------:|-----------:|---------:|----------:|
| Gray       | 5.573 ns    | 0.082 ns   | 4.500 ns | 69        |
| One-hot    | 5.410 ns    | 0.058 ns   | 4.500 ns | 71        |
| Sequential | **5.661 ns**| 0.059 ns   | 4.500 ns | 69        |

All three meet timing with no failing endpoints. **Sequential encoding gives the best timing** because it has the highest setup slack.

## Implementation Results

Utilization after implementation. The numbers include the debug cores (`dbg_hub` and `u_ila_0`) that were added for hardware debugging, so they are larger than the design alone.

| Slice LUTs | Slice Registers | F7 Muxes | Slices | LUT as Logic | LUT as Memory | LUT FF Pairs | Block RAM Tile | Bonded IOB |
|-----------:|----------------:|---------:|-------:|-------------:|--------------:|-------------:|---------------:|-----------:|
| 1275       | 1948            | 10       | 634    | 1167         | 108           | 753          | 1              | 5          |

**Messages:** after the debug core was set up, Vivado raised critical warnings (`Timing 38-282`: the design failed to meet the timing requirements) during route design. See the timing summary report for details.

## Tools Used

- **Verilog HDL**
- **Questasim** for simulation
- **Questa Lint** for static linting
- **Xilinx Vivado 2018.2** for elaboration, synthesis, implementation, and ILA debug

## Authors

| Name                    | Group |
|-------------------------|-------|
| Waad Rabie Mahmoud      | G2    |
| Rawan Khaled Yahia      | G2    |
