module freq_div_6_tb();
reg clk,rst;
wire clk_out;
parameter cycle = 10;
freq_div_6 DUT(.clk(clk),.rst(rst),.clk_out(clk_out));
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
    $monitor("time=%t,clk=%b,rst=%b,clk_out=%b",$time,clk,rst,clk_out);
    clk=1'b0;
    //rst=1'b0;
    reset;
#120;
    $finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule
