module interrupt_controller (
    input wire [22:0] ca,  // Cause Signals
    input wire [31:0] sr,   // Status register
	output wire [22:0] mca,
    output wire jisr,
    output wire [31:0] il    // Interrupt level
);
    // Code segment below generates masked cause signals
    genvar i;
    generate
        for (i = 0; i < 23; i = i + 1) begin : gen_mca
            if (i >= 1 && i <= 15 || i == 21 || i == 22) // Unmaskable interrupts are reset, illegal instructions, misalignment and page faults
                assign mca[i] = ca[i] & sr[i];
            else // Whose indices are 0, 16, 17, 18, 19, 20
                assign mca[i] = ca[i];
        end
    endgenerate

    // Evaluating jisr predicate by ORing every bit
    assign jisr = |mca; 

    // Use the find first one circuit to determine interrupt level
    ff1 #(32) ff1_inst (.x({9'b0, mca}), .y(il));

endmodule
