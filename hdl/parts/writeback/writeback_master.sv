module writeback_master(
    input [31:0] memory_out,
    input [31:0] alu_res,
    input [31:0] shift_res,
    input [31:0] link_addr,
	input [31:0] spr_in,
    input [2:0] gp_mux_sel,
    output [31:0] gpr_data_in
);

assign gpr_data_in = 
    (gp_mux_sel == 3'b000) ? alu_res :
    (gp_mux_sel == 3'b001) ? memory_out :
    (gp_mux_sel == 3'b010) ? shift_res :
    (gp_mux_sel == 3'b011) ? link_addr :
	(gp_mux_sel == 3'b100) ? spr_in :
    32'b0;

endmodule
