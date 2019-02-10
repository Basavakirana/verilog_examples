module seq_det_111_tb;
reg x,clk,rst;
wire z;
parameter cycle =10;
seq_det_111 DUT (x,clk,rst,z);

always
begin
#(cycle/2)
clk=0;
#(cycle/2)
clk=1;
end

task reset;
    begin
        @(posedge clk)
        rst = 1;
        @(posedge clk)
        rst =0;
    end
endtask

initial
begin
    x=0;
    clk=0;
    rst=0;
#2;
x=1;
#2
x=0;
#2;
x=1;
#2;
x=1;
#2;
x=1;
#2;
x=0;
#2;
x=1;
#2;
x=1;
#2;
x=1;
#2;
x=0;
$monitor("input x=%b,rst=%b,output z=%b",x,rst,z);
#10;
$finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule
