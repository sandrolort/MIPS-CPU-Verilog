module GPR (
	input clk,
	wren, rst,
	input [4:0] addrA, addrB, addrC,
	output [31:0] data_out_A, data_out_B,
	input [31:0] data_in_C,
	output [31:0] registerOut
);
//Register 0 is a wire, therefore rest of the registers are shifted on the left by 1 index.
reg [31:0] registers [30:0];

assign data_out_A = addrA == 0 ? 0 : registers[addrA-1];
assign data_out_B = addrB == 0 ? 0 : registers[addrB-1];

assign registerOut = registers[4];//a0, used for LED output (unsigned int).

generate
	genvar i;
	for (i = 0; i < 31; i = i + 1) begin : generator
	//This is done to avoid Inferred Latches.
	//This way, a posedge is generated individually for each register, only changing when their address is valid.
	always @( posedge (addrC-1 == i) && clk && wren, posedge rst)
		if (rst) registers[i] <= 32'b0;
		else registers[i] <= data_in_C;
	end
endgenerate

endmodule