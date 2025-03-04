
//==============================================

// File: hdl/parts/decode/i_decoder.v
// Directory: hdl/parts/decode

module i_decoder(
    input wire [31:0] instruction,
    output [4:0] rs, rt,
    output wire [39:0] out_data_packed
);

wire [5:0] opc, fun;
wire [4:0] rd, sa;
wire [15:0] imm;
wire [25:0] iindex;
wire [3:0] af;
wire i, alu_mux_sel, gp_we, mem_wren, mem_rren;
wire [2:0] shift_type;
wire [4:0] cad, cadn;
wire [1:0] gp_mux_sel, pc_mux_select;
wire [3:0] bf;
wire [1:0] ttype;

splitter splt(instruction, opc, fun, rs, rt, rd, sa, imm, iindex);  

assign ttype = Type(opc);
assign af = i ? {(~instruction[28] & instruction[27]), instruction[28:26]} : instruction[3:0];
assign i = ttype != 2'b10;
assign alu_mux_sel = ttype != 2'b10;
assign cad = i ? rt : rd;
assign gp_we = IsWritten(opc, fun);
assign gp_mux_sel = WhereFrom(ttype, opc, fun);
assign bf = {instruction[28:26], instruction[16]};
assign mem_wren = opc == 6'b101011; // sw instruction
assign mem_rren = opc == 6'b100011; // lw instruction
assign shift_type = af == 3'b000 ? {ttype != 2'b10, 2'b00} : // sll
                    af == 3'b010 ? {ttype != 2'b10, 2'b01} : // srl
                    {ttype != 2'b10, 2'b10}; // sra
assign pc_mux_select = PCSelect(opc, fun);

assign cadn = opc == 6'b000011 || opc == 6'b0 && fun == 4'b1001 ? 31 : cad; //For Jalr, Jal

decoder_concat concat_inst (
    .af(af),
    .i(i),
    .alu_mux_sel(alu_mux_sel),
    .shift_type(shift_type),
    .cad(cadn),
    .gp_we(gp_we),
    .gp_mux_sel(gp_mux_sel),
    .bf(bf),
    .pc_mux_select(pc_mux_select),
    .mem_wren(mem_wren),
    .mem_rren(mem_rren),//readenable
    .packed_out(out_data_packed),
    .rs(rs),
    .rt(rt),
    .rd(rd)
);

function [1:0] Type(input [5:0] instruction);
    casez (instruction)
        6'b001???, 6'b1???11, 6'b0001??, 6'b000001: Type = 2'b00;//I-Type
        6'b00001?: Type = 2'b01;//J-Type
        default: Type = 2'b10;//R-type
    endcase
endfunction

function [0:0] IsWritten(input [5:0] opc, input [5:0] fun);
    casez(opc)
        6'b001???, 6'b100011, 6'b000011: IsWritten = 1'b1;
        6'b000000: IsWritten = fun != 6'b001000;
        default: IsWritten = 1'b0;
    endcase
endfunction

function [1:0] WhereFrom(input [2:0]ttype, input [5:0] opc, input [5:0]fun);
    case(ttype)
        2'b10: casez(fun)
            6'b001001: WhereFrom = 2'b11; // PC
            6'b000010, 6'b000011: WhereFrom = 2'b10; //Shift
            default: WhereFrom = 2'b00; // ALU
        endcase
        2'b00: if(opc == 6'b100011) WhereFrom = 2'b01; //Memory
                else casez (opc)
                    6'b001???: WhereFrom = 2'b00; //ALU
                    default: WhereFrom = 2'b11; //PC
                endcase
        default: WhereFrom = 2'b11;
    endcase
endfunction

function [1:0] PCSelect(input [5:0] opc, input [5:0] fun);
    casez(opc)
        6'b000000: PCSelect =
            (fun == 6'b001000 || fun == 6'b001001) ?
            2'b00 : 2'b11; //Jr/Jalr
        6'b0001??, 6'b000001: PCSelect = 2'b01; //Branch
        6'b00001?: PCSelect = 2'b10; //J/Jal
        default: PCSelect = 2'b11;
    endcase
