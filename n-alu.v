module alu #(parameter n = 32) (
    input [n-1:0] a,
    input [n-1:0] b,
    input [3:0] af,
    input i,
    output reg [n-1:0] alures,
    output reg ovfalu
);
    wire [n-1:0] au_result;
    wire au_neg, au_ovf;

    au #(n) arithmetic_unit (
        .a(a),
        .b(b),
        .sub(af[1]),
        .u(af[0]),
        .s(au_result),
        .neg(au_neg),
        .ovf(au_ovf)
    );

    always @(*) begin
        case(af)
            4'b0000, 4'b0001, 4'b0010, 4'b0011: alures = au_result;
            4'b0100: alures = a & b;
            4'b0101: alures = a | b;
            4'b0110: alures = a ^ b;
            4'b0111: alures = i ? {b[15:0], 16'b0} : ~(a | b);
            4'b1010, 4'b1011: alures = {31'b0, au_neg};
            default: alures = {n{1'b0}};
        endcase

        ovfalu = au_ovf & ~af[3] & ~af[2];
    end
endmodule