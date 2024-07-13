//--------------------------------------------------------------------------//
// Title:        baseline_pinout.v                                          //
// Rev:          Rev 1.0                                                    //
// Last Revised: 10/13/2015 by Geraldine Baniqued                           //
//--------------------------------------------------------------------------//
// Description: Baseline design file contains Cyclone V GX Starter Kit    	//
//              Board pins and I/O Standards.                               //
//--------------------------------------------------------------------------//
//Copyright 2012 Altera Corporation. All rights reserved.  Altera products
//are protected under numerous U.S. and foreign patents, maskwork rights,
//copyrights and other intellectual property laws.
//                 
//This reference design file, and your use thereof, is subject to and
//governed by the terms and conditions of the applicable Altera Reference
//Design License Agreement.  By using this reference design file, you
//indicate your acceptance of such terms and conditions between you and
//Altera Corporation.  In the event that you do not agree with such terms and
//conditions, you may not use the reference design file. Please promptly                         
//destroy any copies you have made.
//
//This reference design file being provided on an "as-is" basis and as an
//accommodation and therefore all warranties, representations or guarantees
//of any kind (whether express, implied or statutory) including, without
//limitation, warranties of merchantability, non-infringement, or fitness for
//a particular purpose, are specifically disclaimed.  By making this
//reference design file available, Altera expressly does not recommend,
//suggest or require that this reference design file be used in combination 
//with any other product not provided by Altera
//----------------------------------------------------------------------------


