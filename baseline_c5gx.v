`define ENABLE_DDR2LP
//`define ENABLE_HSMC_XCVR
//`define ENABLE_SMA
//`define ENABLE_REFCLK
//`define ENABLE_GPIO

module baseline_c5gx(

      ///////// CLOCK /////////
      input              CLOCK_125_p, ///LVDS
      input              CLOCK_50_B5B, ///3.3-V LVTTL
      input              CLOCK_50_B6A,
      input              CLOCK_50_B7A, ///2.5 V
      input              CLOCK_50_B8A,

`ifdef ENABLE_DDR2LP
      ///////// DDR2LP ///////// 1.2-V HSUL ///////
      output      [9:0]  DDR2LP_CA,
      output      [1:0]  DDR2LP_CKE,
      output             DDR2LP_CK_n, ///DIFFERENTIAL 1.2-V HSUL
      output             DDR2LP_CK_p, ///DIFFERENTIAL 1.2-V HSUL
      output      [1:0]  DDR2LP_CS_n,
      output      [3:0]  DDR2LP_DM,
      inout       [31:0] DDR2LP_DQ,
      inout       [3:0]  DDR2LP_DQS_n, ///DIFFERENTIAL 1.2-V HSUL
      inout       [3:0]  DDR2LP_DQS_p, ///DIFFERENTIAL 1.2-V HSUL
      input              DDR2LP_OCT_RZQ, ///1.2 V
`endif /*ENABLE_DDR2LP*/
	

      ///////// HEX0 /////////
      output      [6:0]  HEX0,

      ///////// HEX1 /////////
      output      [6:0]  HEX1,
      
      ///////// HEX2 /////////
      output      [6:0]  HEX2,

      ///////// HEX3 /////////
      output      [6:0]  HEX3,

      ///////// KEY ///////// 1.2 V ///////
      input       [3:0]  KEY,

      ///////// LEDG ///////// 2.5 V ///////
      output      [7:0]  LEDG,

      ///////// LEDR ///////// 2.5 V ///////
      output      [9:0]  LEDR,

      ///////// SW ///////// 1.2 V ///////
      input       [9:0]  SW,
		
		///////// SD ///////// 3.3 V ///////
		output				 SD_CLK,
		output				 SD_CMD,
		inout			[3:0]  SD_DAT
);

wire [31:0] hex_value;

wire read_req, write_req;
wire [31:0] address;
wire [31:0] read_data;
wire [31:0] write_data;

wire [31:0] disk_hdin;
wire [31:0] disk_hdout;
wire [10:0] disk_hda;
wire        disk_hd_w;

master mstr(
    .external_clk(CLOCK_50_B5B),
    .ena(SW[1] && c_state == 1),
    .rst(SW[0]),
    .debug_hex_display(hex_value),
    .clock_led(LEDG),
    .lpddr2_address(address),
    .lpddr2_write_data(write_data),
    .lpddr2_read_data(read_data),
    .lpddr2_rreq(read_req),
    .lpddr2_wreq(write_req),
	 
    // Disk Memory
    .disk_hdin(disk_hdin),
    .disk_hdout(disk_hdout),
    .disk_hda(disk_hda),
    .disk_hd_w(disk_hd_w)
);

hex_display display(
    .value(hex_value),
    .hex0(HEX0),
    .hex1(HEX1),
    .hex2(HEX2),
    .hex3(HEX3)
);

wire afi_clk;
wire afi_half_clk;
wire clk_lpddr2;

wire fpga_lpddr2_local_init_done/*synthesis keep*/;

wire         fpga_lpddr2_avl_ready;
wire         fpga_lpddr2_avl_burstbegin;
wire [26:0]  fpga_lpddr2_avl_addr;
wire         fpga_lpddr2_avl_rdata_valid;
wire [31:0]  fpga_lpddr2_avl_rdata;
wire [31:0]  fpga_lpddr2_avl_wdata;
wire         fpga_lpddr2_avl_read_req;
wire         fpga_lpddr2_avl_write_req;
wire [2:0]   fpga_lpddr2_avl_size;

assign fpga_lpddr2_avl_size = 3'b001;

wire lpddr_pll_locked;

