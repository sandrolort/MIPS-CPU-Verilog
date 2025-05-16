## Generated SDC file "MIPS_CPU.multicycled.sdc"

## Copyright (C) 2024  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and any partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details, at
## https://fpgasoftware.intel.com/eula.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 23.1std.1 Build 993 05/14/2024 SC Lite Edition"

## DATE    "Fri May 16 12:35:56 2025"

##
## DEVICE  "5CGXFC5C6F27C7"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {altera_reserved_tck} -period 33.333 -waveform { 0.000 16.666 } [get_ports {altera_reserved_tck}]
create_clock -name {CLOCK_50_B5B} -period 20.000 -waveform { 0.000 10.000 } [get_ports {CLOCK_50_B5B}]
create_clock -name {DDR2LP_DQS_p[0]_IN} -period 3.030 -waveform { 0.000 1.515 } [get_ports {DDR2LP_DQS_p[0]}] -add
create_clock -name {DDR2LP_DQS_p[1]_IN} -period 3.030 -waveform { 0.000 1.515 } [get_ports {DDR2LP_DQS_p[1]}] -add
create_clock -name {DDR2LP_DQS_p[2]_IN} -period 3.030 -waveform { 0.000 1.515 } [get_ports {DDR2LP_DQS_p[2]}] -add
create_clock -name {DDR2LP_DQS_p[3]_IN} -period 3.030 -waveform { 0.000 1.515 } [get_ports {DDR2LP_DQS_p[3]}] -add


#**************************************************************
# Create Generated Clock
#**************************************************************

create_generated_clock -name {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk} -source [get_ports {{CLOCK_50_B5B}}] -multiply_by 6600000 -divide_by 1000000 -master_clock {CLOCK_50_B5B} [get_pins {fpga_lpddr2_inst|lpddr2_inst|pll0|pll1~PLL_OUTPUT_COUNTER|divclk}] 
create_generated_clock -name {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk} -source [get_ports {{CLOCK_50_B5B}}] -multiply_by 6600000 -divide_by 1000000 -phase 270/1 -master_clock {CLOCK_50_B5B} [get_pins {fpga_lpddr2_inst|lpddr2_inst|pll0|pll3~PLL_OUTPUT_COUNTER|divclk}] 
create_generated_clock -name {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk} -source [get_ports {{CLOCK_50_B5B}}] -multiply_by 6600000 -divide_by 5000000 -phase 355/1 -master_clock {CLOCK_50_B5B} [get_pins {fpga_lpddr2_inst|lpddr2_inst|pll0|pll6~PLL_OUTPUT_COUNTER|divclk}] 
create_generated_clock -name {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk} -source [get_ports {{CLOCK_50_B5B}}] -multiply_by 6600000 -divide_by 15000000 -master_clock {CLOCK_50_B5B} [get_pins {fpga_lpddr2_inst|lpddr2_inst|pll0|pll7~PLL_OUTPUT_COUNTER|divclk}] 
create_generated_clock -name {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk} -source [get_ports {{CLOCK_50_B5B}}] -multiply_by 6600000 -divide_by 2000000 -master_clock {CLOCK_50_B5B} [get_pins {fpga_lpddr2_inst|lpddr2_inst|pll0|pll5~PLL_OUTPUT_COUNTER|divclk}] 
create_generated_clock -name {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock} -source [get_pins {fpga_lpddr2_inst|lpddr2_inst|pll0|pll1~PLL_OUTPUT_COUNTER|divclk}] -master_clock {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk} [get_registers {fpga_lpddr2_inst|lpddr2_inst|p0|umemphy|uio_pads|dq_ddio[*].ubidir_dq_dqs|altdq_dqs2_inst|dqs_enable_ctrl~DQSENABLEOUT_DFF}] 
create_generated_clock -name {DDR2LP_CK_p} -source [get_pins {fpga_lpddr2_inst|lpddr2_inst|pll0|pll1~PLL_OUTPUT_COUNTER|divclk}] -master_clock {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk} [get_ports {DDR2LP_CK_p}] 
create_generated_clock -name {DDR2LP_CK_n} -source [get_pins {fpga_lpddr2_inst|lpddr2_inst|pll0|pll1~PLL_OUTPUT_COUNTER|divclk}] -master_clock {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk} -invert [get_ports {DDR2LP_CK_n}] 
create_generated_clock -name {DDR2LP_DQS_p[0]_OUT} -source [get_pins {fpga_lpddr2_inst|lpddr2_inst|pll0|pll1~PLL_OUTPUT_COUNTER|divclk}] -master_clock {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk} [get_ports {DDR2LP_DQS_p[0]}] -add
create_generated_clock -name {DDR2LP_DQS_p[1]_OUT} -source [get_pins {fpga_lpddr2_inst|lpddr2_inst|pll0|pll1~PLL_OUTPUT_COUNTER|divclk}] -master_clock {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk} [get_ports {DDR2LP_DQS_p[1]}] -add
create_generated_clock -name {DDR2LP_DQS_p[2]_OUT} -source [get_pins {fpga_lpddr2_inst|lpddr2_inst|pll0|pll1~PLL_OUTPUT_COUNTER|divclk}] -master_clock {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk} [get_ports {DDR2LP_DQS_p[2]}] -add
create_generated_clock -name {DDR2LP_DQS_p[3]_OUT} -source [get_pins {fpga_lpddr2_inst|lpddr2_inst|pll0|pll1~PLL_OUTPUT_COUNTER|divclk}] -master_clock {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk} [get_ports {DDR2LP_DQS_p[3]}] -add
create_generated_clock -name {DDR2LP_DQS_n[0]_OUT} -source [get_pins {fpga_lpddr2_inst|lpddr2_inst|pll0|pll1~PLL_OUTPUT_COUNTER|divclk}] -master_clock {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk} [get_ports {DDR2LP_DQS_n[0]}] 
create_generated_clock -name {DDR2LP_DQS_n[1]_OUT} -source [get_pins {fpga_lpddr2_inst|lpddr2_inst|pll0|pll1~PLL_OUTPUT_COUNTER|divclk}] -master_clock {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk} [get_ports {DDR2LP_DQS_n[1]}] 
create_generated_clock -name {DDR2LP_DQS_n[2]_OUT} -source [get_pins {fpga_lpddr2_inst|lpddr2_inst|pll0|pll1~PLL_OUTPUT_COUNTER|divclk}] -master_clock {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk} [get_ports {DDR2LP_DQS_n[2]}] 
create_generated_clock -name {DDR2LP_DQS_n[3]_OUT} -source [get_pins {fpga_lpddr2_inst|lpddr2_inst|pll0|pll1~PLL_OUTPUT_COUNTER|divclk}] -master_clock {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk} [get_ports {DDR2LP_DQS_n[3]}] 

