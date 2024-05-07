//Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
//Date        : Tue May  7 09:21:38 2024
//Host        : DESKTOP-OCH9RL1 running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (btnd_0,
    btnl_0,
    btnr_0,
    btnu_0,
    clk_in1_n_0,
    clk_in1_p_0,
    led_0,
    mcu_TCK_0,
    mcu_TDI_0,
    mcu_TDO_0,
    mcu_TMS_0,
    mcu_rst,
    mcu_wakeup_0,
    qspi0_cs_0,
    qspi0_dq_0,
    sw_0,
    uart0_rx_0,
    uart0_tx_0);
  inout btnd_0;
  inout btnl_0;
  inout btnr_0;
  inout btnu_0;
  input clk_in1_n_0;
  input clk_in1_p_0;
  output [7:0]led_0;
  inout mcu_TCK_0;
  inout mcu_TDI_0;
  inout mcu_TDO_0;
  inout mcu_TMS_0;
  input mcu_rst;
  inout mcu_wakeup_0;
  output qspi0_cs_0;
  inout [3:0]qspi0_dq_0;
  inout [6:0]sw_0;
  inout uart0_rx_0;
  inout uart0_tx_0;

  wire btnd_0;
  wire btnl_0;
  wire btnr_0;
  wire btnu_0;
  wire clk_in1_n_0;
  wire clk_in1_p_0;
  wire [7:0]led_0;
  wire mcu_TCK_0;
  wire mcu_TDI_0;
  wire mcu_TDO_0;
  wire mcu_TMS_0;
  wire mcu_rst;
  wire mcu_wakeup_0;
  wire qspi0_cs_0;
  wire [3:0]qspi0_dq_0;
  wire [6:0]sw_0;
  wire uart0_rx_0;
  wire uart0_tx_0;

  design_1 design_1_i
       (.btnd_0(btnd_0),
        .btnl_0(btnl_0),
        .btnr_0(btnr_0),
        .btnu_0(btnu_0),
        .clk_in1_n_0(clk_in1_n_0),
        .clk_in1_p_0(clk_in1_p_0),
        .led_0(led_0),
        .mcu_TCK_0(mcu_TCK_0),
        .mcu_TDI_0(mcu_TDI_0),
        .mcu_TDO_0(mcu_TDO_0),
        .mcu_TMS_0(mcu_TMS_0),
        .mcu_rst(mcu_rst),
        .mcu_wakeup_0(mcu_wakeup_0),
        .qspi0_cs_0(qspi0_cs_0),
        .qspi0_dq_0(qspi0_dq_0),
        .sw_0(sw_0),
        .uart0_rx_0(uart0_rx_0),
        .uart0_tx_0(uart0_tx_0));
endmodule
