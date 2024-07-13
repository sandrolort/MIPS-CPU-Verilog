#**************************************************************
# Merged SDC File
#**************************************************************

#**************************************************************
# Create Clock
#**************************************************************
create_clock -period 8 [get_ports CLOCK_125_p]
create_clock -period 20 [get_ports CLOCK_50_B5B]
create_clock -period 20 [get_ports CLOCK_50_B6A]
create_clock -period 20 [get_ports CLOCK_50_B7A]
create_clock -period 20 [get_ports CLOCK_50_B8A]
create_clock -name "button_clk" -period 1000.000 [get_ports {KEY[1]}]
create_clock -name "sys_clk" -period 20.000 [get_ports {CLOCK_50_B5B}]

#**************************************************************
# Create Generated Clock
#**************************************************************
derive_pll_clocks

#**************************************************************
# Set Clock Latency
#**************************************************************
set_clock_latency -source 1.0 [get_clocks {button_clk}]
set_clock_latency -source 0.5 [get_clocks {sys_clk}]

#**************************************************************
# Set Clock Uncertainty
#**************************************************************
derive_clock_uncertainty

#**************************************************************
# Set Input Delay
#**************************************************************
set_input_delay -clock button_clk -max 3 [get_ports {KEY[*] SW[*]}]
set_input_delay -clock button_clk -min 1 [get_ports {KEY[*] SW[*]}]
set_input_delay -clock sys_clk -max 2 [get_ports {CLOCK_125_p CLOCK_50_B6A CLOCK_50_B7A CLOCK_50_B8A CPU_RESET_n}]
set_input_delay -clock sys_clk -min 0.5 [get_ports {CLOCK_125_p CLOCK_50_B6A CLOCK_50_B7A CLOCK_50_B8A CPU_RESET_n}]

#**************************************************************
# Set Output Delay
#**************************************************************
set_output_delay -clock button_clk -max 3 [get_ports {LEDG[*] LEDR[*] HEX0[*] HEX1[*]}]
set_output_delay -clock button_clk -min 1 [get_ports {LEDG[*] LEDR[*] HEX0[*] HEX1[*]}]
set_output_delay -clock sys_clk -max 2 [get_ports {HDMI_TX_CLK HDMI_TX_D[*] HDMI_TX_DE HDMI_TX_HS HDMI_TX_VS}]
set_output_delay -clock sys_clk -min 0.5 [get_ports {HDMI_TX_CLK HDMI_TX_D[*] HDMI_TX_DE HDMI_TX_HS HDMI_TX_VS}]

#**************************************************************
# Set Clock Groups
#**************************************************************
set_clock_groups -asynchronous -group {button_clk} -group {sys_clk}

#**************************************************************
# Set False Path
#**************************************************************
set_false_path -from [get_clocks CLOCK_50_B6A] -to [get_clocks {fpga_lpddr2_inst|fpga_lpddr2_inst|pll0|pll_config_clk}]
set_false_path -from [get_clocks CLOCK_50_B6A] -to [get_clocks {fpga_lpddr2_inst|fpga_lpddr2_inst|pll0|pll_afi_half_clk}]
set_false_path -from [get_clocks CLOCK_50_B6A] -to [get_clocks {fpga_lpddr2_inst|fpga_lpddr2_inst|pll0|pll_avl_clk}]
set_false_path -from [get_clocks CLOCK_50_B6A] -to [get_clocks {fpga_lpddr2_inst|fpga_lpddr2_inst|pll0|pll_afi_clk}]
set_false_path -from [get_ports {KEY[0]}] -to *
set_false_path -from [get_ports {SW[0] SW[1] SW[2] SW[3] SW[4] SW[5] SW[6] SW[7] SW[8] SW[9]}] -to *

#**************************************************************
# Set Multicycle Path
#**************************************************************
set_multicycle_path -from {Avalon_bus_RW_Test:fpga_lpddr2_Verify|avl_address*} -to {Avalon_bus_RW_Test:fpga_lpddr2_Verify|avl_writedata*} -setup -end 6
set_multicycle_path -from {Avalon_bus_RW_Test:fpga_lpddr2_Verify|cal_data*} -to {Avalon_bus_RW_Test:fpga_lpddr2_Verify|avl_writedata*} -setup -end 6
set_multicycle_path -from {Avalon_bus_RW_Test:fpga_lpddr2_Verify|avl_address*} -to {Avalon_bus_RW_Test:fpga_lpddr2_Verify|avl_writedata*} -hold -end 6
set_multicycle_path -from {Avalon_bus_RW_Test:fpga_lpddr2_Verify|cal_data*} -to {Avalon_bus_RW_Test:fpga_lpddr2_Verify|avl_writedata*} -hold -end 6

# Add any design-specific constraints here
# For example:
# set_false_path -from [get_ports {CPU_RESET_n}] -to *
# set_multicycle_path -setup 2 -from [get_clocks {button_clk}] -to [get_clocks {sys_clk}]