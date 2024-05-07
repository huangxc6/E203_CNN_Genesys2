vlib work
vlib activehdl

vlib activehdl/xpm
vlib activehdl/xil_defaultlib
vlib activehdl/lib_cdc_v1_0_2
vlib activehdl/proc_sys_reset_v5_0_13
vlib activehdl/axi_infrastructure_v1_1_0
vlib activehdl/fifo_generator_v13_2_5
vlib activehdl/axi_clock_converter_v2_1_21
vlib activehdl/generic_baseblocks_v2_1_0
vlib activehdl/axi_data_fifo_v2_1_21
vlib activehdl/axi_register_slice_v2_1_22
vlib activehdl/axi_protocol_converter_v2_1_22

vmap xpm activehdl/xpm
vmap xil_defaultlib activehdl/xil_defaultlib
vmap lib_cdc_v1_0_2 activehdl/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_13 activehdl/proc_sys_reset_v5_0_13
vmap axi_infrastructure_v1_1_0 activehdl/axi_infrastructure_v1_1_0
vmap fifo_generator_v13_2_5 activehdl/fifo_generator_v13_2_5
vmap axi_clock_converter_v2_1_21 activehdl/axi_clock_converter_v2_1_21
vmap generic_baseblocks_v2_1_0 activehdl/generic_baseblocks_v2_1_0
vmap axi_data_fifo_v2_1_21 activehdl/axi_data_fifo_v2_1_21
vmap axi_register_slice_v2_1_22 activehdl/axi_register_slice_v2_1_22
vmap axi_protocol_converter_v2_1_22 activehdl/axi_protocol_converter_v2_1_22

