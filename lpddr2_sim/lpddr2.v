// lpddr2.v

// Generated using ACDS version 23.1 993

`timescale 1 ps / 1 ps
module lpddr2 (
		input  wire        pll_ref_clk,                //        pll_ref_clk.clk
		input  wire        global_reset_n,             //       global_reset.reset_n
		input  wire        soft_reset_n,               //         soft_reset.reset_n
		output wire        afi_clk,                    //            afi_clk.clk
		output wire        afi_half_clk,               //       afi_half_clk.clk
		output wire        afi_reset_n,                //          afi_reset.reset_n
		output wire        afi_reset_export_n,         //   afi_reset_export.reset_n
		output wire [9:0]  mem_ca,                     //             memory.mem_ca
		output wire [0:0]  mem_ck,                     //                   .mem_ck
		output wire [0:0]  mem_ck_n,                   //                   .mem_ck_n
		output wire [0:0]  mem_cke,                    //                   .mem_cke
		output wire [0:0]  mem_cs_n,                   //                   .mem_cs_n
		output wire [3:0]  mem_dm,                     //                   .mem_dm
		inout  wire [31:0] mem_dq,                     //                   .mem_dq
		inout  wire [3:0]  mem_dqs,                    //                   .mem_dqs
		inout  wire [3:0]  mem_dqs_n,                  //                   .mem_dqs_n
		output wire        avl_ready_0,                //              avl_0.waitrequest_n
		input  wire        avl_burstbegin_0,           //                   .beginbursttransfer
		input  wire [26:0] avl_addr_0,                 //                   .address
		output wire        avl_rdata_valid_0,          //                   .readdatavalid
		output wire [31:0] avl_rdata_0,                //                   .readdata
		input  wire [31:0] avl_wdata_0,                //                   .writedata
		input  wire [3:0]  avl_be_0,                   //                   .byteenable
		input  wire        avl_read_req_0,             //                   .read
		input  wire        avl_write_req_0,            //                   .write
		input  wire [2:0]  avl_size_0,                 //                   .burstcount
		input  wire        mp_cmd_clk_0_clk,           //       mp_cmd_clk_0.clk
		input  wire        mp_cmd_reset_n_0_reset_n,   //   mp_cmd_reset_n_0.reset_n
		input  wire        mp_rfifo_clk_0_clk,         //     mp_rfifo_clk_0.clk
		input  wire        mp_rfifo_reset_n_0_reset_n, // mp_rfifo_reset_n_0.reset_n
		input  wire        mp_wfifo_clk_0_clk,         //     mp_wfifo_clk_0.clk
		input  wire        mp_wfifo_reset_n_0_reset_n, // mp_wfifo_reset_n_0.reset_n
		output wire        local_init_done,            //             status.local_init_done
		output wire        local_cal_success,          //                   .local_cal_success
		output wire        local_cal_fail,             //                   .local_cal_fail
		input  wire        oct_rzqin,                  //                oct.rzqin
		output wire        pll_mem_clk,                //        pll_sharing.pll_mem_clk
		output wire        pll_write_clk,              //                   .pll_write_clk
		output wire        pll_locked,                 //                   .pll_locked
		output wire        pll_write_clk_pre_phy_clk,  //                   .pll_write_clk_pre_phy_clk
		output wire        pll_addr_cmd_clk,           //                   .pll_addr_cmd_clk
		output wire        pll_avl_clk,                //                   .pll_avl_clk
		output wire        pll_config_clk,             //                   .pll_config_clk
		output wire        pll_mem_phy_clk,            //                   .pll_mem_phy_clk
		output wire        afi_phy_clk,                //                   .afi_phy_clk
		output wire        pll_avl_phy_clk             //                   .pll_avl_phy_clk
	);

	lpddr2_0002 lpddr2_inst (
		.pll_ref_clk                (pll_ref_clk),                //        pll_ref_clk.clk
		.global_reset_n             (global_reset_n),             //       global_reset.reset_n
		.soft_reset_n               (soft_reset_n),               //         soft_reset.reset_n
		.afi_clk                    (afi_clk),                    //            afi_clk.clk
		.afi_half_clk               (afi_half_clk),               //       afi_half_clk.clk
		.afi_reset_n                (afi_reset_n),                //          afi_reset.reset_n
		.afi_reset_export_n         (afi_reset_export_n),         //   afi_reset_export.reset_n
		.mem_ca                     (mem_ca),                     //             memory.mem_ca
		.mem_ck                     (mem_ck),                     //                   .mem_ck
		.mem_ck_n                   (mem_ck_n),                   //                   .mem_ck_n
		.mem_cke                    (mem_cke),                    //                   .mem_cke
		.mem_cs_n                   (mem_cs_n),                   //                   .mem_cs_n
		.mem_dm                     (mem_dm),                     //                   .mem_dm
		.mem_dq                     (mem_dq),                     //                   .mem_dq
		.mem_dqs                    (mem_dqs),                    //                   .mem_dqs
		.mem_dqs_n                  (mem_dqs_n),                  //                   .mem_dqs_n
		.avl_ready_0                (avl_ready_0),                //              avl_0.waitrequest_n
		.avl_burstbegin_0           (avl_burstbegin_0),           //                   .beginbursttransfer
		.avl_addr_0                 (avl_addr_0),                 //                   .address
		.avl_rdata_valid_0          (avl_rdata_valid_0),          //                   .readdatavalid
		.avl_rdata_0                (avl_rdata_0),                //                   .readdata
		.avl_wdata_0                (avl_wdata_0),                //                   .writedata
		.avl_be_0                   (avl_be_0),                   //                   .byteenable
		.avl_read_req_0             (avl_read_req_0),             //                   .read
		.avl_write_req_0            (avl_write_req_0),            //                   .write
		.avl_size_0                 (avl_size_0),                 //                   .burstcount
		.mp_cmd_clk_0_clk           (mp_cmd_clk_0_clk),           //       mp_cmd_clk_0.clk
		.mp_cmd_reset_n_0_reset_n   (mp_cmd_reset_n_0_reset_n),   //   mp_cmd_reset_n_0.reset_n
		.mp_rfifo_clk_0_clk         (mp_rfifo_clk_0_clk),         //     mp_rfifo_clk_0.clk
		.mp_rfifo_reset_n_0_reset_n (mp_rfifo_reset_n_0_reset_n), // mp_rfifo_reset_n_0.reset_n
		.mp_wfifo_clk_0_clk         (mp_wfifo_clk_0_clk),         //     mp_wfifo_clk_0.clk
		.mp_wfifo_reset_n_0_reset_n (mp_wfifo_reset_n_0_reset_n), // mp_wfifo_reset_n_0.reset_n
		.local_init_done            (local_init_done),            //             status.local_init_done
		.local_cal_success          (local_cal_success),          //                   .local_cal_success
		.local_cal_fail             (local_cal_fail),             //                   .local_cal_fail
		.oct_rzqin                  (oct_rzqin),                  //                oct.rzqin
		.pll_mem_clk                (pll_mem_clk),                //        pll_sharing.pll_mem_clk
		.pll_write_clk              (pll_write_clk),              //                   .pll_write_clk
		.pll_locked                 (pll_locked),                 //                   .pll_locked
		.pll_write_clk_pre_phy_clk  (pll_write_clk_pre_phy_clk),  //                   .pll_write_clk_pre_phy_clk
		.pll_addr_cmd_clk           (pll_addr_cmd_clk),           //                   .pll_addr_cmd_clk
		.pll_avl_clk                (pll_avl_clk),                //                   .pll_avl_clk
		.pll_config_clk             (pll_config_clk),             //                   .pll_config_clk
		.pll_mem_phy_clk            (pll_mem_phy_clk),            //                   .pll_mem_phy_clk
		.afi_phy_clk                (afi_phy_clk),                //                   .afi_phy_clk
		.pll_avl_phy_clk            (pll_avl_phy_clk)             //                   .pll_avl_phy_clk
	);

endmodule