endfunction

endmodule
//==============================================

// File: hdl/parts/decode/next_pc_calc.v
// Directory: hdl/parts/decode

module next_pc_calc(
    input wire [31:0] pc,
    input wire [31:0] a_gpr, b_gpr,
    input wire [31:0] i_fetch,
    input wire [39:0] decode_data_packed,
    output wire [31:0] next_pc
);

// Splitter logic
wire [5:0] opc, fun;
wire [4:0] rs, rt, rd, sa;
wire [15:0] imm;
wire [25:0] iindex;
splitter splt(i_fetch, opc, fun, rs, rt, rd, sa, imm, iindex);

// Unpack only the necessary wires from decode_data_packed
wire [3:0] bf;
wire [1:0] pc_mux_select;
decoder_deconcat deconcat_inst (
    .packed_in(decode_data_packed),
    .bf(bf),
    .pc_mux_select(pc_mux_select)
);

// Branch condition evaluation unit
wire bcres;
bce bce(a_gpr, b_gpr, bf, bcres);

// Next PC calculation logic
wire [31:0] incr = pc + 4;
wire [31:0] pc_imm_sum = $unsigned($signed(pc+4) + $signed(imm << 2));
wire [31:0] jjal = {incr[31:28], iindex, 2'b00};
wire [31:0] mux_bcres = bcres ? pc_imm_sum : incr;

assign next_pc =
    (i_fetch == 32'b0)       ? pc        : // Halt signal
    (pc_mux_select == 2'b11) ? incr      :
    (pc_mux_select == 2'b01) ? mux_bcres :
    (pc_mux_select == 2'b10) ? jjal      :
                               a_gpr;

endmodule
//==============================================

// File: hdl/parts/decode/bce.v
// Directory: hdl/parts/decode

// Branch Condition Evaluation unit
module bce (
	input  [31:0] a, b,
	input  [3:0] bf,
	output bcres
);

wire [31:0] d;
wire eq, lt, le;

assign d= (bf[3]&~bf[2]?b:{32{1'b0}});
assign eq = (a==d);
assign lt= a[31];
assign le= lt | (a=={32{1'b0}});
assign bcres = (~bf[3] & ~bf[2] & bf[1] & (bf[0] ^ lt)) |
               ( bf[3] & ~bf[2] & (bf[1] ^ eq)) |
               ( bf[3] &  bf[2] & (bf[1] ^ le));
endmodule
//==============================================

// File: hdl/parts/decode/decode_master.v
// Directory: hdl/parts/decode

module decode_master(
    input [31:0] a_gpr, b_gpr,
    input [31:0] i_fetch,
    input [31:0] pc,
    output [31:0] next_pc,
    output [4:0] rs, rt,
    output [39:0] decoder_packed
);

i_decoder idc(
    .rs(rs),
    .rt(rt),
    .instruction(i_fetch),
    .out_data_packed(decoder_packed)
);

next_pc_calc next_pc_calc_inst(
    .pc(pc),
    .a_gpr(a_gpr),
    .b_gpr(b_gpr),
    .i_fetch(i_fetch),
    .decode_data_packed(decoder_packed),
    .next_pc(next_pc)
);


endmodule
//==============================================

// File: hdl/parts/execute/alu.v
// Directory: hdl/parts/execute

module alu(
    input [31:0] a,
    input [31:0] b,
    input [3:0] af,
    input i,
    output [31:0] alures,
    output ovfalu
);

wire [31:0] au_result;
wire au_neg, au_ovf;

au arithmetic_unit (
    .a(a),
    .b(b),
    .sub(af[1]),
    .u(af[0]),
    .s(au_result),
    .neg(au_neg),
    .ovf(au_ovf)
);

wire [31:0] mux_result;
assign mux_result = 
    (af == 4'b0000 || af == 4'b0001 || af == 4'b0010 || af == 4'b0011) ? au_result :
    (af == 4'b0100) ? a & b :
    (af == 4'b0101) ? a | b :
    (af == 4'b0110) ? a ^ b :
    (af == 4'b0111) ? i ? {b[15:0], 16'b0} : ~(a | b) :
    (af == 4'b1010 || af == 4'b1011) ? {31'b0, au_neg} :
    {32{1'b0}};

assign alures = mux_result;
assign ovfalu = au_ovf & ~af[3] & ~af[2];

endmodule

//==============================================

// File: hdl/parts/execute/au.v
// Directory: hdl/parts/execute

module au(
    input [31:0] a,
	input [31:0] b,
	input sub,
	input u,
    output [31:0] s,
	output neg,
	output ovf
);
	wire [31:0] d;
	wire lcin;
	wire cout;
	
	assign d = b ^ {32{sub}};
	
	assign {cout, s} = a + d + sub;
	
	assign lcin = s[31] ^ a[31] ^ d[31];
	
	assign neg = (~u & (a[31] ^ d[31] ^ cout)) | (u & ~cout & sub);
	
	assign ovf = u & (cout ^ lcin);
endmodule

//==============================================

// File: hdl/parts/execute/execute_master.v
// Directory: hdl/parts/execute

module execute_master(
    input [39:0] decoder_packed,
    input [31:0] a_decoder, b_decoder,
    input [31:0] i_decoder,
    input [31:0] pc,
    output [31:0] alu_res, shift_res,
    output [31:0] dm_in,
    output [31:0] ea,
    output ovfalu
);

wire [5:0] opc, fun;
wire [4:0] rs, rt, rd, sa;
wire [15:0] imm;
wire [25:0] iindex;
splitter splt(i_decoder, opc, fun, rs, rt, rd, sa, imm, iindex);

wire [31:0] imm_extended = {{16{imm[15]}}, imm};
wire [31:0] alu_b;
wire [3:0] af;
wire i, alu_mux_sel;
wire [2:0] shift_type;

decoder_deconcat deconcat_inst (
    .packed_in(decoder_packed),
    .af(af),
    .i(i),
    .alu_mux_sel(alu_mux_sel),
    .shift_type(shift_type)
);

assign alu_b = alu_mux_sel ? imm_extended : b_decoder;
assign dm_in = b_decoder;

alu_decoder_bridge aludec(
    .opcode(opc),
    .a(a_decoder),
    .b(alu_b),
    .af(af),
    .i(i),
    .result(alu_res),
    .ovfalu(ovfalu)
);

shifter shft (
    .funct(shift_type),
    .a(b_decoder),
    .shamt(sa),
    .res(shift_res)
);

assign ea = a_decoder + imm_extended; //todo make it signed addition

endmodule
//==============================================

// File: hdl/parts/execute/alu_decoder_bridge.v
// Directory: hdl/parts/execute

module alu_decoder_bridge (
    input [5:0] opcode,
    input [31:0] a,
    input [31:0] b,
    input [3:0] af,
    input i,
    output [31:0] result,
    output ovfalu
);

//TODO This is unnecessary. Remove.
wire [3:0] af_alu =  
        ~i ? af :
        opcode == 6'b001001 ? 4'b0001 :
        opcode == 6'b001000 ? 4'b0000 :
        opcode == 6'b001011 ? 4'b1011 :
        opcode == 6'b001010 ? 4'b1010 :
        opcode == 6'b001100 ? 4'b0100 :
        opcode == 6'b001101 ? 4'b0101 :
        opcode == 6'b001110 ? 4'b0111 :
        opcode == 6'b001111 ? 4'b0111 :
        opcode == 6'b100011 ? 4'b0001 :
        opcode == 6'b101011 ? 4'b0001 :
        4'b1111; // forcing alu to fall back to default.

alu ula (a,b,af_alu,i,result,ovfalu);
    
endmodule
//==============================================

// File: hdl/parts/execute/shifter.v
// Directory: hdl/parts/execute

module shifter (
    input  [1:0]  funct,
    input  [31:0] a,
    input  [4:0]  shamt,
    output wire [31:0] res
);

assign res =  	(funct == 2'b00) ? (a << shamt) :   // Logical left shift
                (funct == 2'b01) ? (a >> shamt) :   // Logical right shift
                (a >>> shamt);                      // Arithmetic right shift

endmodule
