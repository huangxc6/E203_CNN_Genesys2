onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -L xpm -L xil_defaultlib -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_13 -L axi_lite_ipif_v3_0_4 -L interrupt_control_v3_1_4 -L axi_gpio_v2_0_24 -L axi_infrastructure_v1_1_0 -L fifo_generator_v13_2_5 -L axi_clock_converter_v2_1_21 -L generic_baseblocks_v2_1_0 -L axi_data_fifo_v2_1_21 -L axi_register_slice_v2_1_22 -L axi_protocol_converter_v2_1_22 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib.design_1 xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {design_1.udo}

run -all

quit -force
