module bin_gry #(parameter N=4)(input [N-1:0]bin_in,output [N-1:0]gray_out);
assign gray_out = bin_in ^ (bin_in>>1);
endmodule
