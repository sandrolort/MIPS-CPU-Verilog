//Module responsible of splitting up arguments. (rs/rt/rd/etc)
//This allows simplification of the ALU as well as some other modules.
module splitter(
	input [31:0] instruction_in,
	output[5:0] opc, fun,
	output[4:0] rs, rt, rd, sa,
	output[15:0] imm,
	output[25:0] iindex
);

assign opc = instruction_in[31:26];
assign rs = instruction_in[25:21];
assign rt = instruction_in[20:16];
assign rd = instruction_in[15:11];
assign sa = instruction_in[10:6];
assign fun = instruction_in[5:0];

assign imm = instruction_in[15:0];
assign iindex = instruction_in[25:0];

endmodule