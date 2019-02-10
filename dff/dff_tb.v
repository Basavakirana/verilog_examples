module dff_tb;
reg clk,rst,d;
wire q,qbar;
parameter cycle = 10;
dff DUT (clk,rst,d,q,qbar);

always
begin
#(cycle/2);
clk =1'b0;
#(cycle/2);
clk=1'b1;
end

task reset;
    begin
        @(posedge clk);
        rst =1'b1;
        @(posedge clk);
        rst =1'b0;
    end
endtask

task ff(input a);
    begin
        @(posedge clk);
        d =a;
    end
endtask

initial
begin
    clk=0;
    rst=0;
    d=0;
    reset;
    ff(1'b1);
#20;
    ff(1'b0);
    $monitor("input rst=%b,d=%b,output q=%b,qbar=%b",rst,d,q,qbar);
#100;
$finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule

