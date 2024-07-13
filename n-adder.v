module adder #(parameter n = 32) (
    input [n-1:0] a,
    input [n-1:0] b,
    input cin,
    output [n-1:0] s,
    output cout
);
    assign {cout, s} = a + b + cin;
endmodule