module rca(input[3:0] a,b,cin,output[3:0] sum,output carry_out);
wire w1,w2,w3;
full_adder fa0(a[0],b[0],cin,w1,sum[0]);
full_adder fa1(a[1],b[1],w1,sum[1],w2);
full_adder fa2(a[2],b[2],w2,sum[2],w3);
full_adder fa3(a[3],b[3],w3,sum[3],carry_out);
endmodule

