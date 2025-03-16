module spr (
	input wire clk,
	input wire jisr,
	input wire [22:0] mca,
	input wire rpt,
	input wire [31:0] pc,
	input wire [31:0] next_pc,
	input wire [31:0] ea,
	input wire [31:0] data_in,
	input wire [2:0] reg_sel,
    input wire sprw,
	output wire [31:0] spr_out,
	output wire [31:0] mode
);
	reg [31:0] spr_regs [7:0];

	initial begin : init_spr
	   integer i;
	   for (i = 0; i < 8; i = i + 1)
			spr_regs[i] = 32'b0;
	end

	always @(posedge clk) begin
  		if (jisr) begin
 			spr_regs[0] <= (reg_sel == 3'b000 && sprw)  ? data_in : ((rpt) ? {9'b0, mca} : ea);
 			spr_regs[1] <= (reg_sel == 3'b001 && sprw) ? data_in : {31'd0, rpt};
 			spr_regs[2] <= (reg_sel == 3'b010 && sprw) ? data_in : next_pc;
 			spr_regs[3] <= (reg_sel == 3'b011 && sprw) ? data_in : spr_regs[3];
 			spr_regs[4] <= (reg_sel == 3'b100 && sprw) ? data_in : spr_regs[4];
 			spr_regs[5] <= (reg_sel == 3'b101 && sprw) ? data_in : spr_regs[5];
 			spr_regs[6] <= (reg_sel == 3'b110 && sprw) ? data_in : spr_regs[6];
 			spr_regs[7] <= (reg_sel == 3'b111 && sprw) ? data_in : spr_regs[7];
  		end else begin
 			spr_regs[0] <= (reg_sel == 3'b000 && sprw) ? data_in : {9'b0, mca};
 			spr_regs[1] <= (reg_sel == 3'b001 && sprw) ? data_in : {31'd0, rpt};
 			spr_regs[2] <= (reg_sel == 3'b010 && sprw) ? data_in : pc;
 			spr_regs[3] <= (reg_sel == 3'b011 && sprw) ? data_in : next_pc;
 			spr_regs[4] <= (reg_sel == 3'b100 && sprw) ? data_in : ea;
 			spr_regs[5] <= (reg_sel == 3'b101 && sprw) ? data_in : spr_regs[5];
 			spr_regs[6] <= (reg_sel == 3'b110 && sprw) ? data_in : spr_regs[6];
 			spr_regs[7] <= (reg_sel == 3'b111 && sprw) ? data_in : spr_regs[7];
  		end
	end

    assign spr_out = spr_regs[reg_sel];
    assign mode = spr_regs[3'b111];

endmodule
