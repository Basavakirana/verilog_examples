module mux_4_1_tb();
reg i0,i1,i2,i3;
reg [1:0]s;
wire out;
mux_4_1 DUT (.i0(i0),.i1(i1),.i2(i2),.i3(i3),.s(s),.out(out));
initial
begin
    i0=0;
    i1=0;
    i2=0;
    i3=0;
    s[1]=0;
    s[0]=0;
#5;
    i0=1;
    i1=0;
    s[1]=0;
    i2=1;
    i3=0;
    s[0]=0;
#5;
    $monitor("i0=%b,i1=%b,i2=%b,i3=%b,s=%b,out=%b",i0,i1,i2,i3,s,out);
    $finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
    end
    endmodule
