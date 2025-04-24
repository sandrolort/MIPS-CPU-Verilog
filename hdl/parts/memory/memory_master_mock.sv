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
	for (integer i = 0; i < 4096; i = i + 1)
		memory[i] = 32'h00000000;
  
	memory[0] = 32'b00100100000010110000000000000111;
	memory[1] = 32'b01000000100010110010000000000000;
	memory[2] = 32'b01000000000010110010000000000000;

  // Start: Set up special register access
  // memory[0] = 32'h24040001;     // addiu $4, $0, 1        # Load value 1 into $4
  // memory[1] = 32'h40840000;     // mtc0 $4, $0           # Move $4 to CP0 register 0 (index)
  
  // Check for interrupts and jump to main code if none
  // memory[2] = 32'h10000001;     // beq $0, $0, 1         # Jump to main code (PC+12)
  
  // Interrupt handler (skipped if no interrupt)
  // memory[3] = 32'h08000014;     // j 0x14 (20)            # Jump to interrupt handler
  
  // Main code starts here (PC = 24 = 0x6)
  // memory[4] = 32'h24020001;     // addiu $2, $0, 1        # Set up $2 = 1
  
  // Trigger ill part 2 exception with an illegal coprocessor instruction
  // Using opcode 010000 (CP0) with an invalid function code
  // memory[5] = 32'h40000100;     // mtc0 $0, $2, 4        # Invalid CP0 instruction (ill part 2)
  
  // Code after the exception (should not execute if exception is caught)
  // memory[6] = 32'h24020004;     // addiu $2, $0, 4        # Set $2 = 4
  // memory[7] = 32'h00000000;     // syscall                # Exit program
  
  // Interrupt handler (at address 20 = 0x14)
  // memory[20] = 32'h24020002;    // addiu $2, $0, 2        # Set $2 = 2 (indicate handler was called)
  // memory[21] = 32'h00000000;    // syscall                # Exit program
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
