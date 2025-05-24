module gpr (
    input clk, rst, 
    input wire we,
    input wire [4:0] rs, rt, wa,
    output wire [31:0] rd1, rd2,
    input wire [31:0] wd,
    output wire [31:0] register_out
);

reg [31:0] registers [31:1] /* synthesis keep */;
integer i;

assign rd1 = (rs == 5'b0) ? 32'b0 : registers[rs];
assign rd2 = (rt == 5'b0) ? 32'b0 : registers[rt];
assign register_out = registers[5];

initial begin
    for (i = 1; i < 32; i = i + 1)
        registers[i] = 0;
    registers[29] = 11'b01111111111;
end

// Outside the always block, use generate for initialization
genvar j;
generate
    for (j = 1; j < 29; j = j + 1) begin : init_regs
        always @(posedge clk or posedge rst) begin
            if (rst)
                registers[j] <= 32'b0;
            else if (we && wa == j)
                registers[j] <= wd;
        end
    end
endgenerate

// Handle special registers separately
always @(posedge clk or posedge rst) begin
    if (rst) begin
        registers[29] <= 11'b01111111111;
        registers[30] <= 32'b0;
        registers[31] <= 32'b0;
    end else if (we && wa != 5'b0) begin
        if (wa == 29) registers[29] <= wd;
        if (wa == 30) registers[30] <= wd;
        if (wa == 31) registers[31] <= wd;
    end
end

endmodule