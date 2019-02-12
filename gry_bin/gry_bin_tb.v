module gry_bin_tb();
parameter N =4;
reg[N-1:0]gray_in;
wire[N-1:0]bin_out;
integer i;
gry_bin DUT(.gray_in(gray_in),.bin_out(bin_out));

initial
begin
    $monitor("gray_in=%b,bin_out=%b",gray_in,bin_out);
    for(i=0;i<16;i=i+1)
        gray_in = i ^ (i>>1);
#100;
    $finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule
