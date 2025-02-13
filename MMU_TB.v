`include "MMU.v"


// testbench for MMU_TB.v
// for testing MMU.v, I will only test for the user mode
// I should generate 4 cyles for (E, phase) in this order: (0, 0), (0, 1), (1, 0), (1, 1)
// This will be done using always statement E will change 20ns and phase will change 10ns
// PTO = 1024
module MMU_TB;

  reg [31:2] pc, ea, pto;
  wire [19:0] pc_px, ea_px;
  wire [11:0] pc_bx, ea_bx;
  reg [31:0] mout;
  reg phase, E, mode;
  wire [31:2] ma;

  task set_address(input [19:0] px, input [11:0] bx, input is_pc);
    begin
      if (is_pc) begin
        pc = {px, bx};  // Set pc.px and pc.bx
      end else begin
        ea = {px, bx};  // Set ea.px and ea.bx
      end
    end
  endtask

  // Instantiate the MMU module
  MMU uut (
      .pc(pc),
      .ea(ea),
      .pto(pto),
      .mout(mout),
      .phase(phase),
      .E(E),
      .mode(mode),
      .ma(ma)
  );

  // Initialize the signals
  initial begin
    pto = 1024;
    E = 0;
    phase = 0;
    mode = 1;
  end

  // generate (E,phase)

  always #20 E = ~E;
  always #10 phase = ~phase;

  // generate pc
  always #20 pc = pc + 4;


  initial begin

    // (0,0) 1
    // pc.px = 4, pc.bx = 4

    set_address(4, 4, 1);
    

  end


endmodule






