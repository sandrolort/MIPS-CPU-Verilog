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
    output reg E = 0
);

reg [31:0] memory [0:4096];

initial begin
    // Initialize all memory locations to 0
	memory[0] = {6'b001000, 5'b00000, 5'b00001, {14'b0, 2'b11}};  // 'malf' first instruction
	memory[1] = {6'b000000, 5'b00001, 15'b0, 6'b001000};  // 'malf' second instruction
    for (integer i = 2; i < 4096; i = i + 1)
        memory[i] = 32'h00000000;
    // Initialize specific memory locations according to MIF file
	// memory[0] = 32'b0; // 'ill' part 1
	// memory[0] = {6'b010000, 5'b10000, 15'b0, 6'b01100};  // 'ill' part 2
	// memory[0] = {6'b101011, 5'b00000, 5'b00001, {15'b0, 1'b1}}; // 'misals'
	/*
    memory[0] = 32'h24040019;  // addiu $4, $0, 25
    memory[1] = 32'h24050004;  // addiu $5, $0, 4
    memory[2] = 32'h0c000005;  // jal 5
    memory[3] = 32'h2402000a;  // addiu $2, $0, 10
    memory[4] = 32'h00000000;  // syscall
    memory[5] = 32'h23bdfffc;  // addiu $sp, $sp, -4
    memory[6] = 32'hafbf0000;  // sw $ra, 0($sp)
    memory[7] = 32'h00044021;  // addu $8, $0, $4
    memory[8] = 32'h00054821;  // addu $9, $0, $5
    memory[9] = 32'h240a0000;  // addiu $10, $0, 0
    memory[10] = 32'h0109082a; // slt $1, $8, $9
    memory[11] = 32'h14200003; // bne $1, $0, 3
    memory[12] = 32'h01094022; // sub $8, $8, $9
    memory[13] = 32'h214a0001; // addiu $10, $10, 1
    memory[14] = 32'h0800000a; // j 10
    memory[15] = 32'h000a1021; // addu $2, $0, $10
    memory[16] = 32'h00081821; // addu $3, $0, $8
	*/
end


// Execute bit updated
always @(posedge clk or posedge jisr) begin
    if (jisr)  // 'rst' replaced with 'jisr'
        E <= 0;
    else
        E <= ~E;
end

reg [31:0] out_reg = 0;

always @(posedge mem_clk) begin
    if (E && mem_wren && gp_we)
        memory[addr_in] = data_in;
    if(~E || E && mem_rren)
        out_reg = memory[addr_in];
end

assign out = out_reg;

endmodule
