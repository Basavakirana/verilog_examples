module decoder_2_4_tb();
reg[1:0]in;
wire[3:0]out;
decoder_2_4 DUT (.in(in),.out(out));
initial
begin
    in=2'b00;
#5;
    in=2'b01;
#5;
    in=2'b10;
#5;
    in=2'b11;
#5;
    $monitor("in=%b,out=%b",in,out);
    $finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule

