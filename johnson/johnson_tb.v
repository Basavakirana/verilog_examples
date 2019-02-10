module johnson_tb();
reg clk,rst,d;
wire[3:0]q;
parameter cycle=10;
johnson DUT (.clk(clk),.rst(rst),.d(d),.q(q));
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
    $monitor("clk=%b,rst=%b,d=%b,q=%b",clk,rst,d,q);
    clk=1'b0;
    rst=1'b0;
    d=1'b0;
    reset;
#10;
    d=1;
#10;
    d=0;
#10;
    d=1;
#10;
    d=0;
#50;
    $finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule
