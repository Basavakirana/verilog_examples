module seq_det_1010(x,clk,rst,z);
input x,clk,rst;
output reg z;
parameter idle=4'h0;
parameter          case1=4'h1;
parameter          case2=4'h2;
parameter          case3=4'h3;
parameter          case4=4'h4;
reg [3:0]present_state,next_state;

always@(posedge clk)
begin
    if(rst)
        present_state<=idle;
    else
        present_state<=next_state;
end

always@(*)
begin
    present_state = idle;
    case(present_state)
        idle : begin
            if(x==1)
                next_state = case1;
            else
                next_state = idle;
        end
        case1 : begin
            if(x==1)
                next_state = case1;
            else
                next_state = case2;
        end
        case2: begin
            if(x==1)
                next_state = case3;
            else
                next_state = idle;
        end
        case3 : begin
            if(x==1)
                next_state = case1;
            else
                next_state = case4;
        end
        case4 : begin
            if(x==1)
                next_state = case1;
            else
                next_state = idle;
        end
        default : next_state = idle;
    endcase
    end

always@(present_state)
begin
    case(present_state)
        idle:z = 1'b0;
        case1:z =1'b0;
        case2:z =1'b0;
        case3:z =1'b0;
        case4:z =1'b1;
        default : z =1'b0;
    endcase
end
endmodule




