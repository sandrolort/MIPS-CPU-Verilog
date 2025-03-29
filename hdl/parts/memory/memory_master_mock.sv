module memory_master_mock(
    input wire clk,
    input wire mem_clk,
    input wire rst,
    input wire [29:0] addr_in,
    input wire [31:0] data_in,
    input wire mem_wren,
    input wire mem_rren,
    output wire [31:0] out,
    input wire E
);

reg [31:0] memory [0:4096];

initial begin
    // Initialize all memory locations to 0
    for (integer i = 0; i < 4096; i = i + 1)
        memory[i] = 32'h00000000;
    // Simple program that stores a value to memory and loads it back
    memory[0] = 32'h24020064;     // addiu $2, $0, 100     # Load immediate value 100 into $2
    memory[1] = 32'h24030100;     // addiu $3, $0, 256     # Load address 256 into $3
    memory[2] = 32'hac620000;     // sw $2, 0($3)          # Store $2 at memory[$3]
    memory[3] = 32'h8c640000;     // lw $5, 0($3)          # Load from memory[$3] into $5
    memory[4] = 32'h00000000;     // nop                   # No operation
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