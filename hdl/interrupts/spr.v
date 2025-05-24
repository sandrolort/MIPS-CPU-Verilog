module spr (
	input wire clk,
	input wire jisr,
	input wire eret,
	input wire [22:0] mca,
	input wire rpt,  // 1 bit 'repeat' signal
	input wire [31:0] pc,
	input wire [31:0] next_pc,
	input wire [31:0] ea,
	input wire [31:0] data_in,
	input wire [2:0] reg_sel,
    input wire sprw,
	output wire [31:0] spr_out,
	output wire [31:0] sr,
	output wire [31:0] epc,
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
 			spr[1] = spr[0];  // moved up as we first store value of d.sr in d'.esr 
 			spr[0] = 32'b0;
 			spr[2] <= {9'b0, mca};
 			spr[3] <= ((rpt) ? pc : next_pc);
 			spr[4] <= ea;
 			spr[5] <= spr[5];  // hardcoded until paging is implemented
 			spr[6] <= spr[6];  // hardcoded until paging is implemented
 			spr[7] <= 32'b0;  // system mode
		end
		else if (eret) begin
			spr[0] <= spr[1];  // d'.sr = d.esr
			spr[7] <= {31'b0, 1'b1};  // d'.mode = 0^{31} 1
			spr[1] <= spr[1];
			spr[2] <= spr[2];
			spr[3] <= spr[3];
			spr[4] <= spr[4];
			spr[5] <= spr[5];
			spr[6] <= spr[6];
  		end 
		else begin
 			spr[0] <= (reg_sel == 3'b000 && sprw) ? data_in : spr[0];
 			spr[1] <= (reg_sel == 3'b001 && sprw) ? data_in : spr[1];
 			spr[2] <= (reg_sel == 3'b010 && sprw) ? data_in : spr[2];
 			spr[3] <= (reg_sel == 3'b011 && sprw) ? data_in : spr[3];
 			spr[4] <= (reg_sel == 3'b100 && sprw) ? data_in : spr[4];
 			spr[5] <= (reg_sel == 3'b101 && sprw) ? data_in : spr[5];
 			spr[6] <= (reg_sel == 3'b110 && sprw) ? data_in : spr[6];
 			spr[7] <= (reg_sel == 3'b111 && sprw) ? data_in : spr[7];
  		end
	end

    assign spr_out = spr[reg_sel];
	assign sr = spr[3'b000];
	assign epc = spr[3'b011];
	assign mode = spr[3'b111];

endmodule
