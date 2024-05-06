// (c) Copyright 1995-2024 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:user:e203_axi:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_e203_axi_0_1 (
  clk200M,
  mcu_rst,
  qspi0_cs,
  qspi0_dq,
  btnd,
  btnl,
  btnr,
  btnu,
  uart0_rx,
  uart0_tx,
  sw,
  mcu_TDO,
  mcu_TCK,
  mcu_TDI,
  mcu_TMS,
  expl_axi_arvalid,
  expl_axi_arready,
  expl_axi_araddr,
  expl_axi_arcache,
  expl_axi_arprot,
  expl_axi_arlock,
  expl_axi_arburst,
  expl_axi_arlen,
  expl_axi_arsize,
  expl_axi_awvalid,
  expl_axi_awready,
  expl_axi_awaddr,
  expl_axi_awcache,
  expl_axi_awprot,
  expl_axi_awlock,
  expl_axi_awburst,
  expl_axi_awlen,
  expl_axi_awsize,
  expl_axi_rvalid,
  expl_axi_rready,
  expl_axi_rdata,
  expl_axi_rresp,
  expl_axi_rlast,
  expl_axi_wvalid,
  expl_axi_wready,
  expl_axi_wdata,
  expl_axi_wstrb,
  expl_axi_wlast,
  expl_axi_bvalid,
  expl_axi_bready,
  expl_axi_bresp,
  aclk,
  ck_rst,
  aresetn,
  mcu_wakeup
);

input wire clk200M;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME mcu_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 mcu_rst RST" *)
input wire mcu_rst;
output wire qspi0_cs;
inout wire [3 : 0] qspi0_dq;
inout wire btnd;
inout wire btnl;
inout wire btnr;
inout wire btnu;
inout wire uart0_rx;
inout wire uart0_tx;
inout wire [6 : 0] sw;
inout wire mcu_TDO;
inout wire mcu_TCK;
inout wire mcu_TDI;
inout wire mcu_TMS;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi ARVALID" *)
output wire expl_axi_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi ARREADY" *)
input wire expl_axi_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi ARADDR" *)
output wire [31 : 0] expl_axi_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi ARCACHE" *)
output wire [3 : 0] expl_axi_arcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi ARPROT" *)
output wire [2 : 0] expl_axi_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi ARLOCK" *)
output wire [1 : 0] expl_axi_arlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi ARBURST" *)
output wire [1 : 0] expl_axi_arburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi ARLEN" *)
output wire [3 : 0] expl_axi_arlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi ARSIZE" *)
output wire [2 : 0] expl_axi_arsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi AWVALID" *)
output wire expl_axi_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi AWREADY" *)
input wire expl_axi_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi AWADDR" *)
output wire [31 : 0] expl_axi_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi AWCACHE" *)
output wire [3 : 0] expl_axi_awcache;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi AWPROT" *)
output wire [2 : 0] expl_axi_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi AWLOCK" *)
output wire [1 : 0] expl_axi_awlock;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi AWBURST" *)
output wire [1 : 0] expl_axi_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi AWLEN" *)
output wire [3 : 0] expl_axi_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi AWSIZE" *)
output wire [2 : 0] expl_axi_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi RVALID" *)
input wire expl_axi_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi RREADY" *)
output wire expl_axi_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi RDATA" *)
input wire [31 : 0] expl_axi_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi RRESP" *)
input wire [1 : 0] expl_axi_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi RLAST" *)
input wire expl_axi_rlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi WVALID" *)
output wire expl_axi_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi WREADY" *)
input wire expl_axi_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi WDATA" *)
output wire [31 : 0] expl_axi_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi WSTRB" *)
output wire [3 : 0] expl_axi_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi WLAST" *)
output wire expl_axi_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi BVALID" *)
input wire expl_axi_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi BREADY" *)
output wire expl_axi_bready;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME expl_axi, DATA_WIDTH 32, PROTOCOL AXI3, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 1, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 16, PHASE 0.000, CLK_DOMAIN design_1_e203_axi_0_1_aclk, NUM_READ_THREADS 1, NUM_WRITE_\
THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 expl_axi BRESP" *)
input wire [1 : 0] expl_axi_bresp;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF expl_axi, ASSOCIATED_RESET aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.000, CLK_DOMAIN design_1_e203_axi_0_1_aclk, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *)
output wire aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ck_rst, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ck_rst RST" *)
output wire ck_rst;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *)
output wire aresetn;
inout wire mcu_wakeup;

  system inst (
    .clk200M(clk200M),
    .mcu_rst(mcu_rst),
    .qspi0_cs(qspi0_cs),
    .qspi0_dq(qspi0_dq),
    .btnd(btnd),
    .btnl(btnl),
    .btnr(btnr),
    .btnu(btnu),
    .uart0_rx(uart0_rx),
    .uart0_tx(uart0_tx),
    .sw(sw),
    .mcu_TDO(mcu_TDO),
    .mcu_TCK(mcu_TCK),
    .mcu_TDI(mcu_TDI),
    .mcu_TMS(mcu_TMS),
    .expl_axi_arvalid(expl_axi_arvalid),
    .expl_axi_arready(expl_axi_arready),
    .expl_axi_araddr(expl_axi_araddr),
    .expl_axi_arcache(expl_axi_arcache),
    .expl_axi_arprot(expl_axi_arprot),
    .expl_axi_arlock(expl_axi_arlock),
    .expl_axi_arburst(expl_axi_arburst),
    .expl_axi_arlen(expl_axi_arlen),
    .expl_axi_arsize(expl_axi_arsize),
    .expl_axi_awvalid(expl_axi_awvalid),
    .expl_axi_awready(expl_axi_awready),
    .expl_axi_awaddr(expl_axi_awaddr),
    .expl_axi_awcache(expl_axi_awcache),
    .expl_axi_awprot(expl_axi_awprot),
    .expl_axi_awlock(expl_axi_awlock),
    .expl_axi_awburst(expl_axi_awburst),
    .expl_axi_awlen(expl_axi_awlen),
    .expl_axi_awsize(expl_axi_awsize),
    .expl_axi_rvalid(expl_axi_rvalid),
    .expl_axi_rready(expl_axi_rready),
    .expl_axi_rdata(expl_axi_rdata),
    .expl_axi_rresp(expl_axi_rresp),
    .expl_axi_rlast(expl_axi_rlast),
    .expl_axi_wvalid(expl_axi_wvalid),
    .expl_axi_wready(expl_axi_wready),
    .expl_axi_wdata(expl_axi_wdata),
    .expl_axi_wstrb(expl_axi_wstrb),
    .expl_axi_wlast(expl_axi_wlast),
    .expl_axi_bvalid(expl_axi_bvalid),
    .expl_axi_bready(expl_axi_bready),
    .expl_axi_bresp(expl_axi_bresp),
    .aclk(aclk),
    .ck_rst(ck_rst),
    .aresetn(aresetn),
    .mcu_wakeup(mcu_wakeup)
  );
endmodule
