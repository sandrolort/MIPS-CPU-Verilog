module GPR (
    input clk,
    input wren,
    input rst,
    input [4:0] addrA, addrB, addrC,
    output [31:0] data_out_A, data_out_B,
    input [31:0] data_in_C,
    output [31:0] registerOut
);
    // Register 0 is hardwired to 0, so we only need 31 registers
    reg [31:0] registers [31:1];
    integer i; // Declare loop variable at module level

    // Combinational read logic
    assign data_out_A = (addrA == 5'b0) ? 32'b0 : registers[addrA];
    assign data_out_B = (addrB == 5'b0) ? 32'b0 : registers[addrB];
    assign registerOut = registers[5]; // a0, used for LED output (unsigned int)

    // Sequential write logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset all registers to 0
            for (i = 1; i < 32; i = i + 1) begin
                registers[i] <= 32'b0;
            end
        end else if (wren && addrC != 5'b0) begin
            // Write to the specified register if it's not r0
            registers[addrC] <= data_in_C;
        end
    end
endmodule