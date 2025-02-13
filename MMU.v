// mmu module with inputs
// pc[31:2], ea[31:2], pto[31:2], mout 32 bits, 
// 1 bit signals: phase and E, and mode, 
// output ma

module MMU (
    input [31:2] pc,
    input [31:2] ea,
    input [31:2] pto,
    input [31:0] mout,
    input phase,
    input E,
    input mode,
    output [31:2] ma
);

  reg [31:0] pte;

  initial begin
    pte = 0;
  end

  // internal signals
  wire [31:2] va;
  wire [31:2] ptea;
  wire [31:2] pma;
  wire [31:2] pma_or_ptea;
  
  assign va = (E) ? ea : pc;

  // ptea = pto + 0^10va[31:12]
  assign ptea = pto + {10'b0, va[31:12]};

  // pma = pte[31:12]va[11:2]
  assign pma = {pte[31:12], va[11:2]};

  // if phase then pma, else ptea
  assign pma_or_ptea = (phase) ? pma : ptea;

  // on negedge of phase make pte mout
  always @(negedge phase) begin
    pte <= mout;
  end

  // ma: if mode then pma_or_ptea, else va[31:2]
  assign ma = (mode) ? pma_or_ptea : va;


endmodule

