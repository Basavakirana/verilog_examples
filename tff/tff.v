module tff(input t,clk,rst,output q,qbar);
wire out1,out2;
assign out1 = t^out2;
dff d1(out1,clk,rst,q,qbar);
assign q = out2;
//assign qbar = ~q;
endmodule
