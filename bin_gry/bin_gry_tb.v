module bin_gry_tb();
parameter N=4;
reg[N-1:0]bin_in;
wire[N-1:0]gray_out;
integer i;
bin_gry DUT(.bin_in(bin_in),.gray_out(gray_out));

initial
begin
    $monitor("time=%t,bin_in=%b,gray_out=%b",$time,bin_in,gray_out);
    for(i=0;i<16;i=i+1)
        bin_in = i;
#100;
$finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule
