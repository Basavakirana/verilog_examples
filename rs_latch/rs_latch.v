module rs_latch(input s,r,output q,qbar);
wire nand1,nand2;
assign nand1= ~(s & qbar);
assign nand2= ~(r & nand1);
assign q = nand2;
assign qbar = nand1;
endmodule
