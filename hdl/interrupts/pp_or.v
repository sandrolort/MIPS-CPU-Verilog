module pp_or #(parameter N = 32)(
    input  wire [N-1:0] x,
    output wire [N-1:0] y
);
    generate
        if (N == 2) begin: base_case
            assign y[0] = x[0];
            assign y[1] = x[1] | x[0];
        end else begin: recursive_case
            wire [N/2-1:0] x_prime;
            genvar i;
            for (i = 0; i < N/2; i = i + 1) begin: combine_pairs
                assign x_prime[i] = x[2*i] | x[2*i + 1];
            end

            wire [N/2-1:0] y_prime;
            pp_or #(.N(N/2)) pp_recursive (.x(x_prime), .y(y_prime));

            assign y[0] = x[0];
            for (i = 1; i < N/2; i = i + 1) begin: even_indices
                assign y[2*i] = x[2*i] | y_prime[i-1];
            end
            for (i = 0; i < N/2; i = i + 1) begin: odd_indices
                assign y[2*i + 1] = y_prime[i];
            end
        end
    endgenerate
endmodule
