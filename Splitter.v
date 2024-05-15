//Module responsible of splitting up arguments. (rs/rt/rd/etc)
//This allows simplification of the ALU as well as some other modules.
module Splitter(
	input [31:0] Instruction_In,
	output[5:0] opc, fun,
	output[4:0] rs, rt, rd, sa,
	output[15:0] imm,
	output[25:0] iindex
);

assign opc = Instruction_In[31:26];
assign rs = Instruction_In[25:21];
assign rt = Instruction_In[20:16];
assign rd = Instruction_In[15:11];
assign sa = Instruction_In[10:6];
assign fun = Instruction_In[5:0];

assign imm = Instruction_In[15:0];
assign iindex = Instruction_In[25:0];

endmodule