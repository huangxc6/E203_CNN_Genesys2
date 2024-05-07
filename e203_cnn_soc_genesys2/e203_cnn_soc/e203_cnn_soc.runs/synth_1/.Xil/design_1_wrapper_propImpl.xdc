set_property SRC_FILE_INFO {cfile:D:/BaiduSyncdisk/course/Software_Hardware_Co-Design/E203_CNN_Genesys2/e203_cnn_soc_genesys2/Genesys2_H.xdc rfile:../../../../Genesys2_H.xdc id:1} [current_design]
set_property src_info {type:XDC file:1 line:9 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN AD11  IOSTANDARD LVDS     } [get_ports { clk_in1_n_0 }]; #IO_L12N_T1_MRCC_33 Sch=sysclk_n
set_property src_info {type:XDC file:1 line:10 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN AD12  IOSTANDARD LVDS     } [get_ports { clk_in1_p_0 }]; #IO_L12P_T1_MRCC_33 Sch=sysclk_p
set_property src_info {type:XDC file:1 line:13 export:INPUT save:INPUT read:READ} [current_design]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets design_1_i/e203_axi_0/inst/IOBUF_jtag_TCK/O]
set_property src_info {type:XDC file:1 line:22 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN R19 IOSTANDARD LVCMOS33 } [get_ports mcu_rst ];
set_property src_info {type:XDC file:1 line:23 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN M19 IOSTANDARD LVCMOS12} [get_ports btnd_0]
set_property src_info {type:XDC file:1 line:24 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN M20 IOSTANDARD LVCMOS12} [get_ports btnl_0]
set_property src_info {type:XDC file:1 line:25 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN C19 IOSTANDARD LVCMOS12} [get_ports btnr_0]
set_property src_info {type:XDC file:1 line:26 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN B19 IOSTANDARD LVCMOS12} [get_ports btnu_0]
set_property src_info {type:XDC file:1 line:38 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN T28   IOSTANDARD LVCMOS33 } [get_ports { led_0[0] }]; #IO_L11N_T1_SRCC_14 Sch=led[0]
set_property src_info {type:XDC file:1 line:39 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V19   IOSTANDARD LVCMOS33 } [get_ports { led_0[1] }]; #IO_L19P_T3_A10_D26_14 Sch=led[1]
set_property src_info {type:XDC file:1 line:40 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U30   IOSTANDARD LVCMOS33 } [get_ports { led_0[2] }]; #IO_L15N_T2_DQS_DOUT_CSO_B_14 Sch=led[2]
set_property src_info {type:XDC file:1 line:41 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U29   IOSTANDARD LVCMOS33 } [get_ports { led_0[3] }]; #IO_L15P_T2_DQS_RDWR_B_14 Sch=led[3]
set_property src_info {type:XDC file:1 line:42 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V20   IOSTANDARD LVCMOS33 } [get_ports { led_0[4] }]; #IO_L19N_T3_A09_D25_VREF_14 Sch=led[4]
set_property src_info {type:XDC file:1 line:43 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V26   IOSTANDARD LVCMOS33 } [get_ports { led_0[5] }]; #IO_L16P_T2_CSI_B_14 Sch=led[5]
set_property src_info {type:XDC file:1 line:44 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN W24   IOSTANDARD LVCMOS33 } [get_ports { led_0[6] }]; #IO_L20N_T3_A07_D23_14 Sch=led[6]
set_property src_info {type:XDC file:1 line:45 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN W23   IOSTANDARD LVCMOS33 } [get_ports { led_0[7] }]; #IO_L20P_T3_A08_D24_14 Sch=led[7]
set_property src_info {type:XDC file:1 line:51 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN P27 IOSTANDARD LVCMOS33 } [get_ports mcu_wakeup_0]; #mcu_wakeup Sch=sw[7]
set_property src_info {type:XDC file:1 line:63 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN G19 IOSTANDARD LVCMOS12} [get_ports {sw_0[0]}]
set_property src_info {type:XDC file:1 line:64 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN G25 IOSTANDARD LVCMOS12} [get_ports {sw_0[1]}]
set_property src_info {type:XDC file:1 line:65 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN H24 IOSTANDARD LVCMOS12} [get_ports {sw_0[2]}]
set_property src_info {type:XDC file:1 line:66 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN K19 IOSTANDARD LVCMOS12} [get_ports {sw_0[3]}]
set_property src_info {type:XDC file:1 line:67 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN N19 IOSTANDARD LVCMOS12} [get_ports {sw_0[4]}]
set_property src_info {type:XDC file:1 line:68 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN P19 IOSTANDARD LVCMOS12} [get_ports {sw_0[5]}]
set_property src_info {type:XDC file:1 line:69 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict {PACKAGE_PIN P26 IOSTANDARD LVCMOS33} [get_ports {sw_0[6]}]
set_property src_info {type:XDC file:1 line:78 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN Y23   IOSTANDARD LVCMOS33 } [get_ports { uart2_rx }]; #IO_L1P_T0_12 Sch=uart_rx_out
set_property src_info {type:XDC file:1 line:79 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN Y20   IOSTANDARD LVCMOS33 } [get_ports { uart2_tx }]; #IO_0_12 Sch=uart_tx_in
set_property src_info {type:XDC file:1 line:221 export:INPUT save:INPUT read:READ} [current_design]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets dut_io_pads_jtag_TCK_i_ival]
set_property src_info {type:XDC file:1 line:222 export:INPUT save:INPUT read:READ} [current_design]
set_property CLOCK_DEDICATED_ROUTE FALSE [get_nets IOBUF_jtag_TCK/O]
set_property src_info {type:XDC file:1 line:224 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN W21 IOSTANDARD LVCMOS33 } [get_ports mcu_TCK_0]; #jd[10] = mcu_TCK
set_property src_info {type:XDC file:1 line:225 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V22 IOSTANDARD LVCMOS33 } [get_ports mcu_TDO_0]; #jd[9] = mcu_TDO
set_property src_info {type:XDC file:1 line:226 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN Y26 IOSTANDARD LVCMOS33 } [get_ports mcu_TMS_0]; #jd[8] = mcu_TMS
set_property src_info {type:XDC file:1 line:227 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U24 IOSTANDARD LVCMOS33 } [get_ports mcu_TDI_0]; #jd[7] = mcu_TDI
set_property src_info {type:XDC file:1 line:228 export:INPUT save:INPUT read:READ} [current_design]
set_property KEEPER true [get_ports mcu_TMS]
set_property src_info {type:XDC file:1 line:232 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN W22 IOSTANDARD LVCMOS33 } [get_ports uart0_rx_0]; #jd[4] = UART_RX
set_property src_info {type:XDC file:1 line:233 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN V24 IOSTANDARD LVCMOS33 } [get_ports uart0_tx_0]; #jd[3]= UART_TX
set_property src_info {type:XDC file:1 line:459 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U19 IOSTANDARD LVCMOS33 } [get_ports { qspi0_cs_0  }];
set_property src_info {type:XDC file:1 line:460 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN P24 IOSTANDARD LVCMOS33 } [get_ports {qspi0_dq_0[0]}];
set_property src_info {type:XDC file:1 line:461 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN R25 IOSTANDARD LVCMOS33 } [get_ports {qspi0_dq_0[1]}];
set_property src_info {type:XDC file:1 line:462 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN R20 IOSTANDARD LVCMOS33 } [get_ports {qspi0_dq_0[2]}];
set_property src_info {type:XDC file:1 line:463 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN R21 IOSTANDARD LVCMOS33 } [get_ports {qspi0_dq_0[3]}];
