module spr (
	input wire clk,
	input wire jisr,
	input wire [22:0] mca,
	input wire rpt,  // 1 bit 'repeat' signal
	input wire [31:0] pc,
	input wire [31:0] next_pc,
	input wire [31:0] ea,
	input wire [31:0] data_in,
	input wire [2:0] reg_sel,
    input wire sprw,
	output wire [31:0] spr_out,
	output wire [31:0] mode
);
	reg [31:0] spr [7:0];

	initial begin : init_spr
	   integer i;
	   for (i = 0; i < 8; i = i + 1)
			spr[i] = 32'b0;
	end

	always @(posedge clk) begin
  		if (jisr) begin
 			spr[0] <= (reg_sel == 3'b000 && sprw) ? data_in : ((rpt) ? {9'b0, mca} : ea);
 			spr[1] <= (reg_sel == 3'b001 && sprw) ? data_in : {31'd0, rpt};
 			spr[2] <= (reg_sel == 3'b010 && sprw) ? data_in : next_pc;
 			spr[3] <= (reg_sel == 3'b011 && sprw) ? data_in : spr[3];
 			spr[4] <= (reg_sel == 3'b100 && sprw) ? data_in : spr[4];
 			spr[5] <= (reg_sel == 3'b101 && sprw) ? data_in : spr[5];
 			spr[6] <= (reg_sel == 3'b110 && sprw) ? data_in : spr[6];
 			spr[7] <= (reg_sel == 3'b111 && sprw) ? data_in : spr[7];
  		end else begin
 			spr[0] <= (reg_sel == 3'b000 && sprw) ? data_in : {9'b0, mca};
 			spr[1] <= (reg_sel == 3'b001 && sprw) ? data_in : {31'd0, rpt};
 			spr[2] <= (reg_sel == 3'b010 && sprw) ? data_in : pc;
 			spr[3] <= (reg_sel == 3'b011 && sprw) ? data_in : next_pc;
 			spr[4] <= (reg_sel == 3'b100 && sprw) ? data_in : ea;
 			spr[5] <= (reg_sel == 3'b101 && sprw) ? data_in : spr[5];
 			spr[6] <= (reg_sel == 3'b110 && sprw) ? data_in : spr[6];
 			spr[7] <= (reg_sel == 3'b111 && sprw) ? data_in : spr[7];
  		end
	end

    assign spr_out = spr[reg_sel];
    assign mode = spr[3'b111];

endmodule
