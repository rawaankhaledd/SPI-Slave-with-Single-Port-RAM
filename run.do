vlib work
vlog spi_wrapper.v spiwrapper_tb.v
vsim -voptargs=+acc work.spiwrapper_tb
add wave *
add wave -position insertpoint  \
sim:/spiwrapper_tb/DUT/tx_valid
add wave -position insertpoint  \
sim:/spiwrapper_tb/DUT/rx_valid
add wave -position insertpoint  \
sim:/spiwrapper_tb/DUT/tx_data
add wave -position insertpoint  \
sim:/spiwrapper_tb/DUT/RAM/dout
add wave -position insertpoint  \
sim:/spiwrapper_tb/DUT/rx_data
add wave -position insertpoint  \
sim:/spiwrapper_tb/DUT/RAM/din
add wave -position insertpoint  \
sim:/spiwrapper_tb/DUT/RAM/mem
add wave -position insertpoint  \
sim:/spiwrapper_tb/DUT/spi/counter
add wave -position insertpoint  \
sim:/spiwrapper_tb/DUT/spi/add_data
add wave -position insertpoint  \
sim:/spiwrapper_tb/DUT/spi/counter_readdata
add wave -position insertpoint  \
sim:/spiwrapper_tb/DUT/RAM/temp
run -all
#quit -sim