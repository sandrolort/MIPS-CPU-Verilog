module i_decoder(
    input wire [31:0] instruction,
    output [4:0] rs, rt,
    output wire [39:0] out_data_packed,
	output reg is_illegal = 1'b1
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


function [1:0] Type(input [5:0] opc, input [5:0] fun, input [4:0] rt, input [4:0] rs);
        begin
                is_illegal = 1'b0;
        casez (opc)
            6'b10?011, 6'b001???, 6'b00010?: Type = 2'b00; // I-Type
            6'b000001: if (rt[4:1] == 4'b0000) 
                            Type = 2'b00; // I-Type
            6'b00011?: if (rt == 5'b00000) 
                            Type = 2'b00; // I-Type
            6'b000000: if (fun[5:3] == 3'b100 || fun == 6'b000010 || fun[5:1] == 5'b10101 || fun == 6'b001000 || fun == 6'b001010 || fun == 6'b001100)
                            Type = 2'b10; // R-Type
            6'b010000: if ((fun == 6'b011000 && rs == 5'b10000) || rs == 5'b00100 || rs == 5'b00000)
                            Type = 2'b10; // R-Type
            6'b00001?: Type = 2'b01; // J-Type
                        default: begin
                                Type = 2'b11; // None of the above, undefined(c) -> illegal instruction
                                                                is_illegal = 1'b1;
                                $display("ill: Undefined Instruction");
								$stop; // According to Table 13 on page 377, ill should be aborted
                        end
                endcase
    end
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