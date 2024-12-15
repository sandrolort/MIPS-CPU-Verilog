// Copyright (C) 2024  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// VENDOR "Altera"
// PROGRAM "Quartus Prime"
// VERSION "Version 23.1std.1 Build 993 05/14/2024 SC Lite Edition"

// DATE "12/15/2024 16:23:52"

// 
// Device: Altera 5CGXFC5C6F27C7 Package FBGA672
// 

// 
// This greybox netlist file is for third party Synthesis Tools
// for timing and resource estimation only.
// 


module clock_control (
	inclk,
	ena,
	outclk)/* synthesis synthesis_greybox=0 */;
input 	inclk;
input 	ena;
output 	outclk;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;

wire \altclkctrl_0|clock_control_altclkctrl_0_sub_component|wire_sd1_outclk ;
wire \inclk~input_o ;
wire \ena~input_o ;


clock_control_clock_control_altclkctrl_0 altclkctrl_0(
	.outclk(\altclkctrl_0|clock_control_altclkctrl_0_sub_component|wire_sd1_outclk ),
	.inclk(\inclk~input_o ),
	.ena(\ena~input_o ));

assign \inclk~input_o  = inclk;

assign \ena~input_o  = ena;

assign outclk = \altclkctrl_0|clock_control_altclkctrl_0_sub_component|wire_sd1_outclk ;

endmodule

module clock_control_clock_control_altclkctrl_0 (
	outclk,
	inclk,
	ena)/* synthesis synthesis_greybox=0 */;
output 	outclk;
input 	inclk;
input 	ena;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



clock_control_clock_control_altclkctrl_0_sub clock_control_altclkctrl_0_sub_component(
	.outclk(outclk),
	.inclk({gnd,gnd,gnd,inclk}),
	.ena(ena));

endmodule

module clock_control_clock_control_altclkctrl_0_sub (
	outclk,
	inclk,
	ena)/* synthesis synthesis_greybox=0 */;
output 	outclk;
input 	[3:0] inclk;
input 	ena;

wire gnd;
wire vcc;
wire unknown;

assign gnd = 1'b0;
assign vcc = 1'b1;
// unknown value (1'bx) is not needed for this tool. Default to 1'b0
assign unknown = 1'b0;



cyclonev_clkena sd1(
	.inclk(inclk[0]),
	.ena(ena),
	.outclk(outclk),
	.enaout());
defparam sd1.clock_type = "global clock";
defparam sd1.disable_mode = "low";
defparam sd1.ena_register_mode = "falling edge";
defparam sd1.ena_register_power_up = "high";
defparam sd1.test_syn = "high";

endmodule
