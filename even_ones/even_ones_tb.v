module even_ones_tb;
reg x,clk,rst;
wire z;
parameter cycle = 10;
even_ones DUT (x,clk,rst,z);

always
begin
    #(cycle/2)
    clk =1'b0 ;
#(cycle/2)
clk=1'b1;
end

task reset;
    begin
        @(posedge clk)
        rst = 1'b1;
        @(posedge clk)
        rst = 1'b0;
        end
    endtask

initial
begin
    x=0;
    clk=0;
    rst=0;
#2;
x=0;
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


