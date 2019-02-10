module seq_det(clk,rst,z);
input clk,rst;
output reg z;
parameter green = 2'b00;
parameter yellow = 2'b01;
parameter red = 2'b10;
reg [1:0]present_state,next_state;

always@(posedge clk)
begin
    if(rst)
        present_state<=green;
    else
        present_state<=next_state;
end

always@(*)
begin
    present_state = green;
    case(present_state)
        green:next_state = red;
        yellow:next_state = green;
        red:next_state = yellow;
        default:next_state = green;
    endcase
end

always@(present_state)
begin
    case(present_state)
        green:z = 1;
        yellow:z = 0;
        red:z = 0;
        default:z = 0;
    endcase
end
endmodule
