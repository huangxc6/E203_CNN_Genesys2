-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
-- Date        : Tue May  7 09:27:05 2024
-- Host        : DESKTOP-OCH9RL1 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
--               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_e203_axi_0_0_stub.vhdl
-- Design      : design_1_e203_axi_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k325tffg900-2
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
  Port ( 
    clk200M : in STD_LOGIC;
    mcu_rst : in STD_LOGIC;
    qspi0_cs : out STD_LOGIC;
    qspi0_dq : inout STD_LOGIC_VECTOR ( 3 downto 0 );
    btnd : inout STD_LOGIC;
    btnl : inout STD_LOGIC;
    btnr : inout STD_LOGIC;
    btnu : inout STD_LOGIC;
    uart0_rx : inout STD_LOGIC;
    uart0_tx : inout STD_LOGIC;
    sw : inout STD_LOGIC_VECTOR ( 6 downto 0 );
    mcu_TDO : inout STD_LOGIC;
    mcu_TCK : inout STD_LOGIC;
    mcu_TDI : inout STD_LOGIC;
    mcu_TMS : inout STD_LOGIC;
    expl_axi_arvalid : out STD_LOGIC;
    expl_axi_arready : in STD_LOGIC;
    expl_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    expl_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    expl_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    expl_axi_arlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    expl_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    expl_axi_arlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    expl_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    expl_axi_awvalid : out STD_LOGIC;
    expl_axi_awready : in STD_LOGIC;
    expl_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    expl_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    expl_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    expl_axi_awlock : out STD_LOGIC_VECTOR ( 1 downto 0 );
    expl_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    expl_axi_awlen : out STD_LOGIC_VECTOR ( 3 downto 0 );
    expl_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    expl_axi_rvalid : in STD_LOGIC;
    expl_axi_rready : out STD_LOGIC;
    expl_axi_rdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    expl_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    expl_axi_rlast : in STD_LOGIC;
    expl_axi_wvalid : out STD_LOGIC;
    expl_axi_wready : in STD_LOGIC;
    expl_axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    expl_axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    expl_axi_wlast : out STD_LOGIC;
    expl_axi_bvalid : in STD_LOGIC;
    expl_axi_bready : out STD_LOGIC;
    expl_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    aclk : out STD_LOGIC;
    ck_rst : out STD_LOGIC;
    aresetn : out STD_LOGIC;
    mcu_wakeup : inout STD_LOGIC
  );

end decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix;

architecture stub of decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "clk200M,mcu_rst,qspi0_cs,qspi0_dq[3:0],btnd,btnl,btnr,btnu,uart0_rx,uart0_tx,sw[6:0],mcu_TDO,mcu_TCK,mcu_TDI,mcu_TMS,expl_axi_arvalid,expl_axi_arready,expl_axi_araddr[31:0],expl_axi_arcache[3:0],expl_axi_arprot[2:0],expl_axi_arlock[1:0],expl_axi_arburst[1:0],expl_axi_arlen[3:0],expl_axi_arsize[2:0],expl_axi_awvalid,expl_axi_awready,expl_axi_awaddr[31:0],expl_axi_awcache[3:0],expl_axi_awprot[2:0],expl_axi_awlock[1:0],expl_axi_awburst[1:0],expl_axi_awlen[3:0],expl_axi_awsize[2:0],expl_axi_rvalid,expl_axi_rready,expl_axi_rdata[31:0],expl_axi_rresp[1:0],expl_axi_rlast,expl_axi_wvalid,expl_axi_wready,expl_axi_wdata[31:0],expl_axi_wstrb[3:0],expl_axi_wlast,expl_axi_bvalid,expl_axi_bready,expl_axi_bresp[1:0],aclk,ck_rst,aresetn,mcu_wakeup";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "system,Vivado 2020.2";
begin
end;