create_generated_clock -name CLK_DIV -source [get_ports CLOCK_50_B5B] -divide_by 2 [get_registers master:mstr|clock_div:divider|clk_div[1]] 

#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_n[3]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_n[3]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_n[3]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_n[3]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_n[2]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_n[2]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_n[2]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_n[2]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_n[2]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_n[2]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_n[2]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_n[2]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_n[1]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_n[1]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_n[1]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_n[1]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_n[1]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_n[1]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_n[1]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_n[1]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_n[1]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_n[1]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_n[1]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_n[1]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_n[0]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_n[0]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_n[0]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_n[0]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_n[0]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_n[0]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_n[0]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_n[0]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_n[0]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_n[0]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_n[0]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_n[0]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_n[0]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_n[0]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_n[0]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_n[0]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_OUT}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {DDR2LP_CK_n}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {DDR2LP_CK_n}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {DDR2LP_CK_p}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {DDR2LP_CK_p}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {CLOCK_50_B5B}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {CLOCK_50_B5B}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {DDR2LP_CK_n}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {DDR2LP_CK_n}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {DDR2LP_CK_p}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {DDR2LP_CK_p}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {CLOCK_50_B5B}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {CLOCK_50_B5B}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -rise_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[2]_IN}] -fall_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {DDR2LP_CK_n}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {DDR2LP_CK_n}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {DDR2LP_CK_p}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {DDR2LP_CK_p}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {CLOCK_50_B5B}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {CLOCK_50_B5B}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {DDR2LP_CK_n}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {DDR2LP_CK_n}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {DDR2LP_CK_p}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {DDR2LP_CK_p}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {CLOCK_50_B5B}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {CLOCK_50_B5B}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -rise_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[1]_IN}] -fall_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_CK_n}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_CK_n}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_CK_p}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_CK_p}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {CLOCK_50_B5B}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {CLOCK_50_B5B}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_CK_n}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_CK_n}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {DDR2LP_CK_p}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {DDR2LP_CK_p}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {CLOCK_50_B5B}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {CLOCK_50_B5B}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -rise_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[3]_IN}] -fall_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {DDR2LP_CK_n}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {DDR2LP_CK_n}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {DDR2LP_CK_p}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {DDR2LP_CK_p}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {CLOCK_50_B5B}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {CLOCK_50_B5B}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {DDR2LP_CK_n}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {DDR2LP_CK_n}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {DDR2LP_CK_p}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {DDR2LP_CK_p}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {CLOCK_50_B5B}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {CLOCK_50_B5B}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -rise_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_DQS_p[0]_IN}] -fall_to [get_clocks {altera_reserved_tck}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_n}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_n}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_n}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_n}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_n}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_n}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_n}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_n}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_n}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_n}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_n}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_n}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_n}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_n}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_n}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_n}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_n}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_n}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_n}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_n}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_n}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_n}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_n}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_n}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_n}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_n}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_n}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_n}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_n}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_n}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_n}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_n}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_p}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_p}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_p}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_p}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_p}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_p}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_p}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_p}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_p}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_p}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_p}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_p}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_p}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_p}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_p}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {DDR2LP_CK_p}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_p}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_p}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_p}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_p}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_p}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_p}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_p}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_p}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_p}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_p}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_p}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_p}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_p}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_p}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_p}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {DDR2LP_CK_p}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.000  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_IN}]  0.120  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_IN}]  0.120  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_IN}]  0.120  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_IN}]  0.120  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_IN}]  0.120  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_IN}]  0.120  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.120  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.120  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {DDR2LP_DQS_p[2]_IN}]  0.120  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {DDR2LP_DQS_p[2]_IN}]  0.120  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {DDR2LP_DQS_p[1]_IN}]  0.120  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {DDR2LP_DQS_p[1]_IN}]  0.120  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {DDR2LP_DQS_p[3]_IN}]  0.120  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {DDR2LP_DQS_p[3]_IN}]  0.120  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.120  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.120  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -rise_to [get_clocks {CLOCK_50_B5B}]  0.220  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -fall_to [get_clocks {CLOCK_50_B5B}]  0.220  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -rise_to [get_clocks {CLOCK_50_B5B}]  0.220  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] -fall_to [get_clocks {CLOCK_50_B5B}]  0.220  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {DDR2LP_CK_n}] -setup 0.170  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {DDR2LP_CK_n}] -hold 0.120  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {DDR2LP_CK_n}] -setup 0.170  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {DDR2LP_CK_n}] -hold 0.120  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {DDR2LP_CK_p}] -setup 0.170  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {DDR2LP_CK_p}] -hold 0.120  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {DDR2LP_CK_p}] -setup 0.170  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {DDR2LP_CK_p}] -hold 0.120  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -hold 0.050  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -hold 0.050  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -setup 0.130  
set_clock_uncertainty -rise_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {DDR2LP_CK_n}] -setup 0.170  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {DDR2LP_CK_n}] -hold 0.120  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {DDR2LP_CK_n}] -setup 0.170  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {DDR2LP_CK_n}] -hold 0.120  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {DDR2LP_CK_p}] -setup 0.170  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {DDR2LP_CK_p}] -hold 0.120  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {DDR2LP_CK_p}] -setup 0.170  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {DDR2LP_CK_p}] -hold 0.120  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -hold 0.050  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_dq_write_clk}] -hold 0.050  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -setup 0.130  
set_clock_uncertainty -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}]  0.220  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}]  0.220  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}]  0.220  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}]  0.220  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]  0.220  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]  0.220  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  0.220  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  0.220  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {CLOCK_50_B5B}] -setup 0.280  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {CLOCK_50_B5B}] -hold 0.270  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {CLOCK_50_B5B}] -setup 0.280  
set_clock_uncertainty -rise_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {CLOCK_50_B5B}] -hold 0.270  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}]  0.220  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}]  0.220  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}]  0.220  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}]  0.220  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]  0.220  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]  0.220  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  0.220  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  0.220  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {CLOCK_50_B5B}] -setup 0.280  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -rise_to [get_clocks {CLOCK_50_B5B}] -hold 0.270  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {CLOCK_50_B5B}] -setup 0.280  
set_clock_uncertainty -fall_from [get_clocks {CLOCK_50_B5B}] -fall_to [get_clocks {CLOCK_50_B5B}] -hold 0.270  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}] -setup 0.100  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}] -setup 0.100  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}] -hold 0.060  


