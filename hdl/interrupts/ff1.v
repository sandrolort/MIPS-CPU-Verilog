module ff1 #(parameter N = 32)(
    input  wire [N-1:0] x,
    output wire [N-1:0] y
);
    wire [N-1:0] temp_y;

    pp_or #(.N(N)) parallel_prefix_or (.x(x), .y(temp_y));

    genvar i;
    generate
        for (i = 0; i < N; i = i + 1) begin: out_invert
            if (i == 0) begin
                assign y[i] = temp_y[i];
            end else begin
                assign y[i] = temp_y[i] & ~temp_y[i-1];
            end
        end
    endgenerate
endmodule
