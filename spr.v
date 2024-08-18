module spr (
    input wire clk,
    input wire jisr,        // 1 bit
    input wire [31:0] esr,
    input wire [31:0] sr,
    input wire [31:0] mca,
    input wire rpt,      // 1 bit 'repeat' signal
    input wire [31:0] pc,
    input wire [31:0] next_pc,
    input wire [31:0] ea,
    input wire mode, // note in the design, but we need to keep same mode unless interrupt is raised
    output reg [31:0] sr_out,
    output reg [31:0] esr_out,
    output reg [31:0] eca_out,
    output reg [31:0] epc_out,
    output reg [31:0] edata_out,
    output reg [31:0] pto,
    output reg [31:0] ptl,
    output reg mode_out
);

    // Temporary variables
    wire [31:0] jisr_esr;
    wire [31:0] actual_pc;

    // Compute temporary variables based on inputs
    assign jisr_esr = jisr ? 32'b0 : esr;
    assign actual_pc = rpt ? pc : next_pc;

    always @(jisr) begin
        if (jisr) begin
            sr_out = 32'b0;
            esr_out = sr;
            eca_out = mca;
            mode_out = 32'b0;
            epc_out = actual_pc;
            edata_out = ea;
            pto = 32'b0; // Handling paging comes later
            ptl = 32'b0; // Handling paging comes later
        end else begin
            sr_out = sr;             // No interrupt -> Use old transition function \delta_M (d, reset)
            esr_out = 32'b0;
            eca_out = 32'b0;
            epc_out = 32'b0;
            edata_out = 32'b0;
            mode_out = mode;        // Maintain current mode
            pto = 32'b0; // Handling paging comes later
            ptl = 32'b0; // Handling paging comes later
        end
    end

endmodule

