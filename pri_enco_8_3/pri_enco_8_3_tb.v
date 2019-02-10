module pri_enco_tb();
reg[7:0]i;
wire[2:0]y;
wire idle;
integer k;
pri_enco DUT(.i(i),.y(y),.idle(idle));
initial
begin
    for(k=0;k<256;k=k+1)
    begin
        i=k;
        #10;
    end
    $monitor("i=%b,y=%b,idle=%b",i,y,idle);
    $finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule

