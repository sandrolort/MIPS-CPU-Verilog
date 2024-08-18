module spr (
    input wire clk,
    input wire jisr,        // 1 bit
    input wire [31:0] mca,
    input wire rpt,      // 1 bit 'repeat' signal
    input wire [31:0] pc,
    input wire [31:0] next_pc,
    input wire [31:0] ea,
    output reg [31:0] sr,
    output reg [31:0] esr,
    output reg [31:0] eca_out,
    output reg [31:0] epc_out,
    output reg [31:0] edata_out,
    output reg [31:0] pto,
    output reg [31:0] ptl,
    output reg mode // note in the design, but we need to keep same mode unless interrupt is raised
);

    // Temporary variables
    wire [31:0] jisr_esr;
    wire [31:0] actual_pc;

    // Compute temporary variables based on inputs
    assign jisr_esr = jisr ? 32'b0 : esr;
    assign actual_pc = rpt ? pc : next_pc;

    always @(jisr) begin
        if (jisr) begin
            esr = sr;
			sr = 32'b0;
            eca_out = mca;
            mode = 32'b0;
            epc_out = actual_pc;
            edata_out = ea;
            pto = 32'b0; // Handling paging comes later
            ptl = 32'b0; // Handling paging comes later
        end else begin
            // No interrupt -> Use old transition function \delta_M (d, reset)
            esr = 32'b0;
            eca_out = 32'b0;
            epc_out = 32'b0;
            edata_out = 32'b0;
            // Maintain current mode
            pto = 32'b0; // Handling paging comes later
            ptl = 32'b0; // Handling paging comes later
        end
    end

endmodule

