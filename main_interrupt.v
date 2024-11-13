module main_interrupt (
    input wire [31:0] instruction,
    input wire clk,
    input wire [22:0] ca,  // Cause Signals
    input wire [31:0] pc,
    input wire e,
    input wire eret,        // Return from exception
    input wire rpt,         // 1 bit 'repeat' signal
    input wire [31:0] next_pc,
    input wire mode,
    output wire [31:0] sr,
    output wire [31:0] esr,
    output wire [31:0] eca_out,
    output wire [31:0] epc,
    output wire [31:0] edata_out,
    output wire [31:0] pto,
    output wire [31:0] ptl,
    output wire mode_out,
    output wire jisr
);

    // Internal wires for connecting modules
    wire [4:0] il;
    wire second_part_of_ill;
    wire ls;
    wire misaf;
    wire misals;
    wire sysc;
    wire pff;
    wire pfls;

    wire [31:0] ea; // Effective address is computed by rs + imm(sign extended)
    assign ea = instruction[25:21] + {{16{instruction[15]}}, instruction[15:0]};

    // Instantiate updated interrupt_controller module
    interrupt_controller ic_inst (
        .ca(ca),
        .sr(sr),
        .jisr(jisr),
        .il(il)
    );


    // Logic for illegal instruction in user mode
    assign second_part_of_ill = mode == 1'b1 && instruction[31:26] == 6'b010000;

    // Logic of misalignment of fetch or load/store
    assign ls = instruction[31:26] == 6'b100011 || instruction[31:26] == 6'b101011;
    assign misaf = e == 1 && pc[1:0] != 2'b00;
    assign misals = ls && ea[1:0] != 2'b00;
    
    // Logic for system call
    assign sysc = instruction[31:26] == 6'b000000 && instruction[5:0] == 6'b001100;

    // Logic for page fault during fetch and page fault during load/store
    assign pff = mode == 1'b1 && ({12'b0, pc[31:12]} >= ptl || !pc[11]);  // Last part(checking if valid bit is 0) is not correct.
    assign pfls = mode == 1'b1 && ({12'b0, ea[31:12]} >= ptl || !ea[11]); // It should be updated later on.

    always @(posedge clk) begin
        if (second_part_of_ill) begin
            $display("User mode, trying to use unauthorized instructions");
            $stop;
        end

        if (misaf) begin
            $display("Misaligned fetch");
            $stop;
        end

        if (misals) begin
            $display("Misaligned load/store");
            $stop;
        end

        if (sysc) begin
            $display("System Call");
            $stop;
        end

        if (pff) begin
            $display("Page Fault during Fetch. Should be repeated.");
            $stop;
        end

        if (pfls) begin
            $display("Page Fault during Load/Store. Should be repeat.");
            $stop;
        end
    end


    // Instantiate spr module
    spr spr_inst (
        .clk(clk),
        .jisr(jisr),
        .mca({9'b0, ca}),  // mca is 32-bit long
        .rpt(rpt),
        .pc(pc),
        .next_pc(next_pc),
        .ea(ea),
        .sr(sr),
        .esr(esr),
        .eca_out(eca_out),
        .epc_out(epc),
        .edata_out(edata_out),
        .pto(pto),
        .ptl(ptl),
        .mode(mode_out)
    );

endmodule
