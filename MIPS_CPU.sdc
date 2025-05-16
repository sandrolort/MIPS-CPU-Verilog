create_clock -name CPU_CLK -period 20.000 [get_ports CLOCK_50_B5B]

derive_pll_clocks
derive_clock_uncertainty