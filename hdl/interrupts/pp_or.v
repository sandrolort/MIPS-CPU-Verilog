module pp_or #(parameter N = 32)(
    input  wire [N-1:0] x,
    output wire [N-1:0] y
);
    generate
        if (N == 2) begin: base_case
            assign y[0] = x[0];
            assign y[1] = x[1] | x[0];
        end else begin: recursive_case
            wire [N/2-1:0] even;
            wire [N/2-1:0] odd;

            genvar i;
            for (i = 0; i < N/2; i = i + 1) begin: split_odd_even
                assign even[i] = x[2 * i];
                assign odd[i]  = x[2 * i + 1];
            end

            wire [N/2-1:0] even_y;
            wire [N/2-1:0] odd_y;

            pp_or #(.N(N/2)) even_block (.x(even), .y(even_y));
            pp_or #(.N(N/2)) odd_block (.x(odd),  .y(odd_y));

            wire [N/2-1:0] y_even;
            wire [N/2-1:0] y_odd;

            for (i = 0; i < N/2; i = i + 1) begin: combine
                if (i == 0) begin
                    assign y_even[i] = even_y[i];
                end else begin
                    assign y_even[i] = even_y[i] | odd_y[i-1];
                end
                assign y_odd[i] = even_y[i] | odd_y[i];
            end

            for (i = 0; i < N/2; i = i + 1) begin: assign_output
                assign y[2 * i] = y_even[i];
                assign y[2 * i + 1] = y_odd[i];
            end
        end
    endgenerate
endmodule
