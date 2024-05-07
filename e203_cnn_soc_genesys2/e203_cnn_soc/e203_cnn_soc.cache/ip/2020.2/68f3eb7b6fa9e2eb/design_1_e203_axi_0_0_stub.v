// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Tue May  7 09:27:05 2024
// Host        : DESKTOP-OCH9RL1 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_e203_axi_0_0_stub.v
// Design      : design_1_e203_axi_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k325tffg900-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "system,Vivado 2020.2" *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix(clk200M, mcu_rst, qspi0_cs, qspi0_dq, btnd, btnl, 
  btnr, btnu, uart0_rx, uart0_tx, sw, mcu_TDO, mcu_TCK, mcu_TDI, mcu_TMS, expl_axi_arvalid, 
  expl_axi_arready, expl_axi_araddr, expl_axi_arcache, expl_axi_arprot, expl_axi_arlock, 
  expl_axi_arburst, expl_axi_arlen, expl_axi_arsize, expl_axi_awvalid, expl_axi_awready, 
  expl_axi_awaddr, expl_axi_awcache, expl_axi_awprot, expl_axi_awlock, expl_axi_awburst, 
  expl_axi_awlen, expl_axi_awsize, expl_axi_rvalid, expl_axi_rready, expl_axi_rdata, 
  expl_axi_rresp, expl_axi_rlast, expl_axi_wvalid, expl_axi_wready, expl_axi_wdata, 
  expl_axi_wstrb, expl_axi_wlast, expl_axi_bvalid, expl_axi_bready, expl_axi_bresp, aclk, 
  ck_rst, aresetn, mcu_wakeup)
/* synthesis syn_black_box black_box_pad_pin="clk200M,mcu_rst,qspi0_cs,qspi0_dq[3:0],btnd,btnl,btnr,btnu,uart0_rx,uart0_tx,sw[6:0],mcu_TDO,mcu_TCK,mcu_TDI,mcu_TMS,expl_axi_arvalid,expl_axi_arready,expl_axi_araddr[31:0],expl_axi_arcache[3:0],expl_axi_arprot[2:0],expl_axi_arlock[1:0],expl_axi_arburst[1:0],expl_axi_arlen[3:0],expl_axi_arsize[2:0],expl_axi_awvalid,expl_axi_awready,expl_axi_awaddr[31:0],expl_axi_awcache[3:0],expl_axi_awprot[2:0],expl_axi_awlock[1:0],expl_axi_awburst[1:0],expl_axi_awlen[3:0],expl_axi_awsize[2:0],expl_axi_rvalid,expl_axi_rready,expl_axi_rdata[31:0],expl_axi_rresp[1:0],expl_axi_rlast,expl_axi_wvalid,expl_axi_wready,expl_axi_wdata[31:0],expl_axi_wstrb[3:0],expl_axi_wlast,expl_axi_bvalid,expl_axi_bready,expl_axi_bresp[1:0],aclk,ck_rst,aresetn,mcu_wakeup" */;
  input clk200M;
  input mcu_rst;
  output qspi0_cs;
  inout [3:0]qspi0_dq;
  inout btnd;
  inout btnl;
  inout btnr;
  inout btnu;
  inout uart0_rx;
  inout uart0_tx;
  inout [6:0]sw;
  inout mcu_TDO;
  inout mcu_TCK;
  inout mcu_TDI;
  inout mcu_TMS;
  output expl_axi_arvalid;
  input expl_axi_arready;
  output [31:0]expl_axi_araddr;
  output [3:0]expl_axi_arcache;
  output [2:0]expl_axi_arprot;
  output [1:0]expl_axi_arlock;
  output [1:0]expl_axi_arburst;
  output [3:0]expl_axi_arlen;
  output [2:0]expl_axi_arsize;
  output expl_axi_awvalid;
  input expl_axi_awready;
  output [31:0]expl_axi_awaddr;
  output [3:0]expl_axi_awcache;
  output [2:0]expl_axi_awprot;
  output [1:0]expl_axi_awlock;
  output [1:0]expl_axi_awburst;
  output [3:0]expl_axi_awlen;
  output [2:0]expl_axi_awsize;
  input expl_axi_rvalid;
  output expl_axi_rready;
  input [31:0]expl_axi_rdata;
  input [1:0]expl_axi_rresp;
  input expl_axi_rlast;
  output expl_axi_wvalid;
  input expl_axi_wready;
  output [31:0]expl_axi_wdata;
  output [3:0]expl_axi_wstrb;
  output expl_axi_wlast;
  input expl_axi_bvalid;
  output expl_axi_bready;
  input [1:0]expl_axi_bresp;
  output aclk;
  output ck_rst;
  output aresetn;
  inout mcu_wakeup;
endmodule
