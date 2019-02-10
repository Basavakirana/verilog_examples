module jk_ff(input clk,j,k,output reg q=0,qbar=0);
parameter hold = 2'b00,
          reset = 2'b01,
          set = 2'b10,
          toggle = 2'b11;
always@(posedge clk)
begin
    case({j,k})
        hold:begin
            q<=q;
            qbar<=qbar;
        end
        reset:begin
            q<=0;
            qbar<=1;
        end
        set:begin
            q<=1;
            qbar<=0;
        end
        toggle:begin
            q<=~(q);
            qbar<=~(qbar);
        end
    endcase
end
endmodule


