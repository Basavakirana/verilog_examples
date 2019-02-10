module decoder_3_8_tb();
reg[2:0]i;
wire[7:0]y;
decoder_3_8 DUT(.i(i),.y(y));
initial
begin
    i=3'b000;
end

initial
begin    
    i=3'b000;
#5;
    i=3'b001;
#5;
    i=3'b010;
#5;
    i=3'b011;
#5;
    i=3'b100;
#5;
    i=3'b101;
#5;
    i=3'b110;
#5;
    i=3'b111;
#5;
    $monitor("i=%b,y=%b",i,y);
    $finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule
