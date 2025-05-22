module hex_display(
    input wire [31:0] value,
    output wire [6:0] hex0,
    output wire [6:0] hex1,
    output wire [6:0] hex2,
    output wire [6:0] hex3
);

reg [3:0] digit0, digit1, digit2, digit3;

always @(*) begin
    digit0 = value % 10;
    digit1 = (value / 10) % 10;
    digit2 = (value / 100) % 10;
    digit3 = (value / 1000) % 10;
end

function [6:0] seven_seg;
    input [3:0] digit;
    begin
        case(digit)
            4'd0: seven_seg = 7'b1000000;
            4'd1: seven_seg = 7'b1111001;
            4'd2: seven_seg = 7'b0100100;
            4'd3: seven_seg = 7'b0110000;
            4'd4: seven_seg = 7'b0011001;
            4'd5: seven_seg = 7'b0010010;
            4'd6: seven_seg = 7'b0000010;
            4'd7: seven_seg = 7'b1111000;
            4'd8: seven_seg = 7'b0000000;
            4'd9: seven_seg = 7'b0010000;
            default: seven_seg = 7'b1111111;
        endcase
    end
endfunction

assign hex0 = seven_seg(digit0);
assign hex1 = seven_seg(digit1);
assign hex2 = seven_seg(digit2);
assign hex3 = seven_seg(digit3);

endmodule