module disk (
    input clk,
	 input clk_shifted,
    input rst_n,
    
    // SRAM page memory signals
    input [10:0] hd_a,
    input [31:0] hdin,
    output [31:0] hdout,
    input hd_w,
    
    // SD Card signals
    output SD_CLK,
    inout SD_CMD,
    inout [3:0] SD_DAT,
	 
	 output [2:0] debug_state
);

    localparam [2:0]
        SD_INIT      = 3'h0,  // Wait for SD card to initialize
        SD_RST_CMSR  = 3'h1,  // Request reset value of CMSR
		  SD_ACQ_CMSR  = 3'h2,	// Recieve CMSR value
        SD_ACQ_SPAR  = 3'h3,  // Request SPAR value
        SD_READ      = 3'h4,  // Read Operation
        SD_WRITE     = 3'h5;  // Write Operation

    // Register declarations - all with proper initialization
    reg [2:0] state = SD_INIT;
    reg [2:0] next_state;
	 
	 assign debug_state = state;
    
    reg rd_en = 1'b0;             // Read enable
    reg wr_en = 1'b0;             // Write enable
    
    reg [10:0] disk_sram_addr_incr = 11'h0;  // Address incrementer
    
    reg [31:0] sram_reg_data = 32'h0;
    reg [10:0] sram_reg_addr = 11'h0;
    reg sram_reg_wren = 1'b0;
    
    reg [31:0] spar = 32'h0;
    reg [1:0]  cmsr = 2'b00;
    
    // Wire declarations
    wire init_end;              // SD card initialization done
    wire locked;                // PLL locked
    
    wire rd_busy;               // Read operation busy
    wire rd_data_en;            // Read data enable
    wire [15:0] rd_data;        // Read data
    
    wire wr_busy;               // Write busy signal
    wire wr_req;                // Write request signal
    reg [15:0] wr_data;        // Write data
    
    wire disk_sram_wren;        // SRAM write enable
    wire [3:0] disk_sram_byteena; // SRAM byte enable
    wire [10:0] disk_sram_addr;   // SRAM address
    wire [31:0] disk_sram_data_in; // SRAM data in
    wire [31:0] disk_sram_data_out /* synthesis keep */;

    // SD Card signal assignments
    wire [31:0] sd_addr;
    assign sd_addr = spar + disk_sram_addr_incr[10:8];
    assign SD_DAT = 4'bZ;
    
    // SD card controller instantiation
    sd_ctrl sdcard (
        .sys_clk       (clk),
        .sys_clk_shift (clk_shifted),
        .sys_rst_n     (rst_n),
        
        // SD card interface
        .sd_miso       (SD_DAT[0]),
        .sd_clk        (SD_CLK),
        .sd_cs_n       (SD_DAT[3]),
        .sd_mosi       (SD_CMD),
        
        // Write interface
        .wr_en         (wr_en),
        .wr_addr       (sd_addr),
        .wr_data       (wr_data),
        .wr_busy       (wr_busy),
        .wr_req        (wr_req),
        
        // Read interface
        .rd_en         (rd_en),      
        .rd_addr       (sd_addr),     
        .rd_busy       (rd_busy),
        .rd_data_en    (rd_data_en),
        .rd_data       (rd_data),
        
        // Status signals
        .init_end      (init_end)
    );
	     
	 // On-Chip 2-port SRAM instantiation
    disk_pagemem pagemem (
        .clock(clk),
        
        // Port for the disk
        .address_a(disk_sram_addr),
        .data_a(disk_sram_data_in),
        .byteena_a(disk_sram_byteena),
        .wren_a(disk_sram_wren),
        .q_a(disk_sram_data_out),
        
        // Port for the processor
        .address_b(hd_a),
        .data_b(hdin),
        .wren_b(hd_w),
        .q_b(hdout)
    );
    
    // Synchronous address incrementer with edge detection
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            disk_sram_addr_incr <= 11'h0;
				wr_data <= 16'h0;
        end
        else if (wr_req || rd_data_en) begin
            disk_sram_addr_incr <= disk_sram_addr_incr + 11'h1;
				wr_data <= disk_sram_addr_incr[0] ? disk_sram_data_out[15:0] : disk_sram_data_out[31:16];
        end
    end
    
	 //SRAM signal assignments
    assign disk_sram_data_in = (state == SD_READ) ? {rd_data, rd_data} : sram_reg_data;
    assign disk_sram_byteena = disk_sram_addr_incr[0] ? 4'b1100 : 4'b0011;
    assign disk_sram_wren = (state == SD_READ) ? 1'b1 : sram_reg_wren;
    assign disk_sram_addr = ((state == SD_READ) || (state == SD_WRITE)) ? 
                           {1'b0, disk_sram_addr_incr[10:1]} : sram_reg_addr;
    
    // Disk busy status with clear definition
    wire disk_busy;
    assign disk_busy = rd_busy | rd_en | wr_busy | wr_en;
    
	 reg [1:0] cmsr_rdy = 2'b0;
	 reg [1:0] spar_rdy = 2'b0;

    // Next state logic
    always @(*) begin
        // Default next state (prevent latches)
        next_state = state;
        
        case (state)
            SD_INIT: begin
                next_state = init_end ? SD_ACQ_CMSR : SD_INIT;
            end
            
            SD_RST_CMSR: begin
                next_state = SD_ACQ_CMSR;
            end
            
				SD_ACQ_CMSR: begin
					next_state = (cmsr_rdy == 2'b11) && (cmsr[0] ^ cmsr[1]) ? SD_ACQ_SPAR : SD_ACQ_CMSR;
				end
				
            SD_ACQ_SPAR: begin
					 if(spar_rdy == 2'b11)
						next_state = cmsr[0] ? SD_READ : SD_WRITE;
					 else
						next_state = SD_ACQ_SPAR;
            end

            SD_READ: begin
                if (!disk_busy)
						next_state = SD_RST_CMSR;
            end
            
            SD_WRITE: begin
                if (!disk_busy)
						next_state = SD_RST_CMSR;
            end
            
            default: begin
                next_state = SD_INIT;
            end
        endcase
    end
    
    // State and output registers
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            state <= SD_INIT;
            
            sram_reg_addr <= 11'h0;
            sram_reg_wren <= 1'b0;
            sram_reg_data <= 32'h0;
                    
            rd_en <= 1'b0;
            wr_en <= 1'b0;
                    
            spar <= 32'h0;
            cmsr <= 2'b00;
				
				spar_rdy <= 2'b0;
				cmsr_rdy <= 2'b0;
        end
        else begin
            // Update state
            state <= next_state;
            
            // Default values for outputs (prevent latches)
            rd_en <= rd_en;
            wr_en <= wr_en;
            sram_reg_addr <= sram_reg_addr;
            sram_reg_wren <= sram_reg_wren;
            sram_reg_data <= sram_reg_data;
            spar <= spar;
            cmsr <= cmsr;
				spar_rdy <= spar_rdy;
				cmsr_rdy <= cmsr_rdy;
            
            // State-specific output logic
            case (state)
                SD_INIT: begin
                    sram_reg_addr <= 11'h0;
                    sram_reg_wren <= 1'b0;
                    sram_reg_data <= 32'h0;
                    
                    rd_en <= 1'b0;
                    wr_en <= 1'b0;
						  
						  spar_rdy <= 2'b0;
						  cmsr_rdy <= 2'b0;
                end
                
                SD_RST_CMSR: begin
                    sram_reg_addr <= 11'h401;
                    sram_reg_wren <= 1'b1;
                    sram_reg_data <= 32'h0;
                    
                    rd_en <= 1'b0;
                    wr_en <= 1'b0;
                    
                    cmsr <= 2'b00;
						  
						  spar_rdy <= 2'b0;
						  cmsr_rdy <= 2'b0;
                end
					 
					 SD_ACQ_CMSR: begin
						  sram_reg_addr <= 11'h401;
						  sram_reg_wren <= 0;
						  sram_reg_data <= 32'b0;
						  
						  if(cmsr_rdy != 2'b11) begin
								cmsr_rdy <= cmsr_rdy + 2'b1;
						  end
						  else begin
								cmsr <= disk_sram_data_out[1:0];
						  end
					 end
                
                SD_ACQ_SPAR: begin
                    sram_reg_addr <= 11'h400;
                    sram_reg_wren <= 1'b0;
                    sram_reg_data <= 32'h0;
                    
                    rd_en <= 1'b0;
                    wr_en <= 1'b0;
						  
						  if(spar_rdy != 2'b11) begin
								spar_rdy <= spar_rdy + 2'b1;
						  end
						  else begin
								spar <= disk_sram_data_out;
								if(cmsr[0])
									rd_en <= 1'b1;
								else
									wr_en <= 1'b1;
						  end
						  
                end
                
                SD_READ: begin
                    if (rd_busy && disk_sram_addr_incr[10:7] == 4'b1111) begin
                        rd_en <= 1'b0;
                    end
                end
                
                SD_WRITE: begin
                    if (wr_busy && disk_sram_addr_incr[10:7] == 4'b1111) begin
                        wr_en <= 1'b0;
                    end
                end
            endcase
        end
    end
endmodule