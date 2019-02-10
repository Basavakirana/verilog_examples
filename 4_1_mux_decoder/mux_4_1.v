module mux_4_1(input i0,i1,i2,i3,input[1:0]s,output out);
wire[3:0]y;
wire[3:0]b;
decoder d1(s,y);
tristate t0(i0,y[0],b[0]);
tristate t1(i1,y[1],b[1]);
tristate t2(i2,y[2],b[2]);
tristate t3(i3,y[3],b[3]);
assign out=b[0]|b[1]|b[2]|b[3];
endmodule