#**************************************************************
# Set Input Delay
#**************************************************************

set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.273 [get_ports {DDR2LP_DQ[0]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[0]_IN}]  -0.395 [get_ports {DDR2LP_DQ[0]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.273 [get_ports {DDR2LP_DQ[1]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[0]_IN}]  -0.395 [get_ports {DDR2LP_DQ[1]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.273 [get_ports {DDR2LP_DQ[2]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[0]_IN}]  -0.395 [get_ports {DDR2LP_DQ[2]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.273 [get_ports {DDR2LP_DQ[3]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[0]_IN}]  -0.395 [get_ports {DDR2LP_DQ[3]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.273 [get_ports {DDR2LP_DQ[4]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[0]_IN}]  -0.395 [get_ports {DDR2LP_DQ[4]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.273 [get_ports {DDR2LP_DQ[5]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[0]_IN}]  -0.395 [get_ports {DDR2LP_DQ[5]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.273 [get_ports {DDR2LP_DQ[6]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[0]_IN}]  -0.395 [get_ports {DDR2LP_DQ[6]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[0]_IN}]  0.273 [get_ports {DDR2LP_DQ[7]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[0]_IN}]  -0.395 [get_ports {DDR2LP_DQ[7]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[1]_IN}]  0.273 [get_ports {DDR2LP_DQ[8]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[1]_IN}]  -0.395 [get_ports {DDR2LP_DQ[8]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[1]_IN}]  0.273 [get_ports {DDR2LP_DQ[9]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[1]_IN}]  -0.395 [get_ports {DDR2LP_DQ[9]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[1]_IN}]  0.273 [get_ports {DDR2LP_DQ[10]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[1]_IN}]  -0.395 [get_ports {DDR2LP_DQ[10]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[1]_IN}]  0.273 [get_ports {DDR2LP_DQ[11]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[1]_IN}]  -0.395 [get_ports {DDR2LP_DQ[11]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[1]_IN}]  0.273 [get_ports {DDR2LP_DQ[12]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[1]_IN}]  -0.395 [get_ports {DDR2LP_DQ[12]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[1]_IN}]  0.273 [get_ports {DDR2LP_DQ[13]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[1]_IN}]  -0.395 [get_ports {DDR2LP_DQ[13]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[1]_IN}]  0.273 [get_ports {DDR2LP_DQ[14]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[1]_IN}]  -0.395 [get_ports {DDR2LP_DQ[14]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[1]_IN}]  0.273 [get_ports {DDR2LP_DQ[15]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[1]_IN}]  -0.395 [get_ports {DDR2LP_DQ[15]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[2]_IN}]  0.273 [get_ports {DDR2LP_DQ[16]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[2]_IN}]  -0.395 [get_ports {DDR2LP_DQ[16]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[2]_IN}]  0.273 [get_ports {DDR2LP_DQ[17]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[2]_IN}]  -0.395 [get_ports {DDR2LP_DQ[17]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[2]_IN}]  0.273 [get_ports {DDR2LP_DQ[18]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[2]_IN}]  -0.395 [get_ports {DDR2LP_DQ[18]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[2]_IN}]  0.273 [get_ports {DDR2LP_DQ[19]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[2]_IN}]  -0.395 [get_ports {DDR2LP_DQ[19]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[2]_IN}]  0.273 [get_ports {DDR2LP_DQ[20]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[2]_IN}]  -0.395 [get_ports {DDR2LP_DQ[20]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[2]_IN}]  0.273 [get_ports {DDR2LP_DQ[21]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[2]_IN}]  -0.395 [get_ports {DDR2LP_DQ[21]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[2]_IN}]  0.273 [get_ports {DDR2LP_DQ[22]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[2]_IN}]  -0.395 [get_ports {DDR2LP_DQ[22]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[2]_IN}]  0.273 [get_ports {DDR2LP_DQ[23]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[2]_IN}]  -0.395 [get_ports {DDR2LP_DQ[23]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[3]_IN}]  0.273 [get_ports {DDR2LP_DQ[24]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[3]_IN}]  -0.395 [get_ports {DDR2LP_DQ[24]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[3]_IN}]  0.273 [get_ports {DDR2LP_DQ[25]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[3]_IN}]  -0.395 [get_ports {DDR2LP_DQ[25]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[3]_IN}]  0.273 [get_ports {DDR2LP_DQ[26]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[3]_IN}]  -0.395 [get_ports {DDR2LP_DQ[26]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[3]_IN}]  0.273 [get_ports {DDR2LP_DQ[27]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[3]_IN}]  -0.395 [get_ports {DDR2LP_DQ[27]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[3]_IN}]  0.273 [get_ports {DDR2LP_DQ[28]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[3]_IN}]  -0.395 [get_ports {DDR2LP_DQ[28]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[3]_IN}]  0.273 [get_ports {DDR2LP_DQ[29]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[3]_IN}]  -0.395 [get_ports {DDR2LP_DQ[29]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[3]_IN}]  0.273 [get_ports {DDR2LP_DQ[30]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[3]_IN}]  -0.395 [get_ports {DDR2LP_DQ[30]}]
set_input_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[3]_IN}]  0.273 [get_ports {DDR2LP_DQ[31]}]
set_input_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[3]_IN}]  -0.395 [get_ports {DDR2LP_DQ[31]}]


#**************************************************************
# Set Output Delay
#**************************************************************

set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_n}]  0.530 [get_ports {DDR2LP_CA[0]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_n}]  -0.440 [get_ports {DDR2LP_CA[0]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_p}]  0.530 [get_ports {DDR2LP_CA[0]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_p}]  -0.440 [get_ports {DDR2LP_CA[0]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_n}]  0.530 [get_ports {DDR2LP_CA[1]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_n}]  -0.440 [get_ports {DDR2LP_CA[1]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_p}]  0.530 [get_ports {DDR2LP_CA[1]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_p}]  -0.440 [get_ports {DDR2LP_CA[1]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_n}]  0.530 [get_ports {DDR2LP_CA[2]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_n}]  -0.440 [get_ports {DDR2LP_CA[2]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_p}]  0.530 [get_ports {DDR2LP_CA[2]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_p}]  -0.440 [get_ports {DDR2LP_CA[2]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_n}]  0.530 [get_ports {DDR2LP_CA[3]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_n}]  -0.440 [get_ports {DDR2LP_CA[3]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_p}]  0.530 [get_ports {DDR2LP_CA[3]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_p}]  -0.440 [get_ports {DDR2LP_CA[3]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_n}]  0.530 [get_ports {DDR2LP_CA[4]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_n}]  -0.440 [get_ports {DDR2LP_CA[4]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_p}]  0.530 [get_ports {DDR2LP_CA[4]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_p}]  -0.440 [get_ports {DDR2LP_CA[4]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_n}]  0.530 [get_ports {DDR2LP_CA[5]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_n}]  -0.440 [get_ports {DDR2LP_CA[5]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_p}]  0.530 [get_ports {DDR2LP_CA[5]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_p}]  -0.440 [get_ports {DDR2LP_CA[5]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_n}]  0.530 [get_ports {DDR2LP_CA[6]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_n}]  -0.440 [get_ports {DDR2LP_CA[6]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_p}]  0.530 [get_ports {DDR2LP_CA[6]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_p}]  -0.440 [get_ports {DDR2LP_CA[6]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_n}]  0.530 [get_ports {DDR2LP_CA[7]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_n}]  -0.440 [get_ports {DDR2LP_CA[7]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_p}]  0.530 [get_ports {DDR2LP_CA[7]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_p}]  -0.440 [get_ports {DDR2LP_CA[7]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_n}]  0.530 [get_ports {DDR2LP_CA[8]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_n}]  -0.440 [get_ports {DDR2LP_CA[8]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_p}]  0.530 [get_ports {DDR2LP_CA[8]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_p}]  -0.440 [get_ports {DDR2LP_CA[8]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_n}]  0.530 [get_ports {DDR2LP_CA[9]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_n}]  -0.440 [get_ports {DDR2LP_CA[9]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_p}]  0.530 [get_ports {DDR2LP_CA[9]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_p}]  -0.440 [get_ports {DDR2LP_CA[9]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_n}]  0.530 [get_ports {DDR2LP_CKE[0]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_n}]  -0.440 [get_ports {DDR2LP_CKE[0]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_p}]  0.530 [get_ports {DDR2LP_CKE[0]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_p}]  -0.440 [get_ports {DDR2LP_CKE[0]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_n}]  0.530 [get_ports {DDR2LP_CS_n[0]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_n}]  -0.440 [get_ports {DDR2LP_CS_n[0]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_p}]  0.530 [get_ports {DDR2LP_CS_n[0]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_p}]  -0.440 [get_ports {DDR2LP_CS_n[0]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.651 [get_ports {DDR2LP_DM[0]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[0]_OUT}]  -0.557 [get_ports {DDR2LP_DM[0]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.651 [get_ports {DDR2LP_DM[0]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[0]_OUT}]  -0.557 [get_ports {DDR2LP_DM[0]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.651 [get_ports {DDR2LP_DM[1]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[1]_OUT}]  -0.557 [get_ports {DDR2LP_DM[1]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.651 [get_ports {DDR2LP_DM[1]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[1]_OUT}]  -0.557 [get_ports {DDR2LP_DM[1]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.651 [get_ports {DDR2LP_DM[2]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[2]_OUT}]  -0.557 [get_ports {DDR2LP_DM[2]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.651 [get_ports {DDR2LP_DM[2]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[2]_OUT}]  -0.557 [get_ports {DDR2LP_DM[2]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.651 [get_ports {DDR2LP_DM[3]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[3]_OUT}]  -0.557 [get_ports {DDR2LP_DM[3]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.651 [get_ports {DDR2LP_DM[3]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[3]_OUT}]  -0.557 [get_ports {DDR2LP_DM[3]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_p}]  1.525 [get_ports {DDR2LP_DQS_p[0]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_p}]  1.505 [get_ports {DDR2LP_DQS_p[0]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_p}]  1.525 [get_ports {DDR2LP_DQS_p[1]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_p}]  1.505 [get_ports {DDR2LP_DQS_p[1]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_p}]  1.525 [get_ports {DDR2LP_DQS_p[2]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_p}]  1.505 [get_ports {DDR2LP_DQS_p[2]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_CK_p}]  1.525 [get_ports {DDR2LP_DQS_p[3]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_CK_p}]  1.505 [get_ports {DDR2LP_DQS_p[3]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.651 [get_ports {DDR2LP_DQ[0]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[0]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[0]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.651 [get_ports {DDR2LP_DQ[0]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[0]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[0]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.651 [get_ports {DDR2LP_DQ[1]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[0]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[1]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.651 [get_ports {DDR2LP_DQ[1]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[0]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[1]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.651 [get_ports {DDR2LP_DQ[2]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[0]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[2]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.651 [get_ports {DDR2LP_DQ[2]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[0]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[2]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.651 [get_ports {DDR2LP_DQ[3]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[0]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[3]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.651 [get_ports {DDR2LP_DQ[3]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[0]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[3]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.651 [get_ports {DDR2LP_DQ[4]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[0]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[4]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.651 [get_ports {DDR2LP_DQ[4]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[0]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[4]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.651 [get_ports {DDR2LP_DQ[5]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[0]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[5]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.651 [get_ports {DDR2LP_DQ[5]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[0]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[5]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.651 [get_ports {DDR2LP_DQ[6]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[0]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[6]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.651 [get_ports {DDR2LP_DQ[6]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[0]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[6]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[0]_OUT}]  0.651 [get_ports {DDR2LP_DQ[7]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[0]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[7]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[0]_OUT}]  0.651 [get_ports {DDR2LP_DQ[7]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[0]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[7]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.651 [get_ports {DDR2LP_DQ[8]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[1]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[8]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.651 [get_ports {DDR2LP_DQ[8]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[1]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[8]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.651 [get_ports {DDR2LP_DQ[9]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[1]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[9]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.651 [get_ports {DDR2LP_DQ[9]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[1]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[9]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.651 [get_ports {DDR2LP_DQ[10]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[1]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[10]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.651 [get_ports {DDR2LP_DQ[10]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[1]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[10]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.651 [get_ports {DDR2LP_DQ[11]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[1]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[11]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.651 [get_ports {DDR2LP_DQ[11]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[1]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[11]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.651 [get_ports {DDR2LP_DQ[12]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[1]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[12]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.651 [get_ports {DDR2LP_DQ[12]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[1]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[12]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.651 [get_ports {DDR2LP_DQ[13]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[1]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[13]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.651 [get_ports {DDR2LP_DQ[13]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[1]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[13]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.651 [get_ports {DDR2LP_DQ[14]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[1]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[14]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.651 [get_ports {DDR2LP_DQ[14]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[1]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[14]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[1]_OUT}]  0.651 [get_ports {DDR2LP_DQ[15]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[1]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[15]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[1]_OUT}]  0.651 [get_ports {DDR2LP_DQ[15]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[1]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[15]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.651 [get_ports {DDR2LP_DQ[16]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[2]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[16]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.651 [get_ports {DDR2LP_DQ[16]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[2]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[16]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.651 [get_ports {DDR2LP_DQ[17]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[2]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[17]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.651 [get_ports {DDR2LP_DQ[17]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[2]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[17]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.651 [get_ports {DDR2LP_DQ[18]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[2]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[18]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.651 [get_ports {DDR2LP_DQ[18]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[2]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[18]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.651 [get_ports {DDR2LP_DQ[19]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[2]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[19]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.651 [get_ports {DDR2LP_DQ[19]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[2]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[19]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.651 [get_ports {DDR2LP_DQ[20]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[2]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[20]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.651 [get_ports {DDR2LP_DQ[20]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[2]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[20]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.651 [get_ports {DDR2LP_DQ[21]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[2]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[21]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.651 [get_ports {DDR2LP_DQ[21]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[2]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[21]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.651 [get_ports {DDR2LP_DQ[22]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[2]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[22]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.651 [get_ports {DDR2LP_DQ[22]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[2]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[22]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[2]_OUT}]  0.651 [get_ports {DDR2LP_DQ[23]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[2]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[23]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[2]_OUT}]  0.651 [get_ports {DDR2LP_DQ[23]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[2]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[23]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.651 [get_ports {DDR2LP_DQ[24]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[3]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[24]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.651 [get_ports {DDR2LP_DQ[24]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[3]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[24]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.651 [get_ports {DDR2LP_DQ[25]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[3]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[25]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.651 [get_ports {DDR2LP_DQ[25]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[3]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[25]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.651 [get_ports {DDR2LP_DQ[26]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[3]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[26]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.651 [get_ports {DDR2LP_DQ[26]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[3]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[26]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.651 [get_ports {DDR2LP_DQ[27]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[3]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[27]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.651 [get_ports {DDR2LP_DQ[27]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[3]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[27]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.651 [get_ports {DDR2LP_DQ[28]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[3]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[28]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.651 [get_ports {DDR2LP_DQ[28]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[3]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[28]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.651 [get_ports {DDR2LP_DQ[29]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[3]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[29]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.651 [get_ports {DDR2LP_DQ[29]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[3]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[29]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.651 [get_ports {DDR2LP_DQ[30]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[3]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[30]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.651 [get_ports {DDR2LP_DQ[30]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[3]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[30]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_n[3]_OUT}]  0.651 [get_ports {DDR2LP_DQ[31]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_n[3]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[31]}]
set_output_delay -add_delay -max -clock [get_clocks {DDR2LP_DQS_p[3]_OUT}]  0.651 [get_ports {DDR2LP_DQ[31]}]
set_output_delay -add_delay -min -clock [get_clocks {DDR2LP_DQS_p[3]_OUT}]  -0.557 [get_ports {DDR2LP_DQ[31]}]


#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 
set_clock_groups -physically_exclusive -group [get_clocks {DDR2LP_DQS_p[0]_IN}] -group [get_clocks {DDR2LP_DQS_p[0]_OUT DDR2LP_DQS_n[0]_OUT}] 
set_clock_groups -physically_exclusive -group [get_clocks {DDR2LP_DQS_p[1]_IN}] -group [get_clocks {DDR2LP_DQS_p[1]_OUT DDR2LP_DQS_n[1]_OUT}] 
set_clock_groups -physically_exclusive -group [get_clocks {DDR2LP_DQS_p[2]_IN}] -group [get_clocks {DDR2LP_DQS_p[2]_OUT DDR2LP_DQS_n[2]_OUT}] 
set_clock_groups -physically_exclusive -group [get_clocks {DDR2LP_DQS_p[3]_IN}] -group [get_clocks {DDR2LP_DQS_p[3]_OUT DDR2LP_DQS_n[3]_OUT}] 


#**************************************************************
# Set False Path
#**************************************************************

set_false_path  -fall_from  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  -to  [get_clocks {DDR2LP_CK_p}]
set_false_path  -from  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  -to  [get_clocks {DDR2LP_DQS_p[0]_IN}]
set_false_path  -from  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  -to  [get_clocks {DDR2LP_DQS_p[1]_IN}]
set_false_path  -from  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  -to  [get_clocks {DDR2LP_DQS_p[2]_IN}]
set_false_path  -from  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  -to  [get_clocks {DDR2LP_DQS_p[3]_IN}]
set_false_path  -from  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  -to  [get_clocks {*_IN}]
set_false_path  -from  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]  -to  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}]
set_false_path  -from  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}]  -to  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]
set_false_path  -from  [get_clocks *]  -to  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}]
set_false_path -fall_from [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] -to [get_ports {{DDR2LP_CA[0]} {DDR2LP_CA[1]} {DDR2LP_CA[2]} {DDR2LP_CA[3]} {DDR2LP_CA[4]} {DDR2LP_CA[5]} {DDR2LP_CA[6]} {DDR2LP_CA[7]} {DDR2LP_CA[8]} {DDR2LP_CA[9]} {DDR2LP_CKE[0]} {DDR2LP_CS_n[0]}}]
set_false_path -from [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*c0|hmc_inst~FF_*}] -to [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*umemphy|*uio_pads|*uaddr_cmd_pads|*ddio_out*}]
set_false_path -from [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*lfifo~LFIFO_IN_READ_EN_DFF}]
set_false_path -from [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*lfifo~LFIFO_OUT_RDATA_VALID_DFF}] -to [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*umemphy|hphy_inst~FF_*}]
set_false_path -from [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*altdq_dqs2_inst|vfifo~QVLD_IN_DFF}]
set_false_path -from [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*lfifo~RD_LATENCY_DFF*}]
set_false_path -from [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*umemphy|*uio_pads|*uaddr_cmd_pads|*ddio_out*}]
set_false_path -from [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*umemphy|*altdq_dqs2_inst|*output_path_gen[*].ddio_out*}]
set_false_path -from [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*umemphy|*altdq_dqs2_inst|extra_output_pad_gen[*].ddio_out*}]
set_false_path -from [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*umemphy|hphy_inst~FF_*}]
set_false_path -from [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*c0|hmc_inst~FF_*}] -to [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*umemphy|hphy_inst~FF_*}]
set_false_path -from [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*c0|hmc_inst~FF_*}]
set_false_path -to [get_ports {DDR2LP_DQS_n[0]}]
set_false_path -to [get_ports {DDR2LP_DQS_n[1]}]
set_false_path -to [get_ports {DDR2LP_DQS_n[2]}]
set_false_path -to [get_ports {DDR2LP_DQS_n[3]}]
set_false_path -to [get_ports {DDR2LP_CK_p}]
set_false_path -to [get_ports {DDR2LP_CK_n}]
set_false_path -from [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_clocks {DDR2LP_DQS_p[0]_OUT}]
set_false_path -from [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_clocks {DDR2LP_DQS_p[1]_OUT}]
set_false_path -from [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_clocks {DDR2LP_DQS_p[2]_OUT}]
set_false_path -from [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_clocks {DDR2LP_DQS_p[3]_OUT}]
set_false_path -from [get_keepers {fpga_lpddr2_inst|lpddr2_inst|p0|umemphy|afi_half_clk_reg}] -to [get_keepers {fpga_lpddr2_inst|lpddr2_inst|p0|umemphy|afi_half_clk_reg}]
set_false_path -from [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*altdq_dqs2_inst|dqs_enable_ctrl~*}] -to [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*altdq_dqs2_inst|dqs_delay_chain~POSTAMBLE_DFF}]
set_false_path -from [get_keepers {sample[1]}] -to [get_keepers {lpddr2:fpga_lpddr2_inst|lpddr2_0002:lpddr2_inst|lpddr2_p0:p0|lpddr2_p0_acv_hard_memphy:umemphy|lpddr2_p0_reset:ureset|lpddr2_p0_reset_sync:ureset_avl_clk|reset_reg[0]}]
set_false_path -from [get_keepers {sample[1]}] -to [get_keepers {lpddr2:fpga_lpddr2_inst|lpddr2_0002:lpddr2_inst|lpddr2_p0:p0|lpddr2_p0_acv_hard_memphy:umemphy|lpddr2_p0_reset:ureset|lpddr2_p0_reset_sync:ureset_avl_clk|reset_reg[1]}]
set_false_path -from [get_keepers {sample[0]}] -to [get_keepers {lpddr2:fpga_lpddr2_inst|lpddr2_0002:lpddr2_inst|lpddr2_p0:p0|lpddr2_p0_acv_hard_memphy:umemphy|lpddr2_p0_reset:ureset|lpddr2_p0_reset_sync:ureset_avl_clk|reset_reg[1]}]
set_false_path -from [get_keepers {sample[0]}] -to [get_keepers {lpddr2:fpga_lpddr2_inst|lpddr2_0002:lpddr2_inst|lpddr2_p0:p0|lpddr2_p0_acv_hard_memphy:umemphy|lpddr2_p0_reset:ureset|lpddr2_p0_reset_sync:ureset_avl_clk|reset_reg[0]}]
set_false_path -from [get_keepers {sample[3]}] -to [get_keepers {lpddr2:fpga_lpddr2_inst|lpddr2_0002:lpddr2_inst|lpddr2_p0:p0|lpddr2_p0_acv_hard_memphy:umemphy|lpddr2_p0_reset:ureset|lpddr2_p0_reset_sync:ureset_avl_clk|reset_reg[1]}]
set_false_path -from [get_keepers {sample[3]}] -to [get_keepers {lpddr2:fpga_lpddr2_inst|lpddr2_0002:lpddr2_inst|lpddr2_p0:p0|lpddr2_p0_acv_hard_memphy:umemphy|lpddr2_p0_reset:ureset|lpddr2_p0_reset_sync:ureset_avl_clk|reset_reg[0]}]
set_false_path -from [get_keepers {sample[2]}] -to [get_keepers {lpddr2:fpga_lpddr2_inst|lpddr2_0002:lpddr2_inst|lpddr2_p0:p0|lpddr2_p0_acv_hard_memphy:umemphy|lpddr2_p0_reset:ureset|lpddr2_p0_reset_sync:ureset_avl_clk|reset_reg[1]}]
set_false_path -from [get_keepers {sample[2]}] -to [get_keepers {lpddr2:fpga_lpddr2_inst|lpddr2_0002:lpddr2_inst|lpddr2_p0:p0|lpddr2_p0_acv_hard_memphy:umemphy|lpddr2_p0_reset:ureset|lpddr2_p0_reset_sync:ureset_avl_clk|reset_reg[0]}]


#**************************************************************
# Set Multicycle Path
#**************************************************************

set_multicycle_path -setup -start -from  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  -to  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] 4
set_multicycle_path -hold -start -from  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}]  -to  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}] 3
set_multicycle_path -hold -end -from  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]  -to  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] 1
set_multicycle_path -setup -end -from  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]  -to  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] 2
set_multicycle_path -hold -end -from  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]  -to  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] 1
set_multicycle_path -setup -end -from  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]  -to  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] 2
set_multicycle_path -hold -end -from  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_avl_clk}]  -to  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] 1
set_multicycle_path -setup -end -from  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}]  -to  [get_clocks *] 2
set_multicycle_path -hold -end -from  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|lpddr2_p0_sampling_clock}]  -to  [get_clocks *] 2
set_multicycle_path -setup -end -from  [get_clocks {CLOCK_50_B5B}]  -to  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] 3
set_multicycle_path -setup -end -from  [get_clocks {CLOCK_50_B5B}]  -to  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] 4
set_multicycle_path -setup -end -from  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}]  -to  [get_clocks {CLOCK_50_B5B}] 2
set_multicycle_path -hold -end -from  [get_clocks {CLOCK_50_B5B}]  -to  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}] 4
set_multicycle_path -hold -end -from  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_half_clk}]  -to  [get_clocks {CLOCK_50_B5B}] 2
set_multicycle_path -setup -end -from  [get_clocks {CLOCK_50_B5B}]  -to  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] 2
set_multicycle_path -setup -end -from  [get_clocks {CLOCK_50_B5B}]  -to  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] 2
set_multicycle_path -setup -end -from  [get_clocks {CLOCK_50_B5B}]  -to  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] 3
set_multicycle_path -setup -end -from  [get_clocks {CLOCK_50_B5B}]  -to  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] 4
set_multicycle_path -hold -end -from  [get_clocks {CLOCK_50_B5B}]  -to  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_config_clk}] 2
set_multicycle_path -hold -end -from  [get_clocks {CLOCK_50_B5B}]  -to  [get_clocks {fpga_lpddr2_inst|lpddr2_inst|pll0|pll_afi_clk}] 3
set_multicycle_path -setup -end -to [get_registers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*umemphy|*uio_pads|*uaddr_cmd_pads|*clock_gen[*].umem_ck_pad|*}] 4
set_multicycle_path -hold -end -to [get_registers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*umemphy|*uio_pads|*uaddr_cmd_pads|*clock_gen[*].umem_ck_pad|*}] 4
set_multicycle_path -setup -end -from [get_registers {*:fpga_lpddr2_inst|*:lpddr2_inst|*s0|*sequencer_trk_mgr_inst|avl_*_ack*}] -to [get_registers {*:fpga_lpddr2_inst|*:lpddr2_inst|*c0|hmc_inst~FF_*}] 3
set_multicycle_path -hold -end -from [get_registers {*:fpga_lpddr2_inst|*:lpddr2_inst|*s0|*sequencer_trk_mgr_inst|avl_*_ack*}] -to [get_registers {*:fpga_lpddr2_inst|*:lpddr2_inst|*c0|hmc_inst~FF_*}] 2
set_multicycle_path -setup -end -from [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*lfifo~LFIFO_IN_READ_EN_FULL_DFF}] 2
set_multicycle_path -hold -end -from [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*lfifo~LFIFO_IN_READ_EN_FULL_DFF}] 1
set_multicycle_path -setup -end -from [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*altdq_dqs2_inst|*read_fifo~READ_ADDRESS_DFF}] 2
set_multicycle_path -hold -end -from [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*umemphy|hphy_inst~FF_*}] -to [get_keepers {*:fpga_lpddr2_inst|*:lpddr2_inst|*p0|*altdq_dqs2_inst|*read_fifo~READ_ADDRESS_DFF}] 1


#**************************************************************
# Set Maximum Delay
#**************************************************************

set_max_delay -from [get_ports {DDR2LP_DQ[0]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[1]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[2]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[3]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[4]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[5]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[6]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[7]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[8]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[9]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[10]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[11]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[12]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[13]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[14]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[15]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[16]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[17]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[18]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[19]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[20]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[21]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[22]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[23]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[24]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[25]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[26]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[27]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[28]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[29]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[30]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000
set_max_delay -from [get_ports {DDR2LP_DQ[31]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] 0.000


#**************************************************************
# Set Minimum Delay
#**************************************************************

set_min_delay -from [get_ports {DDR2LP_DQ[0]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[1]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[2]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[3]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[4]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[5]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[6]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[7]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[8]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[9]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[10]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[11]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[12]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[13]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[14]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[15]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[16]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[17]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[18]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[19]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[20]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[21]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[22]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[23]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[24]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[25]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[26]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[27]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[28]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[29]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[30]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515
set_min_delay -from [get_ports {DDR2LP_DQ[31]}] -to [get_keepers {{*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].capture_reg~DFFLO} {*:fpga_lpddr2_inst|*:lpddr2_inst|*:p0|*:umemphy|*:uio_pads|*:dq_ddio[*].ubidir_dq_dqs|*:altdq_dqs2_inst|*input_path_gen[*].aligned_input[*]}}] -1.515


#**************************************************************
# Set Input Transition
#**************************************************************

