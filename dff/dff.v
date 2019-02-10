module dff(rst,clk,d,q,qbar);
input rst,clk,d;
output reg q;
output qbar;
always@(posedge clk)
begin
    if(rst)
        q<=1'b0;
    else
        q<=d;
end
assign qbar = ~q;
endmodule
