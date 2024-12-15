module decode_master(
    input [31:0] a_gpr, b_gpr,
    input [31:0] i_fetch,
    input [31:0] pc,
    output [31:0] next_pc,
    output [4:0] rs, rt,
    output [38:0] decoder_packed
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