vlog -work xpm  -sv2k12 "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ip/design_1_e203_axi_0_0/src/clk_wiz_0" "+incdir+../../../bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/d0f7" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"C:/Xilinx/Vivado/2020.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ip/design_1_e203_axi_0_0/src/clk_wiz_0" "+incdir+../../../bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/d0f7" \
"../../../bd/design_1/ip/design_1_e203_axi_0_0/src/clk_wiz_0/clk_wiz_0_clk_wiz.v" \
"../../../bd/design_1/ip/design_1_e203_axi_0_0/src/clk_wiz_0/clk_wiz_0.v" \
"../../../bd/design_1/ipshared/5244/src/adv_timer_apb_if.v" \
"../../../bd/design_1/ipshared/5244/src/apb_adv_timer.v" \
"../../../bd/design_1/ipshared/5244/src/apb_gpio.v" \
"../../../bd/design_1/ipshared/5244/src/apb_i2c.v" \
"../../../bd/design_1/ipshared/5244/src/apb_spi_master.v" \
"../../../bd/design_1/ipshared/5244/src/apb_uart.v" \
"../../../bd/design_1/ipshared/5244/src/comparator.v" \
"../../../bd/design_1/ipshared/5244/src/e203_biu.v" \
"../../../bd/design_1/ipshared/5244/src/e203_clk_ctrl.v" \
"../../../bd/design_1/ipshared/5244/src/e203_clkgate.v" \
"../../../bd/design_1/ipshared/5244/src/e203_core.v" \
"../../../bd/design_1/ipshared/5244/src/e203_cpu.v" \
"../../../bd/design_1/ipshared/5244/src/e203_cpu_top.v" \
"../../../bd/design_1/ipshared/5244/src/e203_dtcm_ctrl.v" \
"../../../bd/design_1/ipshared/5244/src/e203_dtcm_ram.v" \
"../../../bd/design_1/ipshared/5244/src/e203_exu.v" \
"../../../bd/design_1/ipshared/5244/src/e203_exu_alu.v" \
"../../../bd/design_1/ipshared/5244/src/e203_exu_alu_bjp.v" \
"../../../bd/design_1/ipshared/5244/src/e203_exu_alu_csrctrl.v" \
"../../../bd/design_1/ipshared/5244/src/e203_exu_alu_dpath.v" \
"../../../bd/design_1/ipshared/5244/src/e203_exu_alu_lsuagu.v" \
"../../../bd/design_1/ipshared/5244/src/e203_exu_alu_muldiv.v" \
"../../../bd/design_1/ipshared/5244/src/e203_exu_alu_rglr.v" \
"../../../bd/design_1/ipshared/5244/src/e203_exu_branchslv.v" \
"../../../bd/design_1/ipshared/5244/src/e203_exu_commit.v" \
"../../../bd/design_1/ipshared/5244/src/e203_exu_csr.v" \
"../../../bd/design_1/ipshared/5244/src/e203_exu_decode.v" \
"../../../bd/design_1/ipshared/5244/src/e203_exu_disp.v" \
"../../../bd/design_1/ipshared/5244/src/e203_exu_excp.v" \
"../../../bd/design_1/ipshared/5244/src/e203_exu_longpwbck.v" \
"../../../bd/design_1/ipshared/5244/src/e203_exu_nice.v" \
"../../../bd/design_1/ipshared/5244/src/e203_exu_oitf.v" \
"../../../bd/design_1/ipshared/5244/src/e203_exu_regfile.v" \
"../../../bd/design_1/ipshared/5244/src/e203_exu_wbck.v" \
"../../../bd/design_1/ipshared/5244/src/e203_ifu.v" \
"../../../bd/design_1/ipshared/5244/src/e203_ifu_ifetch.v" \
"../../../bd/design_1/ipshared/5244/src/e203_ifu_ift2icb.v" \
"../../../bd/design_1/ipshared/5244/src/e203_ifu_litebpu.v" \
"../../../bd/design_1/ipshared/5244/src/e203_ifu_minidec.v" \
"../../../bd/design_1/ipshared/5244/src/e203_irq_sync.v" \
"../../../bd/design_1/ipshared/5244/src/e203_itcm_ctrl.v" \
"../../../bd/design_1/ipshared/5244/src/e203_itcm_ram.v" \
"../../../bd/design_1/ipshared/5244/src/e203_lsu.v" \
"../../../bd/design_1/ipshared/5244/src/e203_lsu_ctrl.v" \
"../../../bd/design_1/ipshared/5244/src/e203_reset_ctrl.v" \
"../../../bd/design_1/ipshared/5244/src/e203_soc_top.v" \
"../../../bd/design_1/ipshared/5244/src/e203_srams.v" \
"../../../bd/design_1/ipshared/5244/src/e203_subsys_clint.v" \
"../../../bd/design_1/ipshared/5244/src/e203_subsys_gfcm.v" \
"../../../bd/design_1/ipshared/5244/src/e203_subsys_hclkgen.v" \
"../../../bd/design_1/ipshared/5244/src/e203_subsys_hclkgen_rstsync.v" \
"../../../bd/design_1/ipshared/5244/src/e203_subsys_main.v" \
"../../../bd/design_1/ipshared/5244/src/e203_subsys_mems.v" \
"../../../bd/design_1/ipshared/5244/src/e203_subsys_nice_core.v" \
"../../../bd/design_1/ipshared/5244/src/e203_subsys_perips.v" \
"../../../bd/design_1/ipshared/5244/src/e203_subsys_plic.v" \
"../../../bd/design_1/ipshared/5244/src/e203_subsys_pll.v" \
"../../../bd/design_1/ipshared/5244/src/e203_subsys_pllclkdiv.v" \
"../../../bd/design_1/ipshared/5244/src/e203_subsys_top.v" \
"../../../bd/design_1/ipshared/5244/src/i2c_master_bit_ctrl.v" \
"../../../bd/design_1/ipshared/5244/src/i2c_master_byte_ctrl.v" \
"../../../bd/design_1/ipshared/5244/src/input_stage.v" \
"../../../bd/design_1/ipshared/5244/src/io_generic_fifo.v" \
"../../../bd/design_1/ipshared/5244/src/prescaler.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_1cyc_sram_ctrl.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_AsyncResetReg.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_AsyncResetRegVec.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_AsyncResetRegVec_1.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_AsyncResetRegVec_129.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_AsyncResetRegVec_36.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_DeglitchShiftRegister.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_LevelGateway.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_ResetCatchAndSync.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_ResetCatchAndSync_2.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_aon.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_aon_lclkgen_regs.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_aon_porrst.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_aon_top.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_aon_wrapper.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_clint.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_clint_top.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_debug_csr.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_debug_module.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_debug_ram.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_debug_rom.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_expl_axi_slv.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_flash_qspi.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_flash_qspi_top.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_gnrl_bufs.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_gnrl_dffs.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_gnrl_icbs.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_gnrl_ram.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_hclkgen_regs.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_icb1to16_bus.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_icb1to2_bus.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_icb1to8_bus.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_jtag_dtm.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_jtaggpioport.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_mrom.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_mrom_top.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_plic_man.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_plic_top.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_pmu.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_pmu_core.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_qspi_arbiter.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_qspi_fifo.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_qspi_media.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_qspi_physical.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_queue.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_queue_1.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_repeater_6.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_rtc.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_sim_ram.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_spi_flashmap.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_sram_icb_ctrl.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_tl_repeater_5.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_tlfragmenter_qspi_1.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_tlwidthwidget_qspi.v" \
"../../../bd/design_1/ipshared/5244/src/sirv_wdog.v" \
"../../../bd/design_1/ipshared/5244/src/spi_master_apb_if.v" \
"../../../bd/design_1/ipshared/5244/src/spi_master_clkgen.v" \
"../../../bd/design_1/ipshared/5244/src/spi_master_controller.v" \
"../../../bd/design_1/ipshared/5244/src/spi_master_fifo.v" \
"../../../bd/design_1/ipshared/5244/src/spi_master_rx.v" \
"../../../bd/design_1/ipshared/5244/src/spi_master_tx.v" \
"../../../bd/design_1/ipshared/5244/src/timer_cntrl.v" \
"../../../bd/design_1/ipshared/5244/src/timer_module.v" \
"../../../bd/design_1/ipshared/5244/src/uart_interrupt.v" \
"../../../bd/design_1/ipshared/5244/src/uart_rx.v" \
"../../../bd/design_1/ipshared/5244/src/uart_tx.v" \
"../../../bd/design_1/ipshared/5244/src/up_down_counter.v" \
"../../../bd/design_1/ipshared/5244/src/system.v" \
"../../../bd/design_1/ip/design_1_e203_axi_0_0/sim/design_1_e203_axi_0_0.v" \
"../../../bd/design_1/ipshared/a68b/hdl/conv_axi_v2_v1_0_S00_AXI.v" \

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ip/design_1_e203_axi_0_0/src/clk_wiz_0" "+incdir+../../../bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/d0f7" \
"../../../bd/design_1/ipshared/a68b/src/acc_reg.sv" \
"../../../bd/design_1/ipshared/a68b/src/controller.sv" \
"../../../bd/design_1/ipshared/a68b/src/conv_pe.sv" \
"../../../bd/design_1/ipshared/a68b/src/im2col.sv" \
"../../../bd/design_1/ipshared/a68b/src/img_buffer.sv" \
"../../../bd/design_1/ipshared/a68b/src/input_buffer.sv" \
"../../../bd/design_1/ipshared/a68b/src/lib_fifo.sv" \
"../../../bd/design_1/ipshared/a68b/src/lib_reg.sv" \
"../../../bd/design_1/ipshared/a68b/src/matu.sv" \
"../../../bd/design_1/ipshared/a68b/src/output_buffer.sv" \
"../../../bd/design_1/ipshared/a68b/src/pe.sv" \
"../../../bd/design_1/ipshared/a68b/src/reorder.sv" \
"../../../bd/design_1/ipshared/a68b/src/sa.sv" \
"../../../bd/design_1/ipshared/a68b/src/top_conv_acc.sv" \
"../../../bd/design_1/ipshared/a68b/src/top_conv_fc.sv" \
"../../../bd/design_1/ipshared/a68b/src/top_im2col.sv" \
"../../../bd/design_1/ipshared/a68b/src/weight_buffer.sv" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ip/design_1_e203_axi_0_0/src/clk_wiz_0" "+incdir+../../../bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/d0f7" \
"../../../bd/design_1/ipshared/a68b/hdl/conv_axi_v2_v1_0.v" \
"../../../bd/design_1/ip/design_1_conv_axi_v2_0_0/sim/design_1_conv_axi_v2_0_0.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_clk_wiz.v" \
"../../../bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0.v" \

