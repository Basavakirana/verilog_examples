module counter5(rst,clk,load,data_in,count);
input rst,clk,load;
input [4:0]data_in;
output reg [4:0] count;

always@(posedge clk)
begin
    if(rst)
        count<=1'b0;
    else if(load)
        count<=data_in;
    else
        count<=count+1;
end
endmodule
