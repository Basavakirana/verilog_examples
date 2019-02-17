module dual_edge_tb();
reg clk,rst,signal;
wire q;
parameter cycle=10;
dual_edge DUT(.clk(clk),.rst(rst),.signal(signal),.q(q));
always
begin
#(cycle/2);
clk=1'b0;
#(cycle/2);
clk=1'b1;
end

task reset;
    begin
        @(posedge clk or posedge rst);
        rst=1'b1;
        @(posedge clk or posedge rst);
        rst=1'b0;
    end
endtask

initial
begin
    $monitor("time=%t,rst=%d,signal=%d,q=%d",$time,rst,signal,q);
    clk=1'b0;
    rst=1'b0;
    signal=1'b0;
    reset;
#5;
    signal=1'b1;
#5;
    signal=1'b0;
#5;
    signal=1'b1;
#5;
    signal=1'b1;
#50;
    $finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule

