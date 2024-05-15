module CPU (
	input clk,
	input rst,
	output halt,
	output [0:31] Alures,
	output [0:31] registerOut,
	output [0:31] pc
);
// Splitter, this divides up instruction for ease of use later on.
wire [0:5] opc, fun;
wire [0:4] rs, rt, rd, sa;
wire [0:15] imm;
wire [0:25] iindex;
wire [0:31] instruction;

splitter splt(
instruction,
opc, fun,
rs, rt, rd, sa,
imm,
iindex
);

//Halt instruction - The CPU stops executing if instruction is an array of 31 1-s
assign halt = instruction == {32{1'b0}};

//Memory
wire [0:31] memory_address_in;
wire [0:31] memory_data_out, memory_data_in, next_pc, I;
wire S, E;

memory_full mem(
	clk, rst, S,
	next_pc, memory_address_in[2:31], memory_data_in,
	I,
	pc,
	memory_data_out,
	E
);

//Instruction Decoder
wire ID;
wire [0:3] Af;
wire [0:4] Cad;
wire [0:1] GP_MUX_SEL, PC_MUX_Select;
wire [0:2] Shift_type;
wire [0:3] Bf;
wire ALU_MUX_SEL, GP_WE;

IDecoder idc(//I really don't
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
wire [0:31] a, b;
wire bcres;

BCE bce(a, b, Bf, bcres);

//General Purpose Registers
wire wren;
wire [0:4] addrA, addrB, addrC;
wire [0:31] data_out_A, data_out_B;
wire [0:31] data_in_C;

GPR gpr(
	clk,
	wren, rst,
	addrA, addrB, addrC,
	data_out_A, data_out_B,
	data_in_C,
	registerOut
);

//Arithmetic Logical Unit
wire [0:31] srcA, srcB;
wire ovfalu;
ALU ULA(
	ID,//Connected from IDecoder
	srcA, srcB,
	Af,
	opc,
	Alures,
	ovfalu
);

//Connecting the wires + additional modules
wire E_delayed;
Delay #(.Bits(1)) E_D(clk, E, E_delayed); //Parametrized declaration.
wire GP_WE_delayed;
Delay #(.Bits(1)) GPWE_D(clk, GP_WE, GP_WE_delayed);

wire [0:31] Imm_Extension;
IEU #(16,32) ext(opc[5], imm, Imm_Extension);

assign addrA = rs;
assign addrB = rt;
wire [0:4] rd_delayed;
Delay #(.Bits(5)) rs_D(clk, Cad, rd_delayed);
assign addrC = opc == 6'b000011 ? 5'd31 : rd_delayed;

assign wren = E_delayed && GP_WE_delayed;

assign srcA = data_out_A;
assign srcB = ALU_MUX_SEL ? Imm_Extension : data_out_B;

assign memory_address_in = Alures;
assign memory_data_in = data_out_B;

//Shifter
wire [0:31] shift_input, shift_result;
wire [0:4] shift_amount;
wire [0:1] shift_funct;

shifter shf(
	shift_funct,
	shift_input,
	shift_amount,
	shift_result
);

assign shift_input = data_out_B;
assign shift_amount = Shift_type[0] ? data_out_A[28:31] : sa;
assign shift_funct = Shift_type[1:2];

wire [0:31] GP_DATA_IN;
wire [0:31] pc_delayed;
//This was necessary because otherwise Jalr instruction would save new pc.
Delay PC_D(clk, pc, pc_delayed);

assign GP_DATA_IN = 	GP_MUX_SEL == 2'b00 ? Alures				:
							GP_MUX_SEL == 2'b01 ? memory_data_out	:
							GP_MUX_SEL == 2'b10 ? shift_result 		:
							pc_delayed + 4;

wire [0:31] GP_DATA_IN_delayed;
Delay GP_D(clk, GP_DATA_IN, GP_DATA_IN_delayed);
assign data_in_C = GP_DATA_IN_delayed;

assign a = data_out_A;
assign b = data_out_B;

//Left bottom side of the schematic/NextPC
wire [0:31] Incr;
assign Incr = pc + 4;

wire [0:17] branch;
assign branch = {imm,2'b00};

wire [0:31]Imm_Extension_S;
IEU #(16,32) ext2(0, branch, Imm_Extension_S);

wire signed [0:31] Adder;
assign Adder = $signed(pc) + $signed(Imm_Extension_S);

wire [0:31] muxPCBres;
assign muxPCBres = bcres ? $unsigned(Adder) : Incr;

wire [0:31] jjal;
assign jjal = {Incr[0:3],iindex,2'b00};

assign next_pc = 	halt ? pc :
						PC_MUX_Select == 2'b11 ? Incr			: //Jr/Jalr
						PC_MUX_Select == 2'b01 ? muxPCBres 	: //Branch
						PC_MUX_Select == 2'b10 ? jjal			: //J/Jal
														 data_out_A ;
endmodule