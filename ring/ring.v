module ring(input clk,rst,d,output reg[3:0]q);
always@(posedge clk)
begin
    if(rst)
        q<=4'b1000;
    else
        q<=({q[0],q[3:1]});
end
endmodule
