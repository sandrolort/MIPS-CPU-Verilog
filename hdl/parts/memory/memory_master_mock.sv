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

    // For signal tap
    memory[33] = 32'h20082000; // addi $t0, $zero, 0x2000 (base address)
    memory[34] = 32'h8d110000; // lw $s1, 0($t0)  - load 1st element
    memory[35] = 32'h8d120004; // lw $s2, 4($t0)  - load 2nd element
    memory[36] = 32'h8d130008; // lw $s3, 8($t0)  - load 3rd element
    memory[37] = 32'h8d14000c; // lw $s4, 12($t0) - load 4th element
    memory[38] = 32'h8d150010; // lw $s5, 16($t0) - load 5th element
    memory[39] = 32'h8d160014; // lw $s6, 18($t0) - load 6th element
    memory[40] = 32'h8d170018; // lw $s7, 24($t0) - load 7th element
    memory[41] = 32'h8d08001c; // lw $t0, 28($t0) - load 8th element (overwriting $t0)
    memory[42] = 32'h20092020; // addi $t1, $zero, 0x2020 (new base address for next batch)
    memory[43] = 32'h8d2a0000; // lw $t2, 0($t1)  - load 9th element
    memory[44] = 32'h8d2b0004; // lw $t3, 4($t1)  - load 10th element
    memory[45] = 32'h8d2c0008; // lw $t4, 8($t1)  - load 11th element
    memory[46] = 32'h8d2d000c; // lw $t5, 12($t1) - load 12th element
    memory[47] = 32'h8d2e0010; // lw $t6, 16($t1) - load 13th element
    memory[48] = 32'h8d2f0014; // lw $t7, 20($t1) - load 14th element
    memory[49] = 32'h8d380018; // lw $t8, 24($t1) - load 15th element
    memory[50] = 32'h8d39001c; // lw $t9, 28($t1) - load 16th element
    memory[51] = 32'h8d010020; // lw $at, 32($t1) - load 17th element
    memory[52] = 32'h08000035; // j 0x35 (infinite loop to keep registers available)

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