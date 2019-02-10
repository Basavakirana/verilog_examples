module mux_4_1(input i0,i1,i2,i3,s0,s1,output y);
wire w1,w2;
mux_2_1 m1(i0,i1,s0,w1);
mux_2_1 m2(i2,i3,s0,w2);
mux_2_1 m3(w1,w2,s1,y);
endmodule
