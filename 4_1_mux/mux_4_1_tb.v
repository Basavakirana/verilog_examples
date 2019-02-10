module mux_4_1_tb();
reg i0,i1,i2,i3;
reg s0,s1;
wire y;
mux_4_1 DUT (.i0(i0),.i1(i1),.i2(i2),.i3(i3),.s0(s0),.s1(s1),.y(y));
initial
begin
    i0=0;
    i1=0;
    i2=0;
    i3=0;
    s0=0;
    s1=0;
#5;
    i0=1;
    i1=0;
    s0=0;
    i2=1;
    i3=0;
    s1=0;
#5;
    $monitor("i0=%b,i1=%b,i2=%b,i3=%b,s0=%b,s1=%b,y=%b",i0,i1,i2,i3,s0,s1,y);
    $finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
    end
    endmodule
