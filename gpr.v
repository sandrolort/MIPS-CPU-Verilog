module gpr (
    input clk,
    input wren,
    input rst,
    input [4:0] addr_a, addr_b, addr_c,
    output [31:0] data_out_a, data_out_b,
    input [31:0] data_in_c,
    output [31:0] register_out
);

// Register 0 is hardwired to 0, so we only need 31 registers
reg [31:0] registers [31:1];
integer i;

assign data_out_a = (addr_a == 5'b0) ? 32'b0 : registers[addr_a];
assign data_out_b = (addr_b == 5'b0) ? 32'b0 : registers[addr_b];
assign register_out = registers[5]; // a0, used for LED output (unsigned int)

initial for (i = 1; i < 32; i= i + 1)
    registers[i] = 0;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        // Reset all registers to 0
        for (i = 1; i < 32; i = i + 1)
            registers[i] <= 32'b0;
    end
    else if (wren && addr_c != 5'b0) begin
        registers[addr_c] <= data_in_c;
    end
end

endmodule