module piso_tb();
reg clk,rst,mode;
reg[3:0]d;
wire s0;
parameter cycle = 10;
piso DUT (.clk(clk),.rst(rst),.mode(mode),.d(d),.s0(s0));
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
    $monitor("clk=%b,rst=%b,mode=%b,d=%b,s0=%b",clk,rst,mode,d,s0);
    clk=1'b0;
    rst=1'b0;
    mode=1'b0;
    d=4'b000;
    reset;
#10;
    mode=1;
#10;
    d=4'b1010;
#10;
    mode=0;
#50;
    $finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule
