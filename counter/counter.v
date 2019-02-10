module counter(rst,clk,load,up_down,data,count);
input rst,clk,load,up_down;
input [3:0]data;
output reg [3:0]count=0;
always@(posedge clk)
begin
    if(rst)
        count<=0;
    else if(load)
        count<=data;
    else if(up_down)
        count<=count+1;
    else
        count<=count-1;
end
endmodule

