module au #(parameter n = 32) (
    input [n-1:0] a,
    input [n-1:0] b,
    input sub,
    input u,
    output [n-1:0] s,
    output neg,
    output ovf
);
    wire [n-1:0] b_adjusted;
    wire cout, sign_a, sign_b, sign_s;

    assign b_adjusted = b ^ {n{sub}};
    assign sign_a = a[n-1];
    assign sign_b = b_adjusted[n-1];

    adder #(n) add (
        .a(a),
        .b(b_adjusted),
        .cin(sub),
        .s(s),
        .cout(cout)
    );

    assign sign_s = s[n-1];
    assign neg = u ? ~cout : sign_s;
    assign ovf = u ? (cout ^ (sign_a ^ sign_b ^ sign_s)) : ((sign_a ^ sign_b) & (sign_a ^ sign_s));
endmodule