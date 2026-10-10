// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (win64) Build 2258646 Thu Jun 14 20:03:12 MDT 2018
// Date        : Tue Aug  5 20:12:54 2025
// Host        : Waad running 64-bit major release  (build 9200)
// Command     : write_verilog C:/Users/waadr/vivadoo/spi/netlist.v
// Design      : spi_wrapper
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7a35ticpg236-1L
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module spi_slave
   (MISO_OBUF,
    \rx_data_reg[0]_0 ,
    rx_valid,
    WEA,
    rx_data,
    \counter_readdata_reg[0]_0 ,
    \counter_readdata_reg[1]_0 ,
    E,
    mem_reg,
    clk_IBUF_BUFG,
    rst_n_IBUF,
    tx_valid,
    mem_reg_0,
    mem_reg_1,
    MOSI_IBUF,
    SS_n_IBUF);
  output MISO_OBUF;
  output \rx_data_reg[0]_0 ;
  output rx_valid;
  output [0:0]WEA;
  output [9:0]rx_data;
  output \counter_readdata_reg[0]_0 ;
  output \counter_readdata_reg[1]_0 ;
  output [0:0]E;
  output mem_reg;
  input clk_IBUF_BUFG;
  input rst_n_IBUF;
  input tx_valid;
  input mem_reg_0;
  input mem_reg_1;
  input MOSI_IBUF;
  input SS_n_IBUF;

  wire \<const0> ;
  wire \<const1> ;
  wire [0:0]E;
  wire MISO_OBUF;
  wire MISO_i_1_n_0;
  wire MISO_i_2_n_0;
  wire MOSI_IBUF;
  wire SS_n_IBUF;
  wire [0:0]WEA;
  wire add_data0_out;
  wire add_data_i_1_n_0;
  wire add_data_i_3_n_0;
  wire add_data_reg_n_0;
  wire clk_IBUF_BUFG;
  wire [3:0]counter;
  wire \counter[3]_i_2_n_0 ;
  wire \counter_readdata[0]_i_1_n_0 ;
  wire \counter_readdata[1]_i_1_n_0 ;
  wire \counter_readdata[2]_i_1_n_0 ;
  wire \counter_readdata[2]_i_2_n_0 ;
  wire \counter_readdata[2]_i_3_n_0 ;
  wire \counter_readdata_reg[0]_0 ;
  wire \counter_readdata_reg[1]_0 ;
  wire \counter_readdata_reg_n_0_[2] ;
  wire \counter_reg_n_0_[0] ;
  wire \counter_reg_n_0_[1] ;
  wire \counter_reg_n_0_[2] ;
  wire \counter_reg_n_0_[3] ;
  (* RTL_KEEP = "yes" *) wire [2:0]cs;
  wire mem_reg;
  wire mem_reg_0;
  wire mem_reg_1;
  wire [2:0]ns;
  wire rst_n_IBUF;
  wire [9:0]rx_data;
  wire \rx_data[0]_i_1_n_0 ;
  wire \rx_data[1]_i_1_n_0 ;
  wire \rx_data[2]_i_1_n_0 ;
  wire \rx_data[3]_i_1_n_0 ;
  wire \rx_data[3]_i_2_n_0 ;
  wire \rx_data[4]_i_1_n_0 ;
  wire \rx_data[5]_i_1_n_0 ;
  wire \rx_data[6]_i_1_n_0 ;
  wire \rx_data[7]_i_1_n_0 ;
  wire \rx_data[7]_i_2_n_0 ;
  wire \rx_data[8]_i_1_n_0 ;
  wire \rx_data[8]_i_2_n_0 ;
  wire \rx_data[9]_i_1_n_0 ;
  wire \rx_data[9]_i_2_n_0 ;
  wire \rx_data_reg[0]_0 ;
  wire rx_valid;
  wire rx_valid_i_1_n_0;
  wire rx_valid_i_2_n_0;
  wire tx_valid;

  LUT6 #(
    .INIT(64'h000000000000F20F)) 
    \FSM_sequential_cs[0]_i_1 
       (.I0(MOSI_IBUF),
        .I1(add_data_reg_n_0),
        .I2(cs[1]),
        .I3(cs[0]),
        .I4(cs[2]),
        .I5(SS_n_IBUF),
        .O(ns[0]));
  LUT6 #(
    .INIT(64'h000000000000FF2A)) 
    \FSM_sequential_cs[1]_i_1 
       (.I0(cs[0]),
        .I1(MOSI_IBUF),
        .I2(add_data_reg_n_0),
        .I3(cs[1]),
        .I4(SS_n_IBUF),
        .I5(cs[2]),
        .O(ns[1]));
  LUT6 #(
    .INIT(64'h00000000FFFF0080)) 
    \FSM_sequential_cs[2]_i_1 
       (.I0(MOSI_IBUF),
        .I1(add_data_reg_n_0),
        .I2(cs[0]),
        .I3(cs[1]),
        .I4(cs[2]),
        .I5(SS_n_IBUF),
        .O(ns[2]));
  (* FSM_ENCODED_STATES = "CHK_CMD:001,WRITE:010,READ_ADD:011,IDLE:000,READ_DATA:100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_cs_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(ns[0]),
        .Q(cs[0]),
        .R(\rx_data_reg[0]_0 ));
  (* FSM_ENCODED_STATES = "CHK_CMD:001,WRITE:010,READ_ADD:011,IDLE:000,READ_DATA:100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_cs_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(ns[1]),
        .Q(cs[1]),
        .R(\rx_data_reg[0]_0 ));
  (* FSM_ENCODED_STATES = "CHK_CMD:001,WRITE:010,READ_ADD:011,IDLE:000,READ_DATA:100" *) 
  (* KEEP = "yes" *) 
  FDRE #(
    .INIT(1'b0)) 
    \FSM_sequential_cs_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(ns[2]),
        .Q(cs[2]),
        .R(\rx_data_reg[0]_0 ));
  GND GND
       (.G(\<const0> ));
  LUT4 #(
    .INIT(16'hF3E3)) 
    MISO_i_1
       (.I0(cs[0]),
        .I1(cs[1]),
        .I2(cs[2]),
        .I3(tx_valid),
        .O(MISO_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000007400)) 
    MISO_i_2
       (.I0(mem_reg_0),
        .I1(\counter_readdata_reg_n_0_[2] ),
        .I2(mem_reg_1),
        .I3(cs[2]),
        .I4(cs[1]),
        .I5(cs[0]),
        .O(MISO_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    MISO_reg
       (.C(clk_IBUF_BUFG),
        .CE(MISO_i_1_n_0),
        .D(MISO_i_2_n_0),
        .Q(MISO_OBUF),
        .R(\rx_data_reg[0]_0 ));
  VCC VCC
       (.P(\<const1> ));
  LUT3 #(
    .INIT(8'h74)) 
    add_data_i_1
       (.I0(cs[2]),
        .I1(add_data0_out),
        .I2(add_data_reg_n_0),
        .O(add_data_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000020000800280)) 
    add_data_i_2
       (.I0(rst_n_IBUF),
        .I1(cs[0]),
        .I2(cs[1]),
        .I3(cs[2]),
        .I4(add_data_i_3_n_0),
        .I5(rx_valid_i_2_n_0),
        .O(add_data0_out));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'hFFFD)) 
    add_data_i_3
       (.I0(tx_valid),
        .I1(\counter_readdata_reg_n_0_[2] ),
        .I2(\counter_readdata_reg[0]_0 ),
        .I3(\counter_readdata_reg[1]_0 ),
        .O(add_data_i_3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    add_data_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(add_data_i_1_n_0),
        .Q(add_data_reg_n_0),
        .R(\<const0> ));
  LUT4 #(
    .INIT(16'hB9FF)) 
    \counter[0]_i_1 
       (.I0(cs[2]),
        .I1(cs[1]),
        .I2(cs[0]),
        .I3(\counter_reg_n_0_[0] ),
        .O(counter[0]));
  LUT5 #(
    .INIT(32'h46000046)) 
    \counter[1]_i_1 
       (.I0(cs[2]),
        .I1(cs[1]),
        .I2(cs[0]),
        .I3(\counter_reg_n_0_[1] ),
        .I4(\counter_reg_n_0_[0] ),
        .O(counter[1]));
  LUT6 #(
    .INIT(64'h00E1000000E1E100)) 
    \counter[2]_i_1 
       (.I0(\counter_reg_n_0_[0] ),
        .I1(\counter_reg_n_0_[1] ),
        .I2(\counter_reg_n_0_[2] ),
        .I3(cs[2]),
        .I4(cs[1]),
        .I5(cs[0]),
        .O(counter[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFFEAAAB)) 
    \counter[3]_i_1 
       (.I0(\counter[3]_i_2_n_0 ),
        .I1(\counter_reg_n_0_[2] ),
        .I2(\counter_reg_n_0_[1] ),
        .I3(\counter_reg_n_0_[0] ),
        .I4(\counter_reg_n_0_[3] ),
        .O(counter[3]));
  LUT3 #(
    .INIT(8'hE3)) 
    \counter[3]_i_2 
       (.I0(cs[0]),
        .I1(cs[1]),
        .I2(cs[2]),
        .O(\counter[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hFAFFFA6FAAAAAAAA)) 
    \counter_readdata[0]_i_1 
       (.I0(\counter_readdata_reg[0]_0 ),
        .I1(tx_valid),
        .I2(cs[2]),
        .I3(cs[1]),
        .I4(cs[0]),
        .I5(rst_n_IBUF),
        .O(\counter_readdata[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFEFFFFFEFFF0000)) 
    \counter_readdata[1]_i_1 
       (.I0(cs[0]),
        .I1(cs[1]),
        .I2(cs[2]),
        .I3(\counter_readdata_reg[0]_0 ),
        .I4(\counter_readdata[2]_i_3_n_0 ),
        .I5(\counter_readdata_reg[1]_0 ),
        .O(\counter_readdata[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEFFFFFFFFFEF0000)) 
    \counter_readdata[2]_i_1 
       (.I0(cs[1]),
        .I1(cs[0]),
        .I2(cs[2]),
        .I3(\counter_readdata[2]_i_2_n_0 ),
        .I4(\counter_readdata[2]_i_3_n_0 ),
        .I5(\counter_readdata_reg_n_0_[2] ),
        .O(\counter_readdata[2]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \counter_readdata[2]_i_2 
       (.I0(\counter_readdata_reg[0]_0 ),
        .I1(\counter_readdata_reg[1]_0 ),
        .O(\counter_readdata[2]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hCFCB0000)) 
    \counter_readdata[2]_i_3 
       (.I0(tx_valid),
        .I1(cs[2]),
        .I2(cs[1]),
        .I3(cs[0]),
        .I4(rst_n_IBUF),
        .O(\counter_readdata[2]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_readdata_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\counter_readdata[0]_i_1_n_0 ),
        .Q(\counter_readdata_reg[0]_0 ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_readdata_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\counter_readdata[1]_i_1_n_0 ),
        .Q(\counter_readdata_reg[1]_0 ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_readdata_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\counter_readdata[2]_i_1_n_0 ),
        .Q(\counter_readdata_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_n_IBUF),
        .D(counter[0]),
        .Q(\counter_reg_n_0_[0] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_n_IBUF),
        .D(counter[1]),
        .Q(\counter_reg_n_0_[1] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_n_IBUF),
        .D(counter[2]),
        .Q(\counter_reg_n_0_[2] ),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \counter_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(rst_n_IBUF),
        .D(counter[3]),
        .Q(\counter_reg_n_0_[3] ),
        .R(\<const0> ));
  LUT3 #(
    .INIT(8'hD5)) 
    mem_reg_i_1
       (.I0(rst_n_IBUF),
        .I1(rx_data[8]),
        .I2(rx_data[9]),
        .O(mem_reg));
  LUT1 #(
    .INIT(2'h1)) 
    mem_reg_i_2
       (.I0(rst_n_IBUF),
        .O(\rx_data_reg[0]_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    mem_reg_i_3
       (.I0(rx_valid),
        .I1(rx_data[8]),
        .I2(rx_data[9]),
        .O(WEA));
  LUT6 #(
    .INIT(64'h3332333300020000)) 
    \rx_data[0]_i_1 
       (.I0(MOSI_IBUF),
        .I1(\counter[3]_i_2_n_0 ),
        .I2(\counter_reg_n_0_[3] ),
        .I3(\counter_reg_n_0_[2] ),
        .I4(\rx_data[8]_i_2_n_0 ),
        .I5(rx_data[0]),
        .O(\rx_data[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h3233333302000000)) 
    \rx_data[1]_i_1 
       (.I0(MOSI_IBUF),
        .I1(\counter[3]_i_2_n_0 ),
        .I2(\counter_reg_n_0_[1] ),
        .I3(\counter_reg_n_0_[0] ),
        .I4(\rx_data[3]_i_2_n_0 ),
        .I5(rx_data[1]),
        .O(\rx_data[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h3233333302000000)) 
    \rx_data[2]_i_1 
       (.I0(MOSI_IBUF),
        .I1(\counter[3]_i_2_n_0 ),
        .I2(\counter_reg_n_0_[0] ),
        .I3(\counter_reg_n_0_[1] ),
        .I4(\rx_data[3]_i_2_n_0 ),
        .I5(rx_data[2]),
        .O(\rx_data[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h2333333320000000)) 
    \rx_data[3]_i_1 
       (.I0(MOSI_IBUF),
        .I1(\counter[3]_i_2_n_0 ),
        .I2(\counter_reg_n_0_[0] ),
        .I3(\counter_reg_n_0_[1] ),
        .I4(\rx_data[3]_i_2_n_0 ),
        .I5(rx_data[3]),
        .O(\rx_data[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \rx_data[3]_i_2 
       (.I0(\counter_reg_n_0_[3] ),
        .I1(\counter_reg_n_0_[2] ),
        .O(\rx_data[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h3233333302000000)) 
    \rx_data[4]_i_1 
       (.I0(MOSI_IBUF),
        .I1(\counter[3]_i_2_n_0 ),
        .I2(\counter_reg_n_0_[3] ),
        .I3(\counter_reg_n_0_[2] ),
        .I4(\rx_data[8]_i_2_n_0 ),
        .I5(rx_data[4]),
        .O(\rx_data[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h3332333300020000)) 
    \rx_data[5]_i_1 
       (.I0(MOSI_IBUF),
        .I1(\counter[3]_i_2_n_0 ),
        .I2(\rx_data[7]_i_2_n_0 ),
        .I3(\counter_reg_n_0_[1] ),
        .I4(\counter_reg_n_0_[0] ),
        .I5(rx_data[5]),
        .O(\rx_data[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h3332333300020000)) 
    \rx_data[6]_i_1 
       (.I0(MOSI_IBUF),
        .I1(\counter[3]_i_2_n_0 ),
        .I2(\rx_data[7]_i_2_n_0 ),
        .I3(\counter_reg_n_0_[0] ),
        .I4(\counter_reg_n_0_[1] ),
        .I5(rx_data[6]),
        .O(\rx_data[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h3233333302000000)) 
    \rx_data[7]_i_1 
       (.I0(MOSI_IBUF),
        .I1(\counter[3]_i_2_n_0 ),
        .I2(\rx_data[7]_i_2_n_0 ),
        .I3(\counter_reg_n_0_[0] ),
        .I4(\counter_reg_n_0_[1] ),
        .I5(rx_data[7]),
        .O(\rx_data[7]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \rx_data[7]_i_2 
       (.I0(\counter_reg_n_0_[3] ),
        .I1(\counter_reg_n_0_[2] ),
        .O(\rx_data[7]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h3323333300200000)) 
    \rx_data[8]_i_1 
       (.I0(MOSI_IBUF),
        .I1(\counter[3]_i_2_n_0 ),
        .I2(\counter_reg_n_0_[3] ),
        .I3(\counter_reg_n_0_[2] ),
        .I4(\rx_data[8]_i_2_n_0 ),
        .I5(rx_data[8]),
        .O(\rx_data[8]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'h1)) 
    \rx_data[8]_i_2 
       (.I0(\counter_reg_n_0_[0] ),
        .I1(\counter_reg_n_0_[1] ),
        .O(\rx_data[8]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h3333323300000200)) 
    \rx_data[9]_i_1 
       (.I0(MOSI_IBUF),
        .I1(\counter[3]_i_2_n_0 ),
        .I2(\rx_data[9]_i_2_n_0 ),
        .I3(\counter_reg_n_0_[3] ),
        .I4(\counter_reg_n_0_[2] ),
        .I5(rx_data[9]),
        .O(\rx_data[9]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT2 #(
    .INIT(4'hB)) 
    \rx_data[9]_i_2 
       (.I0(\counter_reg_n_0_[1] ),
        .I1(\counter_reg_n_0_[0] ),
        .O(\rx_data[9]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[0]_i_1_n_0 ),
        .Q(rx_data[0]),
        .R(\rx_data_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[1]_i_1_n_0 ),
        .Q(rx_data[1]),
        .R(\rx_data_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[2]_i_1_n_0 ),
        .Q(rx_data[2]),
        .R(\rx_data_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[3]_i_1_n_0 ),
        .Q(rx_data[3]),
        .R(\rx_data_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[4]_i_1_n_0 ),
        .Q(rx_data[4]),
        .R(\rx_data_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[5]_i_1_n_0 ),
        .Q(rx_data[5]),
        .R(\rx_data_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[6]_i_1_n_0 ),
        .Q(rx_data[6]),
        .R(\rx_data_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[7]_i_1_n_0 ),
        .Q(rx_data[7]),
        .R(\rx_data_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[8]_i_1_n_0 ),
        .Q(rx_data[8]),
        .R(\rx_data_reg[0]_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \rx_data_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(\rx_data[9]_i_1_n_0 ),
        .Q(rx_data[9]),
        .R(\rx_data_reg[0]_0 ));
  LUT5 #(
    .INIT(32'h303C1010)) 
    rx_valid_i_1
       (.I0(rx_valid_i_2_n_0),
        .I1(cs[2]),
        .I2(cs[1]),
        .I3(cs[0]),
        .I4(rx_valid),
        .O(rx_valid_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'hFFFE)) 
    rx_valid_i_2
       (.I0(\counter_reg_n_0_[1] ),
        .I1(\counter_reg_n_0_[0] ),
        .I2(\counter_reg_n_0_[2] ),
        .I3(\counter_reg_n_0_[3] ),
        .O(rx_valid_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    rx_valid_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(rx_valid_i_1_n_0),
        .Q(rx_valid),
        .R(\rx_data_reg[0]_0 ));
  LUT3 #(
    .INIT(8'h08)) 
    \temp[7]_i_1 
       (.I0(rst_n_IBUF),
        .I1(rx_valid),
        .I2(rx_data[8]),
        .O(E));
endmodule

(* ADDR_SIZE = "8" *) (* MEM_DEPTH = "256" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module spi_wrapper
   (MISO,
    MOSI,
    SS_n,
    clk,
    rst_n);
  output MISO;
  input MOSI;
  input SS_n;
  input clk;
  input rst_n;

  wire MISO;
  wire MISO_OBUF;
  wire MOSI;
  wire MOSI_IBUF;
  wire RAM_n_0;
  wire RAM_n_1;
  wire SS_n;
  wire SS_n_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire mem;
  wire rst_n;
  wire rst_n_IBUF;
  wire [9:0]rx_data;
  wire rx_valid;
  wire spi_n_1;
  wire spi_n_14;
  wire spi_n_15;
  wire spi_n_16;
  wire spi_n_17;
  wire tx_valid;

  OBUF MISO_OBUF_inst
       (.I(MISO_OBUF),
        .O(MISO));
  IBUF MOSI_IBUF_inst
       (.I(MOSI),
        .O(MOSI_IBUF));
  spr_sync RAM
       (.E(spi_n_16),
        .MISO_reg(RAM_n_0),
        .MISO_reg_0(RAM_n_1),
        .WEA(mem),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\counter_readdata_reg[0] (spi_n_14),
        .\counter_readdata_reg[1] (spi_n_15),
        .rst_n(spi_n_1),
        .rst_n_IBUF(rst_n_IBUF),
        .rx_data(rx_data),
        .\rx_data_reg[8] (spi_n_17),
        .rx_valid(rx_valid),
        .tx_valid(tx_valid));
  IBUF SS_n_IBUF_inst
       (.I(SS_n),
        .O(SS_n_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  IBUF rst_n_IBUF_inst
       (.I(rst_n),
        .O(rst_n_IBUF));
  spi_slave spi
       (.E(spi_n_16),
        .MISO_OBUF(MISO_OBUF),
        .MOSI_IBUF(MOSI_IBUF),
        .SS_n_IBUF(SS_n_IBUF),
        .WEA(mem),
        .clk_IBUF_BUFG(clk_IBUF_BUFG),
        .\counter_readdata_reg[0]_0 (spi_n_14),
        .\counter_readdata_reg[1]_0 (spi_n_15),
        .mem_reg(spi_n_17),
        .mem_reg_0(RAM_n_1),
        .mem_reg_1(RAM_n_0),
        .rst_n_IBUF(rst_n_IBUF),
        .rx_data(rx_data),
        .\rx_data_reg[0]_0 (spi_n_1),
        .rx_valid(rx_valid),
        .tx_valid(tx_valid));
endmodule

module spr_sync
   (MISO_reg,
    MISO_reg_0,
    tx_valid,
    clk_IBUF_BUFG,
    rst_n_IBUF,
    \rx_data_reg[8] ,
    rst_n,
    rx_data,
    WEA,
    \counter_readdata_reg[1] ,
    \counter_readdata_reg[0] ,
    E,
    rx_valid);
  output MISO_reg;
  output MISO_reg_0;
  output tx_valid;
  input clk_IBUF_BUFG;
  input rst_n_IBUF;
  input \rx_data_reg[8] ;
  input rst_n;
  input [9:0]rx_data;
  input [0:0]WEA;
  input \counter_readdata_reg[1] ;
  input \counter_readdata_reg[0] ;
  input [0:0]E;
  input rx_valid;

  wire \<const0> ;
  wire \<const1> ;
  wire [0:0]E;
  wire MISO_reg;
  wire MISO_reg_0;
  wire [0:0]WEA;
  wire clk_IBUF_BUFG;
  wire \counter_readdata_reg[0] ;
  wire \counter_readdata_reg[1] ;
  wire rst_n;
  wire rst_n_IBUF;
  wire [9:0]rx_data;
  wire \rx_data_reg[8] ;
  wire rx_valid;
  wire [7:0]temp;
  wire [7:0]tx_data;
  wire tx_valid;
  wire tx_valid_i_1_n_0;

  GND GND
       (.G(\<const0> ));
  LUT6 #(
    .INIT(64'h505F3030505F3F3F)) 
    MISO_i_3
       (.I0(tx_data[7]),
        .I1(tx_data[6]),
        .I2(\counter_readdata_reg[1] ),
        .I3(tx_data[5]),
        .I4(\counter_readdata_reg[0] ),
        .I5(tx_data[4]),
        .O(MISO_reg_0));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    MISO_i_4
       (.I0(tx_data[3]),
        .I1(tx_data[2]),
        .I2(\counter_readdata_reg[1] ),
        .I3(tx_data[1]),
        .I4(\counter_readdata_reg[0] ),
        .I5(tx_data[0]),
        .O(MISO_reg));
  VCC VCC
       (.P(\<const1> ));
  (* \MEM.PORTA.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* \MEM.PORTB.DATA_BIT_LAYOUT  = "p0_d8" *) 
  (* METHODOLOGY_DRC_VIOS = "{SYNTH-6 {cell *THIS*}}" *) 
  (* RTL_RAM_BITS = "2048" *) 
  (* RTL_RAM_NAME = "mem" *) 
  (* bram_addr_begin = "0" *) 
  (* bram_addr_end = "1023" *) 
  (* bram_slice_begin = "0" *) 
  (* bram_slice_end = "7" *) 
  RAMB18E1 #(
    .DOA_REG(0),
    .DOB_REG(0),
    .INITP_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INITP_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_00(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_01(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_02(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_03(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_04(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_05(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_06(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_07(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_08(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_09(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_0F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_10(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_11(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_12(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_13(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_14(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_15(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_16(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_17(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_18(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_19(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_1F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_20(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_21(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_22(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_23(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_24(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_25(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_26(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_27(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_28(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_29(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_2F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_30(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_31(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_32(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_33(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_34(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_35(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_36(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_37(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_38(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_39(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3A(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3B(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3C(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3D(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3E(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_3F(256'h0000000000000000000000000000000000000000000000000000000000000000),
    .INIT_A(18'h00000),
    .INIT_B(18'h00000),
    .INIT_FILE("NONE"),
    .RAM_MODE("TDP"),
    .RDADDR_COLLISION_HWCONFIG("DELAYED_WRITE"),
    .READ_WIDTH_A(18),
    .READ_WIDTH_B(18),
    .RSTREG_PRIORITY_A("RSTREG"),
    .RSTREG_PRIORITY_B("RSTREG"),
    .SIM_COLLISION_CHECK("ALL"),
    .SIM_DEVICE("7SERIES"),
    .SRVAL_A(18'h00000),
    .SRVAL_B(18'h00000),
    .WRITE_MODE_A("READ_FIRST"),
    .WRITE_MODE_B("WRITE_FIRST"),
    .WRITE_WIDTH_A(18),
    .WRITE_WIDTH_B(18)) 
    mem_reg
       (.ADDRARDADDR({\<const1> ,\<const1> ,temp,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .ADDRBWRADDR({\<const1> ,\<const1> ,temp,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .CLKARDCLK(clk_IBUF_BUFG),
        .CLKBWRCLK(clk_IBUF_BUFG),
        .DIADI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,rx_data[7:0]}),
        .DIBDI({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .DIPADIP({\<const0> ,\<const0> }),
        .DIPBDIP({\<const0> ,\<const0> }),
        .DOBDO(tx_data),
        .ENARDEN(rst_n_IBUF),
        .ENBWREN(\rx_data_reg[8] ),
        .REGCEAREGCE(\<const0> ),
        .REGCEB(\<const0> ),
        .RSTRAMARSTRAM(\<const0> ),
        .RSTRAMB(rst_n),
        .RSTREGARSTREG(\<const0> ),
        .RSTREGB(\<const0> ),
        .WEA({WEA,WEA}),
        .WEBWE({\<const0> ,\<const0> ,\<const0> ,\<const0> }));
  FDRE #(
    .INIT(1'b0)) 
    \temp_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(rx_data[0]),
        .Q(temp[0]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \temp_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(rx_data[1]),
        .Q(temp[1]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \temp_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(rx_data[2]),
        .Q(temp[2]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \temp_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(rx_data[3]),
        .Q(temp[3]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \temp_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(rx_data[4]),
        .Q(temp[4]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \temp_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(rx_data[5]),
        .Q(temp[5]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \temp_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(rx_data[6]),
        .Q(temp[6]),
        .R(\<const0> ));
  FDRE #(
    .INIT(1'b0)) 
    \temp_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(E),
        .D(rx_data[7]),
        .Q(temp[7]),
        .R(\<const0> ));
  LUT4 #(
    .INIT(16'h8F88)) 
    tx_valid_i_1
       (.I0(rx_data[9]),
        .I1(rx_data[8]),
        .I2(rx_valid),
        .I3(tx_valid),
        .O(tx_valid_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    tx_valid_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(tx_valid_i_1_n_0),
        .Q(tx_valid),
        .R(rst_n));
endmodule
