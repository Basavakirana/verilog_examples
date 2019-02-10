module pipo(input[3:0]d,input clk,rst,output reg[3:0]q=0);
always@(posedge clk)
begin
    q[3]<=d[3];
    q[2]<=d[2];
    q[1]<=d[1];
    q[0]<=d[0];
end
endmodule
