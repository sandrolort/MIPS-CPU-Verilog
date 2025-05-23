module decoder_deconcat (
    input [41:0] packed_in,
    output [3:0] af,
    output i,
    output alu_mux_sel,
    output [2:0] shift_type,
    output [4:0] cad,
    output gp_we,
    output [2:0] gp_mux_sel,
    output [3:0] bf,
    output [1:0] pc_mux_select,
    output spr_mux_sel,
    output mem_wren,
    output mem_rren,
    output [4:0] rs, rt, rd
);

assign {af, i, alu_mux_sel, shift_type, cad, gp_we,
        gp_mux_sel, bf, pc_mux_select, spr_mux_sel, mem_wren, mem_rren,
        rs, rt, rd} = packed_in;

endmodule