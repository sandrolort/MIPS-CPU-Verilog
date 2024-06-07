
module memory_full (
	input clk, rst, S,
	input [31:0] next_pc,
	input [29:0] addr_in,
	input [31:0] data_in,
	output wire [31:0] I,
	output reg [31:0] PC,
	output [31:0] data_out,
	output reg E
);

reg [31:0] Memory [255:0];
wire[29:0] ad;
assign ad = E ? addr_in : PC[31:2];
wire wren;
assign wren = S && E;
//Potentially, an SRAM can be implemented like this, using the SRAM IP from Intel.
// RAM rm(
//  ad[20:29],
//  clk2,
//  data_in,
//  wren,
//  data_out
// );
//Reading from files is also an option.
always @(posedge clk && wren, posedge rst) begin
		if(rst) begin : rstStmt
		integer i;

		for (i = 0; i < 64 ; i=i+1) begin
			Memory[i] = 32'b0;
		end

		// Main test - Sum up numbers from 1 to 6 by looping.
		Memory[0] <= 32'b00100100000001000000000000000110;
		Memory[1] <= 32'b00100100000000010000000000000000;
		Memory[2] <= 32'b00100100000000100000000000000000;
		Memory[3] <= 32'b00100100001000010000000000000001;
		Memory[4] <= 32'b00000000010000010001000000100001;
		Memory[5] <= 32'b00010100001001001111111111111110;
		Memory[6] <= 32'b00000000010000000010100000100001;
		
		// Write 5 to reg 1, 7 to reg 2. Sum up those two to output register (5)
		// Memory[0] = 32'b00100000001000010000000000000101;
		// Memory[1] = 32'b00100000010000100000000000000111;
		// Memory[2] = 32'b00000000010000010010100000100000;
		// Memory[3] = 32'b00000000000000000000000000000000;

	end
	else Memory [ad[8:0]] = data_in;
end
assign data_out = Memory[ad[8:0]];

//Testing
always @(posedge wren) #1 $display("Writing in memory..... %0d, %0d", ad, data_in);
always @(negedge wren) #1 $display("Reading from memory... %0d, %0d", ad, data_out);

//E register driver
always @(posedge clk, posedge rst) E = rst ? 1'b0 : ~E;

//PC driver (makes sure PC doesn't increase on every cycle)
always @(posedge rst, posedge E) PC = rst ? 32'b0 : next_pc;

//I driver
//The following Line of code is compiled wrong. Quartus doesn't recognize E as a clock driver in hardware synthesis, while it works in ModelSim simulation.
//always @(posedge ~E, posedge rst) I = rst ? 1'b0 : Memory[ad[23:29]];
//Due to that reason, I had to recreate a "posedge ~E" statement manually, using up an additional register unfortunately. This, however, fixed the processor.

reg prev = 0;
reg [31:0] previ = 0;

always @(posedge clk) prev <= E;
always @(I) previ <= I;

assign I = rst ? 1'b0 : prev != E && E == 0? Memory[ad[8:0]] : previ;

endmodule