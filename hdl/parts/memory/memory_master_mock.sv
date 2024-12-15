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

reg [31:0] memory [0:30];

initial begin
    for (integer i = 0; i < 30; i = i + 1)
        memory[i] = 32'h00000000;
    
    memory[0] = 32'h24020005;  // addiu $2, $0, 5
    memory[1] = 32'h24030007;  // addiu $3, $0, 7
    memory[2] = 32'h24040002;  // addiu $4, $0, 2
    memory[3] = 32'h24050003;  // addiu $5, $0, 3
    memory[4] = 32'h00430820;  // add $1, $2, $3
    memory[5] = 32'h00A42822;  // sub $5, $5, $4
    memory[6] = 32'h00623824;  // and $7, $3, $2
    memory[7] = 32'h8C0A0010;  // lw $10, 16($0)
    memory[8] = 32'h00624025;  // or $8, $3, $2
    memory[9] = 32'h00624826;  // xor $9, $3, $2
    memory[10] = 32'h00423827; // nor $7, $2, $2
    memory[11] = 32'h24020004; // addiu $2, $0, 5
    memory[12] = 32'h24030005; // addiu $3, $0, 7
    memory[13] = 32'h24040006; // addiu $4, $0, 2
end

always @(posedge clk or posedeg rst) begin
    if(!rst) 
        E <= ~E;
    else
        E <= 0;
end

reg [31:0] out_reg = 0;
always @(negedge clk) begin
    if (E && mem_wren && gp_we)
        memory[addr_in] = data_in;
    out_reg = memory[addr_in];
end

assign out = out_reg;

endmodule