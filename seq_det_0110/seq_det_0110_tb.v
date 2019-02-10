module seq_det_0110_tb;
reg x,clk,rst;
wire z;
parameter cycle = 10;
seq_det_0110 DUT (x,clk,rst,z);

always
begin
#(cycle/2);
clk = 0;
#(cycle/2);
clk = 1;
end

task reset;
    begin
        @(posedge clk)
        rst = 1;
        @(posedge clk)
        rst = 0;
    end
endtask

initial
begin
$monitor("time=%t,clk = %d,input x=%b,rst=%b,output z=%b",$time,clk,x,rst,z);
    x=0;
    clk=0;
    rst=0;
    reset;
#10;
x=0;
#10;
x=1;
#10;
x=1;
#10;
x=0;
/*#10;
x=0;
#10;
x=0;
#10;
x=0;
#10;
x=1;*/
#10;
$finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule
