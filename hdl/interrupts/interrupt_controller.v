module interrupt_controller (
    input wire [22:0] ca,  // Cause Signals
    input wire [31:0] sr,   // Status register
	output wire [22:0] mca,
    output wire jisr,
    output wire [4:0] il    // Interrupt level
);

    // Code segment below generates masked cause signals
    genvar i;
    generate
        for (i = 0; i < 23; i = i + 1) begin : gen_mca
            if (i >= 1 && i <= 15 || i == 21 || i == 22) // Unmaskable interrupts are reset, illegal instructions, misalignment and page faults 
                assign mca[i] = ca[i] & sr[i];
            else // Whose indexes are 0, 16, 17, 18, 19, 20
                assign mca[i] = ca[i];
        end
    endgenerate

    // Evaluating jisr predicate
    assign jisr = |mca;  // Even if a single signal in mca is active, we need to jump to interrupt service routine

    // Determine interrupt level
    integer j;
    always @(*) begin : interrupt_level_block
        for (j = 0; j < 23; j = j + 1) begin // "We handle interrupts with small indices with higher priority than interrupts with high indices."
            if (mca[j]) begin
                disable interrupt_level_block; // This is Verilog's alternative to break statement
            end
        end
    end

    // Assign interrupt level to output
    assign il = j[4:0];

endmodule