lpddr2 fpga_lpddr2_inst(
    .pll_ref_clk(lpddr_refclk),
    .global_reset_n(test_global_reset_n & pll_locked),
    .soft_reset_n(test_software_reset_n & pll_locked),
    .afi_clk(afi_clk),
    .afi_half_clk(afi_half_clk),
    .mem_ca(DDR2LP_CA),
    .mem_ck(DDR2LP_CK_p),
    .mem_ck_n(DDR2LP_CK_n),
    .mem_cke(DDR2LP_CKE[0]),
    .mem_cs_n(DDR2LP_CS_n[0]),
    .mem_dm(DDR2LP_DM),
    .mem_dq(DDR2LP_DQ),
    .mem_dqs(DDR2LP_DQS_p),
    .mem_dqs_n(DDR2LP_DQS_n),
    .avl_ready_0(fpga_lpddr2_avl_ready),
    .avl_burstbegin_0(fpga_lpddr2_avl_burstbegin),
    .avl_addr_0(fpga_lpddr2_avl_addr),
    .avl_rdata_valid_0(fpga_lpddr2_avl_rdata_valid),
    .avl_rdata_0(fpga_lpddr2_avl_rdata),
    .avl_wdata_0(fpga_lpddr2_avl_wdata),
    .avl_be_0(4'hF),
    .avl_read_req_0(fpga_lpddr2_avl_read_req),
    .avl_write_req_0(fpga_lpddr2_avl_write_req),
    .avl_size_0(fpga_lpddr2_avl_size),
    .mp_cmd_clk_0_clk(afi_half_clk),
    .mp_cmd_reset_n_0_reset_n(test_software_reset_n),
    .mp_rfifo_clk_0_clk(afi_half_clk),
    .mp_rfifo_reset_n_0_reset_n(test_software_reset_n),
    .mp_wfifo_clk_0_clk(afi_half_clk),
    .mp_wfifo_reset_n_0_reset_n(test_software_reset_n),
    .local_init_done(fpga_lpddr2_local_init_done),
    .local_cal_success(),
    .local_cal_fail(),
    .oct_rzqin(DDR2LP_OCT_RZQ),
	 .pll_locked(lpddr_pll_locked)
);

reg [31:0]  cont;
always@(posedge CLOCK_50_B5B)
      cont<=(cont==32'd4_000_001)?32'd0:cont+1'b1;

reg[4:0] sample;
always@(posedge CLOCK_50_B5B) begin
      if(cont==32'd4_000_000)
            sample[4:0]={sample[3:0],KEY[0]};
      else 
            sample[4:0]=sample[4:0];
end

wire  test_software_reset_n;
wire  test_global_reset_n;   
wire  test_start_n;  

assign test_software_reset_n  =(sample[1:0]==2'b10)?1'b0:1'b1;
assign test_global_reset_n    =(sample[3:2]==2'b10)?1'b0:1'b1;
assign test_start_n           =(sample[4:3]==2'b01)?1'b0:1'b1;


wire [3:0] c_state;
lpddr2_memory fpga_mem_inst(
      .iCLK(afi_half_clk),
      .iRST_n(test_software_reset_n & lpddr_pll_locked),

      .read_req(read_req),
      .write_req(write_req),
      .addr(address),
      .inData(write_data),
      .outData(read_data),

      .local_init_done(fpga_lpddr2_local_init_done),
      .avl_waitrequest_n(fpga_lpddr2_avl_ready),                 
      .avl_address(fpga_lpddr2_avl_addr),                      
      .avl_readdatavalid(fpga_lpddr2_avl_rdata_valid),                 
      .avl_readdata(fpga_lpddr2_avl_rdata),                      
      .avl_writedata(fpga_lpddr2_avl_wdata),                     
      .avl_read(fpga_lpddr2_avl_read_req),                          
      .avl_write(fpga_lpddr2_avl_write_req),    
      .avl_burstbegin(fpga_lpddr2_avl_burstbegin),

      .c_state(c_state)
);

wire disk_clk_shifted;
wire lpddr_refclk;
wire pll_locked;
// PLL for clock shifting
diskpll clk_shift (
    .refclk(CLOCK_50_B5B),
	 .rst(SW[0]),
	 .outclk_0(lpddr_refclk),
	 .outclk_1(disk_clk_shifted),
	 .locked(pll_locked)
);

disk disk_inst(
		.clk(CLOCK_50_B5B),
		.clk_shifted(disk_clk_shifted),
		.rst_n(~SW[0] & pll_locked),
		
		.hda(disk_hda),
		.hd_w(disk_hd_w),
		.hdin(disk_hdin),
		.hdout(disk_hdout),
		
		.SD_CLK(SD_CLK),
		.SD_CMD(SD_CMD),
		.SD_DAT(SD_DAT),
		
		.debug_state(LEDR[9:7])
);
endmodule
