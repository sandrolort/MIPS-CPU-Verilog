module alu #(parameter n = 32) (
    input [n-1:0] a,
    input [n-1:0] b,
    input [3:0] af,
    input i,
    output [n-1:0] alures,
    output ovfalu
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

wire [n-1:0] and_result = a & b;
wire [n-1:0] or_result = a | b;
wire [n-1:0] xor_result = a ^ b;
wire [n-1:0] special_result = i ? {b[15:0], 16'b0} : ~(a | b);
wire [n-1:0] neg_result = {31'b0, au_neg};

wire [n-1:0] mux_result;
assign mux_result = 
    (af == 4'b0000 || af == 4'b0001 || af == 4'b0010 || af == 4'b0011) ? au_result :
    (af == 4'b0100) ? and_result :
    (af == 4'b0101) ? or_result :
    (af == 4'b0110) ? xor_result :
    (af == 4'b0111) ? special_result :
    (af == 4'b1010 || af == 4'b1011) ? neg_result :
    {n{1'b0}};

assign alures = mux_result;
assign ovfalu = au_ovf & ~af[3] & ~af[2];

endmodule