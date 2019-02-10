module siso_tb();
reg clk,rst,si;
wire s0;
parameter cycle = 10;
siso DUT(.clk(clk),.rst(rst),.si(si),.s0(s0));
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
    $monitor("clk=%b,rst=%b,si=%b,s0=%b",clk,rst,si,s0);
    clk=1'b0;
    rst=1'b0;
    si=1'b0;
    reset;
#10;
    si=1'b1;
#10;
    si=1'b0;
#10;
    si=1'b1;
#10;
    si=1'b0;
#50;
    $finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule
