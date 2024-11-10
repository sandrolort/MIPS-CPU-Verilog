module cpu (
    input clk,
    input mem_clk,
    input rst,
    output halt,
    output [31:0] alures,
    output [31:0] register_out,
    output [31:0] pc,
    output e,
	 // LPDDR2 Memory
    output [26:0] address,
    output [31:0] write_data,
    input [31:0] read_data,
    output read_req,
    output write_req,
	input waiting
);

// Splitter, this divides up instruction for ease of use later on.
wire [5:0] opc, fun;
wire [4:0] rs, rt, rd, sa;
wire [15:0] imm;
wire [25:0] i_index;
wire [31:0] instruction;

splitter splt(
	instruction,
	opc, fun,
	rs, rt, rd, sa,
	imm,
	i_index
);

//Halt instruction - The CPU stops executing if instruction is an array of 31 1-s
assign halt = instruction == {32{1'b0}} || waiting;

//Memory
wire [31:0] memory_address_in;
wire [31:0] memory_data_out, memory_data_in, next_pc, i;
wire s;
memory_full mem(
	clk, mem_clk, rst, s,
	next_pc, memory_address_in[29:0], memory_data_in,
	i,
	pc,
	memory_data_out,
	e,
	// LPDDR2 Memory
	address,
	write_data,
	read_data,
	read_req,
	write_req
);

//Instruction Decoder
wire id;
wire [3:0] af;
wire [4:0] cad;
wire [1:0] gp_mux_sel, pc_mux_select;
wire [2:0] shift_type;
wire [3:0] bf;
wire alu_mux_sel, gp_we;

i_decoder idc(
	i,
	af,
	id, alu_mux_sel,
	cad,
	gp_we, gp_mux_sel,
	bf,
	s, //DM_WE
	shift_type,
	pc_mux_select
);

assign instruction = i;

//Branch Condition Evaluation unit
wire [31:0] a, b;
wire bcres;

bce bce(a, b, bf, bcres);

//General Purpose Registers
wire wren;
wire [4:0] addr_a, addr_b, addr_c;
wire [31:0] data_out_a, data_out_b;
wire [31:0] data_in_c;

gpr gpr(
	clk,
	wren, rst,
	addr_a, addr_b, addr_c,
	data_out_a, data_out_b,
	data_in_c,
	register_out
);

//Arithmetic Logical Unit
wire [31:0] src_a, src_b;
wire ovfalu;

alu_decoder_bridge aludec(
	opc,
	src_a,
	src_b,
	af,
	id,
	alures,
	ovfalu
);

//Connecting the wires + additional modules
wire [31:0] imm_extension;
ieu #(16,32) ext(opc[0], imm, imm_extension);

assign addr_a = rs;
assign addr_b = rt;
assign addr_c = opc == 6'b000011 ? 5'd31 : cad;
assign wren = ~e && gp_we;
assign src_a = data_out_a;
assign src_b = alu_mux_sel ? imm_extension : data_out_b;
assign memory_address_in = alures;
assign memory_data_in = data_out_b;

//Shifter
wire [31:0] shift_input, shift_result;
wire [4:0] shift_amount;
wire [1:0] shift_funct;

shifter shf(
	shift_funct,
	shift_input,
	shift_amount,
	shift_result
);

assign shift_input = data_out_b;
assign shift_amount = shift_type[2] ? data_out_a[3:0] : sa;
assign shift_funct = shift_type[1:0];
wire [31:0] gp_data_in;

assign gp_data_in = gp_mux_sel == 2'b00 ? alures :
					gp_mux_sel == 2'b01 ? memory_data_out :
					gp_mux_sel == 2'b10 ? shift_result :
					pc + 4;

assign data_in_c = gp_data_in;
assign a = data_out_a;
assign b = data_out_b;

//Left bottom side of the schematic/NextPC
wire [31:0] incr;
assign incr = pc + 4;
wire [31:0] adder;

assign adder = $unsigned($signed(pc) + $signed(imm << 2));
wire [31:0] mux_pc_bres;

assign mux_pc_bres = bcres ? adder : incr;
wire [31:0] jjal;

assign jjal = {incr[31:28],i_index,2'b00};

// NextPC Calculation
assign next_pc = halt ? pc :
				pc_mux_select == 2'b11 ? incr :
				pc_mux_select == 2'b01 ? mux_pc_bres : //Jr/Jalr
				pc_mux_select == 2'b10 ? jjal : //Branch
				data_out_a; //J/Jal
endmodule