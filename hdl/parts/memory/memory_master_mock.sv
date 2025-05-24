module memory_master_mock(
    input wire clk,
    input wire mem_clk,
    input wire rst,
    input wire [29:0] addr_in,
    input wire [31:0] data_in,
    input wire mem_wren,
    input wire mem_rren,
    input wire gp_we,
	input wire jisr,  // Added
    output wire [31:0] out,
    input wire E
);

reg [31:0] memory [0:4096];

initial begin
    // Initialize all memory locations to 0
    for (integer i = 0; i < 4096; i = i + 1)
        memory[i] = 32'b00000000000000000000000000000000;

    // Memory initialization from MIF file
    memory[0] = 32'h24080001;  // 00000000 : 24080001
    memory[1] = 32'h240d0000;  // 00000001 : 240d0000
    memory[2] = 32'h24090064;  // 00000002 : 24090064
    memory[3] = 32'h01a86820;  // 00000003 : 01a86820
    memory[4] = 32'h21080001;  // 00000004 : 21080001
    memory[5] = 32'h0128082a;  // 00000005 : 0128082a
    memory[6] = 32'h1020fffc;  // 00000006 : 1020fffc
    memory[7] = 32'h24020001;  // 00000007 : 24020001
    memory[8] = 32'h000d2821;  // 00000008 : 000d2821
end

reg [31:0] out_reg = 0;

always @(posedge mem_clk) begin
    if (E && mem_wren)
        memory[addr_in] = data_in;
    if(~E || E && mem_rren)
        out_reg = memory[addr_in];
end

assign out = out_reg;

endmodule