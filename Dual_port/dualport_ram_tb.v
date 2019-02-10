module dualport_ram_tb;
parameter width = 8;
parameter depth = 16;
parameter size = 4;
reg rst,clk,we,re;
reg [width-1:0]wr_data;
reg [size-1:0]wr_addr,rd_addr;
wire [width-1:0]rd_data;
integer i;
parameter cycle =10;
dualport_ram DUT (rst,clk,we,re,wr_data,wr_addr,rd_addr,rd_data);

always
begin
#(cycle/2);
clk =0;
#(cycle/2);
clk =1;
end

task reset;
    begin
        @(posedge clk)
        rst = 1'b1;
        @(posedge clk)
        rst = 1'b0;
    end
endtask

task write(input[7:0]a,input[3:0]b,w,r);
    begin
        @(posedge clk)
        wr_data = a;
        wr_addr = b;
        we = w;
        re = r;
    end
endtask

task read(input[3:0]a,w,r);
    begin
        @(posedge clk)
        rd_addr = a;
        we = w;
        re = r;
    end
endtask

initial
begin
    clk =0;
    rst =0;
    we =0;
    re =0;
    wr_data =0;
    wr_addr =0;
    rd_addr =0;
     i =0;
  //  rd_data =0;
    reset;
    repeat(10)
    write({$random}%256,{$random}%16,1'b1,1'b0);
    repeat(10)
    read({$random}%16,1'b0,1'b1);
    $monitor("input rst=%b,we=%b,re=%b,wr_data=%b,wr_addr=%b,rd_addr=%b,output rd_data=%b",rst,we,re,wr_data,wr_addr,rd_addr,rd_data);
#100;
$finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule


