module seq_det_111(x,clk,rst,z);
input clk,rst,x;
output z;
parameter case1 = 2'b00;
parameter case2 = 2'b01;
parameter case3 = 2'b10;
reg[1:0] present_state,next_state;

always@(posedge clk)
begin
    if(rst)
        present_state<=case1;
    else
        present_state<=next_state;
end

always@(*)
begin
    present_state = case1;
    case(present_state)
        case1 : begin
            if(x==1)
                next_state = case2;
            else
                next_state = case1;
        end
        case2 : begin
            if(x==1)
                next_state = case3;
            else
                next_state = case1;
        end
        case3 : begin
            if(x==1)
                next_state = case3;
            else
                next_state = case1;
        end
        default:next_state = case1;
    endcase
end

assign z = (present_state==case3)&&(x==1) ? 1:0;
endmodule


