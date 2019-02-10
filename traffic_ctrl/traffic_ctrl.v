module traffic_ctrl(clk,rst,ta,tb,la,lb);
input clk,rst,ta,tb;
output reg [1:0]la,lb;

parameter s0 = 2'b00,
          s1 = 2'b01,
          s2 = 2'b10,
          s3 = 2'b11;

reg[1:0]present_state,next_state;

always@(posedge clk)
begin
    if(rst)
        present_state <= s0;
    else
        present_state <= next_state;
end

always@(*)
begin
    present_state = s0;
    case(present_state)
        s0:begin
            if(ta==1)
                next_state =s0;
            else
                next_state = s1;
        end

        s1:next_state = s2;

        s2:begin
            if(tb==1)
                next_state = s2;
            else
                next_state = s3;
        end

        s3:next_state = s0;

        default:next_state = s0;
    endcase
end

always@(present_state)
begin
    case(present_state)
        s0:begin
            la = 2'b10;
            lb = 2'b00;
        end

        s1:begin
            la = 2'b01;
            lb = 2'b00;
        end

        s2:begin
            la = 2'b00;
            lb = 2'b10;
        end

        s3:begin
            la = 2'b00;
            lb = 2'b01;
        end
    endcase
end
endmodule

