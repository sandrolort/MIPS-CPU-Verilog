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
        memory[i] = 32'b00000000000000000000000000000000;

    // Memory initialization from MIF file
    memory[0] = 32'h20082000;  // addi $t0, $zero, 0x2000
    memory[1] = 32'h8c092040;  // lw $t1, 0x2040($zero)
    memory[2] = 32'h240a0000;  // addiu $t2, $zero, 0
    memory[3] = 32'h212bffff;  // addi $t3, $t1, -1
    memory[4] = 32'h014b602a;  // slt $t4, $t2, $t3
    memory[5] = 32'h11800011;  // beq $t4, $zero, 0x17
    memory[6] = 32'h240b0000;  // addiu $t3, $zero, 0
    memory[7] = 32'h012a6022;  // sub $t4, $t1, $t2
    memory[8] = 32'h218cffff;  // addi $t4, $t4, -1
    memory[9] = 32'h016c682a;  // slt $t5, $t3, $t4
    memory[10] = 32'h11a0000a; // beq $t5, $zero, 0x15
    memory[11] = 32'h000b6880; // sll $t5, $t3, 2
    memory[12] = 32'h01a86820; // add $t5, $t5, $t0
    memory[13] = 32'h8dae0000; // lw $t6, 0($t5)
    memory[14] = 32'h8daf0004; // lw $t7, 4($t5)
    memory[15] = 32'h01eec02a; // slt $t8, $t7, $t6
    memory[16] = 32'h13000002; // beq $t8, $zero, 0x13
    memory[17] = 32'hadaf0000; // sw $t7, 0($t5)
    memory[18] = 32'hadae0004; // sw $t6, 4($t5)
    memory[19] = 32'h216b0001; // addi $t3, $t3, 1
    memory[20] = 32'h08000007; // j 0x7
    memory[21] = 32'h214a0001; // addi $t2, $t2, 1
    memory[22] = 32'h08000003; // j 0x3
    memory[23] = 32'h20082000; // addi $t0, $zero, 0x2000
    memory[24] = 32'h24090000; // addiu $t1, $zero, 0
    memory[25] = 32'h8c0a2040; // lw $t2, 0x2040($zero)
    memory[26] = 32'h012a582a; // slt $t3, $t1, $t2
    memory[27] = 32'h11600005; // beq $t3, $zero, 0x21
    memory[28] = 32'h00096080; // sll $t4, $t1, 2
    memory[29] = 32'h01886020; // add $t4, $t4, $t0
    memory[30] = 32'h8d8d0000; // lw $t5, 0($t4)
    memory[31] = 32'h21290001; // addi $t1, $t1, 1
    memory[32] = 32'h08000019; // j 0x19

    // Code below loads the data in the registers. That's how we see on hardware if it worked!
    memory[33] = 32'h20082000;  // addi $t0, $zero, 0x2000 (base address)
    memory[34] = 32'h00080825;  // or $1, $0, $t0 (save base address to $1)
    memory[35] = 32'h8c220000;  // lw $2, 0($1)   - load 1st element
    memory[36] = 32'h8c230004;  // lw $3, 4($1)   - load 2nd element
    memory[37] = 32'h8c240008;  // lw $4, 8($1)   - load 3rd element
    memory[38] = 32'h8c25000c;  // lw $5, 12($1)  - load 4th element
    memory[39] = 32'h8c260010;  // lw $6, 16($1)  - load 5th element
    memory[40] = 32'h8c270014;  // lw $7, 20($1)  - load 6th element
    memory[41] = 32'h8c280018;  // lw $8, 24($1)  - load 7th element
    memory[42] = 32'h8c29001c;  // lw $9, 28($1)  - load 8th element
    memory[43] = 32'h8c2a0020;  // lw $10, 32($1) - load 9th element
    memory[44] = 32'h8c2b0024;  // lw $11, 36($1) - load 10th element
    memory[45] = 32'h8c2c0028;  // lw $12, 40($1) - load 11th element
    memory[46] = 32'h8c2d002c;  // lw $13, 44($1) - load 12th element
    memory[47] = 32'h8c2e0030;  // lw $14, 48($1) - load 13th element
    memory[48] = 32'h8c2f0034;  // lw $15, 52($1) - load 14th element
    memory[49] = 32'h8c300038;  // lw $16, 56($1) - load 15th element
    memory[50] = 32'h8c31003c;  // lw $17, 60($1) - load 16th element
    memory[51] = 32'h8c320040;  // lw $18, 64($1) - load 17th element

    // Data array starting at memory address 0x2000 (8192 decimal)
    memory[2048] = 32'h00000040;
    memory[2049] = 32'h00000022;
    memory[2050] = 32'h00000019;
    memory[2051] = 32'h0000000c;
    memory[2052] = 32'h00000016;
    memory[2053] = 32'h0000000b;
    memory[2054] = 32'h0000005a;
    memory[2055] = 32'h0000002d;
    memory[2056] = 32'h00000021;
    memory[2057] = 32'h00000015;
    memory[2058] = 32'h00000041;
    memory[2059] = 32'h00000059;
    memory[2060] = 32'h0000002c;
    memory[2061] = 32'h00000001;
    memory[2062] = 32'h00000063;
    memory[2063] = 32'h0000000d;
    memory[2064] = 32'h00000010;

    // Set array size at memory address 0x2040 (8256 decimal)
    memory[2112] = 32'h00000011;  // Size of array = 17 (0x11) elements
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