`define ENABLE_DDR2LP

module baseline_c5gx(

      ///////// ADC ///////// 1.2 V ///////
      output             ADC_CONVST,
      output             ADC_SCK,
      output             ADC_SDI,
      input              ADC_SDO,

      ///////// AUD ///////// 2.5 V ///////
      input              AUD_ADCDAT,
      inout              AUD_ADCLRCK,
      inout              AUD_BCLK,
      output             AUD_DACDAT,
      inout              AUD_DACLRCK,
      output             AUD_XCK,

      ///////// CLOCK /////////
      input              CLOCK_125_p, ///LVDS
      input              CLOCK_50_B5B, ///3.3-V LVTTL
      input              CLOCK_50_B6A,
      input              CLOCK_50_B7A, ///2.5 V
      input              CLOCK_50_B8A,

      ///////// CPU /////////
      input              CPU_RESET_n, ///3.3V LVTTL

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

      ///////// HEX2 ///////// 1.2 V ///////
      output      [6:0]  HEX2,

      ///////// HEX3 ///////// 1.2 V ///////
      output      [6:0]  HEX3,

      ///////// HDMI /////////
      output             HDMI_TX_CLK,
      output      [23:0] HDMI_TX_D,
      output             HDMI_TX_DE,
      output             HDMI_TX_HS,
      input              HDMI_TX_INT,
      output             HDMI_TX_VS,

      ///////// HEX0 /////////
      output      [6:0]  HEX0,

      ///////// HEX1 /////////
      output      [6:0]  HEX1,


      ///////// HSMC ///////// 2.5 V ///////
      input              HSMC_CLKIN0,
      input       [2:1]  HSMC_CLKIN_n,
      input       [2:1]  HSMC_CLKIN_p,
      output             HSMC_CLKOUT0,
      output      [2:1]  HSMC_CLKOUT_n,
      output      [2:1]  HSMC_CLKOUT_p,
      inout       [3:0]  HSMC_D,
      inout       [16:0] HSMC_RX_n,
      inout       [16:0] HSMC_RX_p,
      inout       [16:0] HSMC_TX_n,
      inout       [16:0] HSMC_TX_p,

      ///////// I2C ///////// 2.5 V ///////
      output             I2C_SCL,
      inout              I2C_SDA,

      ///////// KEY ///////// 1.2 V ///////
      input       [3:0]  KEY,

      ///////// LEDG ///////// 2.5 V ///////
      output      [7:0]  LEDG,

      ///////// LEDR ///////// 2.5 V ///////
      output      [9:0]  LEDR,

      ///////// SD ///////// 3.3-V LVTTL ///////
      output             SD_CLK,
      inout              SD_CMD,
      inout       [3:0]  SD_DAT,

      ///////// SRAM ///////// 3.3-V LVTTL ///////
      output      [17:0] SRAM_A,
      output             SRAM_CE_n,
      inout       [15:0] SRAM_D,
      output             SRAM_LB_n,
      output             SRAM_OE_n,
      output             SRAM_UB_n,
      output             SRAM_WE_n,

      ///////// SW ///////// 1.2 V ///////
      input       [9:0]  SW,

      ///////// UART ///////// 2.5 V ///////
      input              UART_RX,
      output             UART_TX
);

wire [0:31] Alures, registerOut, pc;
wire halt;

CPU cpu(
	CLOCK_50_B5B,
	SW[0],
	halt,
	Alures,
	registerOut,
	pc,
	LEDG[0]
);

assign HEX0 = GenerateHexDisplayFromInteger((registerOut)%10);
assign HEX1 = GenerateHexDisplayFromInteger((registerOut/10)%10);
assign HEX2 = GenerateHexDisplayFromInteger((registerOut/100)%10);
assign HEX3 = GenerateHexDisplayFromInteger(registerOut/1000);

//Responsible for generating a proper HEX from a number for the LED
function reg[6:0] GenerateHexDisplayFromInteger(input [0:31] number);
	case (number % 10)
		0: GenerateHexDisplayFromInteger = 8'b1000000;
		1: GenerateHexDisplayFromInteger = 8'b1111001;
		2: GenerateHexDisplayFromInteger = 8'b0100100;
		3: GenerateHexDisplayFromInteger = 8'b0110000;
		4: GenerateHexDisplayFromInteger = 8'b0011001;
		5: GenerateHexDisplayFromInteger = 8'b0010010;
		6: GenerateHexDisplayFromInteger = 8'b0000010;
		7: GenerateHexDisplayFromInteger = 8'b1111000;
		8: GenerateHexDisplayFromInteger = 8'b0000000;
		9: GenerateHexDisplayFromInteger = 8'b0010000;
		default: GenerateHexDisplayFromInteger = 8'b111111;
	endcase
endfunction

// LPDDR2 Memory setup
wire [26:0] address;
wire [31:0] write_data;
wire [31:0] read_data;
wire read_req;
wire write_req;

assign address = 199;
assign write_data = 199;

reg sw4_prev;
reg sw4_posedge;

always @(posedge CLOCK_50_B5B) begin
      sw4_prev <= SW[4];
      sw4_posedge <= SW[4] & ~sw4_prev;
end

reg sw3_prev;
reg sw3_posedge;

always @(posedge CLOCK_50_B5B) begin
      sw3_prev <= SW[3];
      sw3_posedge <= SW[3] & ~sw3_prev;
end

assign read_req = sw3_posedge;
assign write_req = sw4_posedge;

//assign HEX0 = GenerateHexDisplayFromInteger((read_data)%10);
//assign HEX1 = GenerateHexDisplayFromInteger((read_data/10)%10);
//assign HEX2 = GenerateHexDisplayFromInteger((read_data/100)%10);
//assign HEX3 = GenerateHexDisplayFromInteger(read_data/1000);

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

fpga_lpddr2 fpga_lpddr2_inst(
    .pll_ref_clk(CLOCK_50_B5B),
    .global_reset_n(test_global_reset_n),
    .soft_reset_n(test_software_reset_n),
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
    .oct_rzqin(DDR2LP_OCT_RZQ)
);

reg [31:0]  cont;
always@(posedge CLOCK_50_B6A)
      cont<=(cont==32'd4_000_001)?32'd0:cont+1'b1;

reg[4:0] sample;
always@(posedge CLOCK_50_B6A) begin
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
lpddr2_memory fpga_lpddr2_Verify(
      .iCLK(afi_half_clk),
      .iRST_n(test_software_reset_n),

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
//assign LEDG[0] = !c_state;
//assign LEDG[1] = !fpga_lpddr2_local_init_done;
//assign LEDR[3:0] = c_state;
endmodule