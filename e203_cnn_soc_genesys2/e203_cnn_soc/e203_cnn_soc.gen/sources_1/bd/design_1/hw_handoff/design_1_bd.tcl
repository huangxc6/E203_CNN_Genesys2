
################################################################
# This is a generated script based on design: design_1
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2020.2
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source design_1_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7k325tffg900-2
   set_property BOARD_PART digilentinc.com:genesys2:part0:1.1 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name design_1

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set btnd_0 [ create_bd_port -dir IO btnd_0 ]
  set btnl_0 [ create_bd_port -dir IO btnl_0 ]
  set btnr_0 [ create_bd_port -dir IO btnr_0 ]
  set btnu_0 [ create_bd_port -dir IO btnu_0 ]
  set clk_in1_n_0 [ create_bd_port -dir I -type clk clk_in1_n_0 ]
  set clk_in1_p_0 [ create_bd_port -dir I -type clk clk_in1_p_0 ]
  set led_0 [ create_bd_port -dir O -from 7 -to 0 led_0 ]
  set mcu_TCK_0 [ create_bd_port -dir IO mcu_TCK_0 ]
  set mcu_TDI_0 [ create_bd_port -dir IO mcu_TDI_0 ]
  set mcu_TDO_0 [ create_bd_port -dir IO mcu_TDO_0 ]
  set mcu_TMS_0 [ create_bd_port -dir IO mcu_TMS_0 ]
  set mcu_rst [ create_bd_port -dir I mcu_rst ]
  set mcu_wakeup_0 [ create_bd_port -dir IO mcu_wakeup_0 ]
  set qspi0_cs_0 [ create_bd_port -dir O qspi0_cs_0 ]
  set qspi0_dq_0 [ create_bd_port -dir IO -from 3 -to 0 qspi0_dq_0 ]
  set sw_0 [ create_bd_port -dir IO -from 6 -to 0 sw_0 ]
  set uart0_rx_0 [ create_bd_port -dir IO uart0_rx_0 ]
  set uart0_tx_0 [ create_bd_port -dir IO uart0_tx_0 ]

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {1} \
 ] $axi_interconnect_0

  # Create instance: clk_wiz_0, and set properties
  set clk_wiz_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz_0 ]
  set_property -dict [ list \
   CONFIG.CLKIN1_JITTER_PS {50.0} \
   CONFIG.CLKOUT1_JITTER {98.146} \
   CONFIG.CLKOUT1_PHASE_ERROR {89.971} \
   CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {200} \
   CONFIG.CLKOUT2_JITTER {112.316} \
   CONFIG.CLKOUT2_PHASE_ERROR {89.971} \
   CONFIG.CLKOUT2_USED {true} \
   CONFIG.CLK_IN1_BOARD_INTERFACE {sys_diff_clock} \
   CONFIG.CLK_OUT1_PORT {clk_200} \
   CONFIG.CLK_OUT2_PORT {clk_100} \
   CONFIG.MMCM_CLKFBOUT_MULT_F {5.000} \
   CONFIG.MMCM_CLKIN1_PERIOD {5.000} \
   CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
   CONFIG.MMCM_CLKOUT0_DIVIDE_F {5.000} \
   CONFIG.MMCM_CLKOUT1_DIVIDE {10} \
   CONFIG.NUM_OUT_CLKS {2} \
   CONFIG.PRIM_SOURCE {Differential_clock_capable_pin} \
   CONFIG.RESET_PORT {resetn} \
   CONFIG.RESET_TYPE {ACTIVE_LOW} \
 ] $clk_wiz_0

  # Create instance: conv_axi_v2_0, and set properties
  set conv_axi_v2_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:conv_axi_v2:1.0 conv_axi_v2_0 ]

  # Create instance: e203_axi_0, and set properties
  set e203_axi_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:e203_axi:1.0 e203_axi_0 ]

  # Create instance: proc_sys_reset_0, and set properties
  set proc_sys_reset_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset_0 ]

  # Create interface connections
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_interconnect_0/M00_AXI] [get_bd_intf_pins conv_axi_v2_0/S00_AXI]
  connect_bd_intf_net -intf_net e203_axi_0_expl_axi [get_bd_intf_pins axi_interconnect_0/S00_AXI] [get_bd_intf_pins e203_axi_0/expl_axi]

  # Create port connections
  connect_bd_net -net ACLK_1 [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins e203_axi_0/aclk]
  connect_bd_net -net Net [get_bd_ports btnl_0] [get_bd_pins e203_axi_0/btnl]
  connect_bd_net -net Net1 [get_bd_ports mcu_TMS_0] [get_bd_pins e203_axi_0/mcu_TMS]
  connect_bd_net -net Net2 [get_bd_ports mcu_TCK_0] [get_bd_pins e203_axi_0/mcu_TCK]
  connect_bd_net -net Net3 [get_bd_ports mcu_TDI_0] [get_bd_pins e203_axi_0/mcu_TDI]
  connect_bd_net -net Net4 [get_bd_ports qspi0_dq_0] [get_bd_pins e203_axi_0/qspi0_dq]
  connect_bd_net -net Net5 [get_bd_ports mcu_TDO_0] [get_bd_pins e203_axi_0/mcu_TDO]
  connect_bd_net -net Net6 [get_bd_ports uart0_rx_0] [get_bd_pins e203_axi_0/uart0_rx]
  connect_bd_net -net Net7 [get_bd_ports uart0_tx_0] [get_bd_pins e203_axi_0/uart0_tx]
  connect_bd_net -net Net8 [get_bd_ports sw_0] [get_bd_pins e203_axi_0/sw]
  connect_bd_net -net Net9 [get_bd_ports btnr_0] [get_bd_pins e203_axi_0/btnr]
  connect_bd_net -net Net10 [get_bd_ports btnu_0] [get_bd_pins e203_axi_0/btnu]
  connect_bd_net -net Net11 [get_bd_ports btnd_0] [get_bd_pins e203_axi_0/btnd]
  connect_bd_net -net Net12 [get_bd_ports mcu_wakeup_0] [get_bd_pins e203_axi_0/mcu_wakeup]
  connect_bd_net -net clk_in1_n_0_1 [get_bd_ports clk_in1_n_0] [get_bd_pins clk_wiz_0/clk_in1_n]
  connect_bd_net -net clk_in1_p_0_1 [get_bd_ports clk_in1_p_0] [get_bd_pins clk_wiz_0/clk_in1_p]
  connect_bd_net -net clk_wiz_0_clk_200 [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins clk_wiz_0/clk_200] [get_bd_pins conv_axi_v2_0/s00_axi_aclk] [get_bd_pins e203_axi_0/clk200M] [get_bd_pins proc_sys_reset_0/slowest_sync_clk]
  connect_bd_net -net conv_axi_v2_0_led [get_bd_ports led_0] [get_bd_pins conv_axi_v2_0/led]
  connect_bd_net -net e203_axi_0_aresetn [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins e203_axi_0/aresetn]
  connect_bd_net -net e203_axi_0_ck_rst [get_bd_pins clk_wiz_0/resetn] [get_bd_pins e203_axi_0/ck_rst]
  connect_bd_net -net e203_axi_0_qspi0_cs [get_bd_ports qspi0_cs_0] [get_bd_pins e203_axi_0/qspi0_cs]
  connect_bd_net -net mcu_rst_1 [get_bd_ports mcu_rst] [get_bd_pins e203_axi_0/mcu_rst] [get_bd_pins proc_sys_reset_0/ext_reset_in]
  connect_bd_net -net proc_sys_reset_0_peripheral_aresetn [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins conv_axi_v2_0/s00_axi_aresetn] [get_bd_pins proc_sys_reset_0/peripheral_aresetn]

  # Create address segments
  assign_bd_address -offset 0x40000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces e203_axi_0/expl_axi] [get_bd_addr_segs conv_axi_v2_0/S00_AXI/S00_AXI_reg] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


