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
		
always@(posedge iCLK)
begin
	if (!iRST_n) begin 
		pre_button <= 2'b11;
		trigger <= 1'b0;
		write_count <= 5'b0;
		c_state <= 4'b0;
		avl_write <= 1'b0;
		avl_read <= 1'b0;
	end
	else begin
        case (c_state)
            INIT : begin //init
                avl_address <= addr;
                if (local_init_done)
                begin
                    c_state <= IDLE;
                end
            end
            IDLE: begin //idle
                if     (read_req)  c_state <= READ;
                else if(write_req) c_state <= WRITE;
            end
            WRITE : begin //write begin
                avl_writedata <= inData; //sdc set multi-cycle 3
                avl_address <= addr; //sdc set multi-cycle 3
                if (write_count[3]) begin
                    write_count <= 5'b0;
                    avl_write <= 1'b1;
                    c_state <= WAIT_WRITE;
                end
                else write_count <= write_count + 1'b1;
            end
            WAIT_WRITE : begin //write end
                if (avl_waitrequest_n)
                begin
                    avl_write <= 1'b0;
                    c_state <= IDLE;
                end
            end
            READ : begin //read begin
                avl_address <= addr; //sdc set multi-cycle 3	
                avl_read <= 1;
                
                if (!write_count[3])
                    write_count <= write_count + 1'b1;
                
                if (avl_waitrequest_n)
                    c_state <= WAIT_READ;
            end
            WAIT_READ : begin //read end
                avl_read <= 0;
            
                if (!write_count[3])
                    write_count <= write_count + 5'b1;

                if (avl_readdatavalid)
                begin
                    data_reg <= avl_readdata;
                    c_state <= IDLE;
                end
            end
            default : c_state <= INIT;
	  endcase
  end
end

endmodule 