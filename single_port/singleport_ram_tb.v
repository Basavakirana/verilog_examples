module singleport_ram_tb;
parameter width = 8;
parameter depth = 16;
parameter size = 4;
reg clk,we;
reg [width-1:0]data_in;
reg [size-1:0]addr;
wire [width-1:0]data_out;
parameter cycle = 10;
singleport_ram DUT(clk,we,data_in,addr,data_out);

always
begin
#(cycle/2);
clk = 0;
#(cycle/2);
clk = 1;
end

task write_read (input[7:0]a,input[3:0]b,w);
    begin
        @(posedge clk)
        data_in = a;
        addr = b;
        we = w;
    end
endtask

initial
begin
    clk =0;
    we =0;
    data_in =0;
    addr =0;
 //   data_out =0;
    repeat(10)
    write_read({$random}%256,{$random}%16,1'b1);
    repeat(10)
    write_read({$random}%256,{$random}%16,1'b0);
    $monitor("input we=%b,data_in=%b,addr=%b,output data_out=%b",we,data_in,addr,data_out);
#100;
$finish;
end

initial 
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule

