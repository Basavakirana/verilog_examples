module even_ones(x,clk,rst,z);
input x,clk,rst;
output reg z;
parameter even = 2'h1;
parameter          odd = 2'h2;
reg[1:0]present_state,next_state;

always@(posedge clk)
    begin
        if(rst)
            present_state<=even;
        else
            present_state<=next_state;
    end

    always@(*)
    begin
        present_state = even;
        case(present_state)
            even : begin
                    if(x==1)
                        next_state = odd;
                    else
                        next_state = even;
                end
            odd : begin
                    if(x==1)
                        next_state = even;
                    else
                        next_state = odd;
                end
                default : next_state = even;
            endcase
        end

        always@(present_state)
    begin
        case(present_state)
            even:z = 1;
            odd:z = 0;
            default:z = 0;
        endcase
    end
    endmodule



