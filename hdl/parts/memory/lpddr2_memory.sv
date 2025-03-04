module lpddr2_memory #(
    parameter ADDR_W = 27,
    parameter DATA_W = 32
) (
    input iCLK,
    input iRST_n,
    input read_req,
    input write_req,
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

reg [DATA_W-1:0] data_reg;

assign avl_burstbegin = avl_write || avl_read;
assign outData = data_reg;

localparam  INIT = 3'd0,
            IDLE = 3'd1,
            WRITE = 3'd2,
            WAIT_WRITE = 3'd3,
            READ = 3'd4,
            WAIT_READ = 3'd5;

always@(posedge iCLK) begin
    if (!iRST_n) begin 
        c_state <= INIT;
        avl_write <= 1'b0;
        avl_read <= 1'b0;
    end
    else begin
        case (c_state)
            INIT : begin
                avl_address <= addr;
                if (local_init_done)
                    c_state <= IDLE;
            end

            IDLE: begin
                if (read_req)
                    c_state <= READ;
                else if (write_req) 
                    c_state <= WRITE;
            end

            WRITE : begin
                avl_writedata <= inData;
                avl_address <= addr;
                avl_write <= 1'b1;
                c_state <= WAIT_WRITE;
            end

            WAIT_WRITE : begin
                if (avl_waitrequest_n) begin
                    c_state <= IDLE;
                    avl_write <= 1'b0;
                end
            end

            READ : begin
                avl_address <= addr;
                avl_read <= 1'b1;
                if (avl_waitrequest_n)
                    c_state <= WAIT_READ;
            end

            WAIT_READ : begin
                avl_read <= 1'b0;
                if (avl_readdatavalid) begin
                    data_reg <= avl_readdata;
                    c_state <= IDLE;
                end
            end

            default : c_state <= INIT;
        endcase
    end
end

endmodule
