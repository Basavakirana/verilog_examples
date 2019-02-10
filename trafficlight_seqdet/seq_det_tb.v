module seq_det_tb;
reg clk,rst;
wire z;
parameter cycle = 10;
seq_det DUT(clk,rst,z);

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
        rst=1;
        @(posedge clk)
        rst =0;
    end
endtask

initial
begin
    clk=0;
    rst=0;
    reset;
#20;
reset;
$monitor("input rst=%b,output z=%b",rst,z);
#100;
$finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule
       
