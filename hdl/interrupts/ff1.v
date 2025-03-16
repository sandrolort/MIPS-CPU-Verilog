module ff1 #(parameter N = 32)(
    input  wire [N-1:0] x,
    output wire [4:0] y
);
    wire [N-1:0] temp_y;
    wire [N-1:0] one_hot;

    pp_or #(N) parallel_prefix_or (.x(x), .y(temp_y));

    genvar j;
    generate
        for (j = 0; j < N; j = j + 1) begin: one_hot_gen
            assign one_hot[j] = (j == 0) ? temp_y[j] : (temp_y[j] & ~temp_y[j-1]);
        end
    endgenerate

    // Function to compute the index from the one_hot vector
    function [4:0] one_hot_to_index;
        input [N-1:0] vec;
        integer k;
        begin
            one_hot_to_index = 5'd0;
            for (k = 0; k < N; k = k + 1) begin
                if (vec[k])
                    one_hot_to_index = k[4:0];
            end
        end
    endfunction

    assign y = one_hot_to_index(one_hot);

endmodule
