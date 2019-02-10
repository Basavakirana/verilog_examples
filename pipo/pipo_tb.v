module pipo_tb();
reg clk,rst;
reg[3:0]d;
wire[3:0] q;
parameter cycle=10;
pipo DUT(.clk(clk),.rst(rst),.d(d),.q(q));
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

//task io(input a);
//    begin
//        d=a;
//    end
//endtask

initial
begin
    $monitor("clk=%b,rst=%b,d=%b,q=%b",clk,rst,d,q);
    clk=1'b0;
    rst=1'b0;
    d=3'b000;
    reset;
//    io({$random}%16);
     #50;
     d=4'b1001;
#100;
$finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule

