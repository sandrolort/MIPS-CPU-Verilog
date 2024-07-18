module CPU_tb;
    reg clk;
    reg rst;

    wire halt;
    wire [31:0] Alures;
    wire [31:0] registerOut;
    wire [31:0] pc;

    CPU uut (
        .clk(clk),
        .rst(rst),
        .halt(halt),
        .Alures(Alures),
        .registerOut(registerOut),
        .pc(pc)
    );

    initial begin
        clk = 0;
        rst = 0;

        #30 rst = 1;
        #30 rst = 0;
    end
	 
	 always begin
		#10 clk = ~clk;
	 end

endmodule
