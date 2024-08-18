module interrupt_controller (
	input wire [22:0] ca, 
	input wire [31:0] sr, 
	output wire jisr, 
	output wire [4:0] il
);

module spr (
    input wire clk,
    input wire jisr,
    input wire [31:0] esr,
    input wire [31:0] sr,
    input wire [31:0] mca,
    input wire rpt,
    input wire [31:0] pc,
    input wire [31:0] next_pc,
    input wire [31:0] ea,
    input wire mode,
    output reg [31:0] sr_out,
    output reg [31:0] esr_out,
    output reg [31:0] eca_out,
    output reg [31:0] epc_out,
    output reg [31:0] edata_out,
    output reg [31:0] pto,
    output reg [31:0] ptl,
    output reg mode_out
);

module main_interrupt (
    input wire [31:0] instruction,
    input wire clk,
    input wire [22:0] ca,
    input wire [31:0] sr,
    input wire [31:0] pc,
    input wire e,
    input wire mode,
    input wire eret,
    input wire [31:0] esr,
    input wire [31:0] epc,
    input wire rpt,
    input wire [31:0] next_pc,
    input wire [31:0] ea,
    output wire [31:0] sr_out,
    output wire [31:0] esr_out,
    output wire [31:0] eca_out,
    output wire [31:0] epc_out,
    output wire [31:0] edata_out,
    output wire [31:0] pto,
    output wire [31:0] ptl,
    output wire mode_out
);


INSTANCE:

interrupt_controller ic_inst (
        .ca(ca),
        .sr(sr),
        .jisr(jisr),
        .il(il)
);


spr spr_inst (
        .clk(clk),
        .jisr(jisr),
        .esr(esr),
        .sr(sr),
        .mca({9'b0, ca}),  // mca is 32-bit long
        .rpt(rpt),
        .pc(pc),
        .next_pc(next_pc),
        .ea(ea),
        .mode(mode),
        .sr_out(sr_out),
        .esr_out(esr_out),
        .eca_out(eca_out),
        .epc_out(epc_out),
        .edata_out(edata_out),
        .pto(pto),
        .ptl(ptl),
        .mode_out(mode_out)
    );


