module piso(input clk,rst,mode,input[3:0]d,output s0);
reg[3:0]q=0;
always@(posedge clk)
begin
    if(mode)
        q<=d;
    else
        q[3]<=d[3];
        q[2]<=q[3];
        q[1]<=q[2];
        q[0]<=q[1];
end
assign s0 = q[0];
endmodule

