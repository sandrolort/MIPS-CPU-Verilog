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
  memory[0] = 32'h20060005; // addi $6, $0, 5
  memory[1] = 32'h20070007; // addi $7, $0, 7
  memory[2] = 32'h20180001; // addi $24, $0, 1
  memory[3] = 32'h20fa0000; // addi $26, $7, 0
  memory[4] = 32'h201b0000; // addi $27, $0, 0
  memory[5] = 32'h00d8c824; // and $25, $6, $24
  memory[6] = 32'h13200001; // beq $25, $0, 1
  memory[7] = 32'h037ad820; // add $27, $27, $26
  memory[8] = 32'h0018c040; // sll $24, $24, 1
  memory[9] = 32'h001ad040; // sll $26, $26, 1
  memory[10] = 32'h1700fffa; // bne $24, $0, -6
  memory[11] = 32'h23650000; // addi $5, $27, 0
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