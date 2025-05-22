// mmu module with inputs 
// pc[31:2], ea[31:2], pto[31:2], mout 32 bits, 
// 1 bit signals: phase and E, and mode, 
// output ma 

module MMU (
    input clk,
    input [29:0] pc,
    input [29:0] ea,
    input [29:0] pto,
    input [31:0] mout,
    input phase,
    input E,
    input mode,
    output [29:0] ma
);

  reg [31:0] pte;
  
  initial begin
    pte = 0;
  end

  // internal signals
  wire [29:0] va;
  wire [29:0] ptea;
  wire [29:0] pma;
  wire [29:0] pma_or_ptea;

  assign va = (E) ? ea : pc;

  // ptea = pto + 0^10va[31:12]
  assign ptea = pto + {10'b0, va[29:10]};

  // pma = pte[31:12]va[11:2]
  assign pma = {pte[29:10], va[9:0]};

  // if phase then pma, else ptea
  assign pma_or_ptea = (phase) ? pma : ptea;

  // on negedge of phase make pte mout
  always @(posedge clk) begin
    pte <= ~phase ? mout : pte;
  end

  // ma: if mode then pma_or_ptea, else va[31:2]
  assign ma = (mode) ? pma_or_ptea : va;


endmodule

