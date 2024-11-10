module lpddr2_memory #(
    parameter ADDR_W = 27,
    parameter DATA_W = 32
) (
    input iCLK,
    input i_cpu_clk,
    input iRST_n,
    input read_req_raw,
    input write_req_raw,
    input [ADDR_W-1:0] addr,
    input [DATA_W-1:0] inData,
    output [DATA_W-1:0] outData,
    input local_init_done,
    input avl_waitrequest_n,
    output reg [ADDR_W-1:0] avl_address,
    input avl_readdatavalid,
    input [DATA_W-1:0] avl_readdata,
    output reg [DATA_W-1:0] avl_writedata,
    output reg avl_read,
    output reg avl_write,
    output avl_burstbegin,
    output reg [3:0] c_state
);

// CPU clock domain synchronization
reg cpu_clk_prev;
reg cpu_new_req_allowed;
always @(posedge iCLK) begin
    cpu_clk_prev <= i_cpu_clk;
    if (!iRST_n) begin
        cpu_new_req_allowed <= 1'b0;
    end
    else begin
        // Detect rising edge of CPU clock
        if (i_cpu_clk && !cpu_clk_prev) begin
            cpu_new_req_allowed <= 1'b1;
        end
        else if (read_req || write_req) begin
            cpu_new_req_allowed <= 1'b0;
        end
    end
end

// Request edge detection with CPU clock synchronization
reg read_req_prev;
reg read_req;
always @(posedge iCLK) begin
    if (!iRST_n) begin
        read_req <= 1'b0;
        read_req_prev <= 1'b0;
    end
    else begin
        read_req <= read_req_raw & ~read_req_prev & cpu_new_req_allowed;
        read_req_prev <= read_req_raw;
    end
end

reg write_req_prev;
reg write_req;
always @(posedge iCLK) begin
    if (!iRST_n) begin
        write_req <= 1'b0;
        write_req_prev <= 1'b0;
    end
    else begin
        write_req <= write_req_raw & ~write_req_prev & cpu_new_req_allowed;
        write_req_prev <= write_req_raw;
    end
end

reg [1:0] pre_button;
reg trigger;
reg [DATA_W-1:0] data_reg;
reg [4:0] write_count;

assign avl_burstbegin = avl_write || avl_read;
assign outData = data_reg;

localparam  INIT = 3'd0,
            IDLE = 3'd1,
            WRITE = 3'd2,
            WAIT_WRITE = 3'd3,
            READ = 3'd4,
            WAIT_READ = 3'd5;

always @(posedge iCLK) begin
    if (!iRST_n) begin 
        pre_button <= 2'b11;
        trigger <= 1'b0;
        write_count <= 5'b0;
        c_state <= 4'b0;
        avl_write <= 1'b0;
        avl_read <= 1'b0;
        data_reg <= {DATA_W{1'b0}};
        avl_address <= {ADDR_W{1'b0}};
        avl_writedata <= {DATA_W{1'b0}};
    end
    else begin
        case (c_state)
            INIT: begin
                avl_address <= addr;
                if (local_init_done) begin
                    c_state <= IDLE;
                end
            end
            
            IDLE: begin
                if (read_req) begin
                    c_state <= READ;
                    write_count <= 5'b0;
                end
                else if (write_req) begin
                    c_state <= WRITE;
                    write_count <= 5'b0;
                end
            end
            
            WRITE: begin
                avl_writedata <= inData;
                avl_address <= addr;
                if (write_count[3]) begin
                    write_count <= 5'b0;
                    avl_write <= 1'b1;
                    c_state <= WAIT_WRITE;
                end
                else begin
                    write_count <= write_count + 1'b1;
                end
            end
            
            WAIT_WRITE: begin
                if (avl_waitrequest_n) begin
                    avl_write <= 1'b0;
                    c_state <= IDLE;
                end
            end
            
            READ: begin
                avl_address <= addr;
                avl_read <= 1'b1;
                
                if (!write_count[3]) begin
                    write_count <= write_count + 1'b1;
                end
                
                if (avl_waitrequest_n) begin
                    c_state <= WAIT_READ;
                end
            end
            
            WAIT_READ: begin
                avl_read <= 1'b0;
                
                if (!write_count[3]) begin
                    write_count <= write_count + 1'b1;
                end
                
                if (avl_readdatavalid) begin
                    data_reg <= avl_readdata;
                    c_state <= IDLE;
                end
            end
            
            default: c_state <= INIT;
        endcase
    end
end

endmodule