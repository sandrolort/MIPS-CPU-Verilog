module spr (
    input wire clk,
    input wire jisr,        // 1 bit
//	input wire [31:0] esr,  // Only for testbench
//	input wire [31:0] sr,   // Only for testbench
    input wire [22:0] mca,
    input wire rpt,      // 1 bit 'repeat' signal
    input wire [31:0] pc,
    input wire [31:0] next_pc,
    input wire [31:0] ea,
    output reg [31:0] sr_out = 32'b0,
    output reg [31:0] esr_out = 32'b0,
    output reg [31:0] eca_out = 32'b0,
    output reg [31:0] epc_out = 32'b0,
    output reg [31:0] edata_out = 32'b0,
    output reg [31:0] pto = 32'b0,
    output reg [31:0] ptl = 32'b0,
    output reg mode_out = 1 
);
    // Temporary variables
    wire [31:0] jisr_esr;
    wire [31:0] actual_pc;

    // Compute temporary variables based on inputs
    assign jisr_esr = jisr ? 32'b0 : esr_out; // 'esr_out' should be changed to 'esr' for testbench
  
	assign actual_pc = rpt ? pc : next_pc;

	initial begin
		sr_out = 32'b0;
		esr_out = 32'b0;
		eca_out = 32'b0;
		epc_out = 32'b0;
		edata_out = 32'b0;
		pto = 32'b0;
		ptl = 32'b0;
	end

    always @(jisr) begin
		sr_out = jisr_esr;
        if (jisr) begin
            esr_out = sr_out;  // 'sr_out' should be changed to 'sr' for testbench
			eca_out = {9'b0, mca};
            epc_out = actual_pc;
            edata_out = ea;
            mode_out = 1'b0;
            pto = 32'b0; // Handling paging comes later
            ptl = 32'b0; // Handling paging comes later
        end else begin
            // No interrupt - Use old transition function \delta_M (d, reset) and maintain current mode
			esr_out = 32'b0;
            eca_out = 32'b0;
            epc_out = 32'b0;
            edata_out = 32'b0;
			mode_out = 1'b1;
            pto = 32'b0; // Handling paging comes later
            ptl = 32'b0; // Handling paging comes later
        end
    end
endmodule
