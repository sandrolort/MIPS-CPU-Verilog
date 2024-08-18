#**************************************************************
# Create Clock
#**************************************************************
create_clock -period 20 -name sys_clk [get_ports CLOCK_50_B5B]
create_clock -period 8  -name sys_clk [get_ports CLOCK_125_p]

#**************************************************************
# Create Generated Clock
#**************************************************************
derive_pll_clocks

#**************************************************************
# Set Clock Uncertainty
#**************************************************************
derive_clock_uncertainty

#**************************************************************
# Set Input Delay
#**************************************************************
set_input_delay -clock sys_clk -max 2 [get_ports {KEY[*] SW[*] CLOCK_125_p CLOCK_50_B6A CLOCK_50_B7A CLOCK_50_B8A CPU_RESET_n}]
set_input_delay -clock sys_clk -min 0.5 [get_ports {KEY[*] SW[*] CLOCK_125_p CLOCK_50_B6A CLOCK_50_B7A CLOCK_50_B8A CPU_RESET_n}]

#**************************************************************
# Set Output Delay
#**************************************************************
set_output_delay -clock sys_clk -max 2 [get_ports {LEDG[*] LEDR[*] HEX0[*] HEX1[*] HDMI_TX_CLK HDMI_TX_D[*] HDMI_TX_DE HDMI_TX_HS HDMI_TX_VS}]
set_output_delay -clock sys_clk -min 0.5 [get_ports {LEDG[*] LEDR[*] HEX0[*] HEX1[*] HDMI_TX_CLK HDMI_TX_D[*] HDMI_TX_DE HDMI_TX_HS HDMI_TX_VS}]

#**************************************************************
# Set False Path
#**************************************************************
set_false_path -from [get_ports {KEY[0]}] -to *
set_false_path -from [get_ports {SW[*]}] -to *

#**************************************************************
# BCE (BNE) Specific Constraints
#**************************************************************
# Multicycle path for BCE logic
set_multicycle_path -setup 2 -from [get_clocks sys_clk] -through [get_pins {*bce*}] -to [get_clocks sys_clk]
set_multicycle_path -hold 1 -from [get_clocks sys_clk] -through [get_pins {*bce*}] -to [get_clocks sys_clk]

# Max delay for branch decision path
set_max_delay -from [get_pins {*bce*}] -to [get_pins {*PC*}] 10.0

# False path for branch prediction (if implemented)
# set_false_path -from [get_pins {*branch_predict*}] -to [get_pins {*pc_mux*}]

#**************************************************************
# CPU Specific Constraints
#**************************************************************
# Multicycle path for CPU operations
set_multicycle_path -setup 2 -from [get_clocks sys_clk] -to [get_clocks sys_clk]
set_multicycle_path -hold 1 -from [get_clocks sys_clk] -to [get_clocks sys_clk]

#**************************************************************
# I Register and SRAM Specific Constraints
#**************************************************************
# Set minimum delay for I Register to ensure it waits for at least 15 ns
set_min_delay -from [get_pins memory_full/q*] -to [get_pins I*] 15.0

# Set maximum delay for I Register to control setup time
set_max_delay -from [get_pins memory_full/q*] -to [get_pins I*] 19.0

# Multicycle path for SRAM read operation
set_multicycle_path -setup 2 -from [get_pins memory_full/address*] -to [get_pins I*]
set_multicycle_path -hold 1 -from [get_pins memory_full/address*] -to [get_pins I*]

# Set maximum delay for SRAM clock-to-q
set_max_delay -from [get_pins memory_full/clock] -to [get_pins memory_full/q*] 10.0

# Ensure next_pc reaches PC register within specified time
set_max_delay -from [get_pins next_pc*] -to [get_pins PC*] 15.0