vcom -work lib_cdc_v1_0_2 -93 \
"../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_13 -93 \
"../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -93 \
"../../../bd/design_1/ip/design_1_proc_sys_reset_0_0/sim/design_1_proc_sys_reset_0_0.vhd" \

vlog -work axi_infrastructure_v1_1_0  -v2k5 "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ip/design_1_e203_axi_0_0/src/clk_wiz_0" "+incdir+../../../bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/d0f7" \
"../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ip/design_1_e203_axi_0_0/src/clk_wiz_0" "+incdir+../../../bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/d0f7" \
"../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/276e/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_5 -93 \
"../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/276e/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_5  -v2k5 "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ip/design_1_e203_axi_0_0/src/clk_wiz_0" "+incdir+../../../bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/d0f7" \
"../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/276e/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_clock_converter_v2_1_21  -v2k5 "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ip/design_1_e203_axi_0_0/src/clk_wiz_0" "+incdir+../../../bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/d0f7" \
"../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/1304/hdl/axi_clock_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ip/design_1_e203_axi_0_0/src/clk_wiz_0" "+incdir+../../../bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/d0f7" \
"../../../bd/design_1/ip/design_1_auto_cc_0/sim/design_1_auto_cc_0.v" \

vlog -work generic_baseblocks_v2_1_0  -v2k5 "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ip/design_1_e203_axi_0_0/src/clk_wiz_0" "+incdir+../../../bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/d0f7" \
"../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work axi_data_fifo_v2_1_21  -v2k5 "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ip/design_1_e203_axi_0_0/src/clk_wiz_0" "+incdir+../../../bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/d0f7" \
"../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/54c0/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_22  -v2k5 "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ip/design_1_e203_axi_0_0/src/clk_wiz_0" "+incdir+../../../bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/d0f7" \
"../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/af2c/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_22  -v2k5 "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ip/design_1_e203_axi_0_0/src/clk_wiz_0" "+incdir+../../../bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/d0f7" \
"../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/5cee/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ip/design_1_e203_axi_0_0/src/clk_wiz_0" "+incdir+../../../bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/ec67/hdl" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/5244/src" "+incdir+../../../../e203_cnn_soc.gen/sources_1/bd/design_1/ipshared/d0f7" \
"../../../bd/design_1/ip/design_1_auto_pc_0/sim/design_1_auto_pc_0.v" \
"../../../bd/design_1/sim/design_1.v" \

vlog -work xil_defaultlib \
"glbl.v"
