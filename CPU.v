module CPU (
	input clk,
	input mem_clk,
	input rst,
	output halt,
	output [31:0] Alures,
	output [31:0] registerOut,
	output [31:0] pc,
	output E
);

// Splitter, this divides up instruction for ease of use later on.
wire [5:0] opc, fun;
wire [4:0] rs, rt, rd, sa;
wire [15:0] imm;
wire [25:0] iindex;
wire [31:0] instruction;

Splitter splt(
	instruction,
	opc, fun,
	rs, rt, rd, sa,
	imm,
	iindex
);

//Halt instruction - The CPU stops executing if instruction is an array of 31 1-s
assign halt = instruction == {32{1'b0}};

//Memory
wire [31:0] memory_address_in;
wire [31:0] memory_data_out, memory_data_in, next_pc, I;
wire S;

memory_full mem(
	clk, mem_clk, rst, S,
	next_pc, memory_address_in[29:0], memory_data_in,
	I,
	pc,
	memory_data_out,
	E
);

//Instruction Decoder
wire ID;
wire [3:0] Af;
wire [4:0] Cad;
wire [1:0] GP_MUX_SEL, PC_MUX_Select;
wire [2:0] Shift_type;
wire [3:0] Bf;
wire ALU_MUX_SEL, GP_WE;

IDecoder idc(
	I,
	Af,
	ID, ALU_MUX_SEL,
	Cad,
	GP_WE, GP_MUX_SEL,
	Bf,
	S, //DM_WE
	Shift_type,
	PC_MUX_Select
);

assign instruction = I;

//Branch Condition Evaluation unit
wire [31:0] a, b;
wire bcres;

bce bce(a, b, Bf, bcres);

//General Purpose Registers
wire wren;
wire [4:0] addrA, addrB, addrC;
wire [31:0] data_out_A, data_out_B;
wire [31:0] data_in_C;

GPR gpr(
	clk,
	wren, rst,
	addrA, addrB, addrC,
	data_out_A, data_out_B,
	data_in_C,
	registerOut
);

//Arithmetic Logical Unit
wire [31:0] srcA, srcB;
wire ovfalu;

// ALU ULA(
// 	ID,//Connected from IDecoder
// 	srcA, srcB,
// 	Af,
// 	opc,
// 	Alures,
// 	ovfalu
// );

ALUDecoderBridge #(32) aludec(
	opc,
    srcA,
	srcB,
	Af,
	ID,
    Alures,
	ovfalu
);

//Connecting the wires + additional modules
wire [31:0] Imm_Extension;
IEU #(16,32) ext(opc[0], imm, Imm_Extension);

assign addrA = rs;
assign addrB = rt;
assign addrC = opc == 6'b000011 ? 5'd31 : Cad;

assign wren = ~E && GP_WE;

assign srcA = data_out_A;
assign srcB = ALU_MUX_SEL ? Imm_Extension : data_out_B;

assign memory_address_in = Alures;
assign memory_data_in = data_out_B;

//Shifter
wire [31:0] shift_input, shift_result;
wire [4:0] shift_amount;
wire [1:0] shift_funct;

Shifter shf(
	shift_funct,
	shift_input,
	shift_amount,
	shift_result
);

assign shift_input = data_out_B;
assign shift_amount = Shift_type[2] ? data_out_A[3:0] : sa;
assign shift_funct = Shift_type[1:0];

wire [31:0] GP_DATA_IN;

assign GP_DATA_IN = 	GP_MUX_SEL == 2'b00 ? Alures			:
						GP_MUX_SEL == 2'b01 ? memory_data_out	:
						GP_MUX_SEL == 2'b10 ? shift_result 		:
						pc + 4;

assign data_in_C = GP_DATA_IN;

assign a = data_out_A;
assign b = data_out_B;

//Left bottom side of the schematic/NextPC
wire [31:0] Incr;
assign Incr = pc + 4;

wire [31:0] Adder;/*synthesis keep*/

//todo bad name, change
assign Adder = $unsigned($signed(pc) + $signed(imm << 2));

wire [31:0] muxPCBres/*synthesis keep*/;
assign muxPCBres = bcres ? Adder : Incr;

wire [31:0] jjal/*synthesis keep*/;
assign jjal = {Incr[31:28],iindex,2'b00};

assign next_pc = 	halt ? pc :
					PC_MUX_Select == 2'b11 ? Incr		: 
					PC_MUX_Select == 2'b01 ? muxPCBres 	: //Jr/Jalr
					PC_MUX_Select == 2'b10 ? jjal		: //Branch
											 data_out_A ; //J/Jal
endmodule