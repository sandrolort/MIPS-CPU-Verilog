module memory_master_mock(
    input wire clk,
    input wire mem_clk,
    input wire rst,
    input wire [29:0] addr_in,
    input wire [31:0] data_in,
    input wire mem_wren,
    input wire gp_we,
    output wire [31:0] out,
    output reg E = 0
);

reg [31:0] memory [0:32];

initial begin
    // Initialize all memory locations to 0
    for (integer i = 0; i < 32; i = i + 1)
        memory[i] = 32'h00000000;
    
    // Initialize specific memory locations according to MIF file
    memory[0] = 32'h2401000a;  // addiu $1, $0, 10
    memory[1] = 32'h2402000e;  // addiu $2, $0, 14
    memory[2] = 32'h24180001;  // addiu $24, $0, 1
    memory[3] = 32'h243a0000;  // addiu $26, $0, 0
    memory[4] = 32'h241b0000;  // addiu $27, $0, 0
    memory[5] = 32'h241c0006;  // addiu $28, $0, 6
    memory[6] = 32'h0058c824;  // and $25, $2, $24
    memory[7] = 32'h13200001;  // beq $25, $0, 1
    memory[8] = 32'h037ad821;  // addu $27, $27, $26
    memory[9] = 32'h0318c021;  // addu $24, $24, $24
    memory[10] = 32'h035ad021;  // addu $26, $26, $26
    memory[11] = 32'h279cffff;  // addiu $28, $28, -1
    memory[12] = 32'h1f80fff9;  // bgtz $28, -7
    memory[13] = 32'h27650000;  // addiu $5, $27, 0
end

always @(posedge clk or posedge rst) begin
    if(rst)
        E <= 0;
    else
        E <= ~E;
end

reg [31:0] out_reg = 0;

always @(posedge mem_clk) begin
    if (E && mem_wren && gp_we)
        memory[addr_in] = data_in;
    out_reg = memory[addr_in];
end

assign out = out_reg;

endmodule