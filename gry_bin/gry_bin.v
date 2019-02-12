module gry_bin#(parameter N=4)(input[N-1:0] gray_in,output [N-1:0]bin_out);
assign bin_out[N-1]=gray_in[N-1];
genvar i;
generate
    for(i=N-2;i>=0;i=i-1)
    begin
        assign bin_out[i] = bin_out[i+1]^gray_in[i];
    end
endgenerate
endmodule


