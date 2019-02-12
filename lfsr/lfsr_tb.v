module lfsr_tb();
reg clk,rst;
wire[7:0]out;
parameter cycle =10;
lfsr DUT(.clk(clk),.rst(rst),.out(out));
always
begin
#(cycle/2);
clk=1'b0;
#(cycle/2);
clk=1'b1;
end

task reset;
    begin
        @(posedge clk);
        rst=1'b1;
        @(posedge clk);
        rst=1'b0;
    end
endtask

initial
begin
    $monitor("clk=%b,rst=%b,out=%b",clk,rst,out);
    clk=1'b0;
    rst=1'b0;
    reset;
#100;
    $finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule
