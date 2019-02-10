module pri_enco(input[7:0]i,output [2:0]y,output idle);
wire[7:0]h;
pri_ckt p1(i,h,idle);
bin_enco b1(h,y);
endmodule
