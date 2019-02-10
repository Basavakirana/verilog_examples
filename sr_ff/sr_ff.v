module sr_ff(input s,r,clk,output reg q=0,qbar=0);
parameter hold=2'b00,
          reset=2'b01,
          set=2'b10,
          invalid=2'b11;
always@(posedge clk)
begin
    case({s,r})
        hold:begin
            q<=q;
            qbar<=qbar;
        end
        reset:begin
            q<=1'b0;
            qbar<=1'b1;
        end
        set:begin
            q<=1'b1;
            qbar<=1'b0;
        end
        invalid:begin
            q<=1'bx;
            qbar<=1'bx;
        end
        default:begin
            q<=1'b0;
            qbar<=1'b0;
        end
    endcase
end
endmodule
