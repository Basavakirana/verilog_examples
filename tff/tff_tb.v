module tff_tb();
reg t,clk,rst;
wire q,qbar;
parameter cycle = 10;
tff DUT(.t(t),.clk(clk),.rst(rst),.q(q),.qbar(qbar));

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

task tf(input a);
    begin
        t=a;
    end
endtask

initial
begin
    $monitor("t=%b,clk=%b,rst=%b,q=%b,qbar=%b",t,clk,rst,q,qbar);
    t=1'b0;
    clk=1'b0;
    rst=1'b0;
    reset;
//    tf({$random}%2);
    t=1;
#50;
    t=0;
#100;
    $finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule


