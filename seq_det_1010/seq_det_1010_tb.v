module seq_det_1010_tb;
reg x,clk,rst;
wire z;
parameter cycle = 10;
seq_det_1010 DUT (x,clk,rst,z);

always
begin
    if(rst)
#(cycle/2);
        clk =0;
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
$monitor("input x=%b,rst=%b,output z=%b",x,rst,z);
    x=0;
    clk=0;
    rst=0;
    reset;
#20;
x=1;
#20;
x=1;
#20;
x=0;
#20;
x=1;
#20;
x=0;
#20;
x=1;
#20;
x=1;
#20;
x=0;
#20;
x=1;
#20;
x=0;

#100;
$finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule

