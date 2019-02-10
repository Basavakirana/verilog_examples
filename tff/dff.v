module dff(input d,clk,rst,output reg q=0,output qbar);
always@(posedge clk)
begin
    if(rst)
        q<=1'b0;
    else
        q<=d;
end
assign qbar=~q;
endmodule
