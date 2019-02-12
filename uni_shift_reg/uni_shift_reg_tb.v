module uni_shift_reg_tb();
reg clk,rst;
reg[2:0]sel;
reg[3:0]data_in;
wire[3:0]data_out;
parameter cycle=10;
uni_shift_reg DUT(.clk(clk),.rst(rst),.sel(sel),.data_in(data_in),.data_out(data_out));
always begin
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
    $monitor("time=%t,rst=%b,sel=%b,data_in=%b,data_out=%b",$time,rst,sel,data_in,data_out);
    clk=1'b0;
    sel=3'b0;
    data_in=4'b0;
    reset;
    #5;
    sel=3'b011;
    data_in=1101;
#10;
    sel=3'b001;
#10;
    sel=3'b010;
#10;
    sel=3'b100;
#10;
    sel=3'b000;
#50;
    $finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule
