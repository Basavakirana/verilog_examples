module sipo_tb();
reg si,clk,rst;
wire[3:0]q;
parameter cycle=10;
sipo DUT (.clk(clk),.rst(rst),.si(si),.q(q));
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
    $monitor("clk=%b,rst=%b,si=%b,q=%b",clk,rst,si,q);
    clk=1'b0;
    rst=1'b0;
    si=1'b0;
    reset;
#50;
    si=1'b1;
#5;
    si=1'b0;
#5;
    si=1'b0;
#5;
    si=1'b1;
#50;
    $finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule


