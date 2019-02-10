module counter_tb;
reg clk,rst,load,up_down;
reg[3:0] data;
wire [3:0] count;
parameter cycle = 10;
parameter cycle2 = 130;
integer i =1;
counter DUT(.clk(clk),.rst(rst),.load(load),.up_down(up_down),.data(data),.count(count));
always
begin
#(cycle/2);
clk = 1'b0;
#(cycle/2);
clk = 1'b1;
end

task rst_t;
    begin
        @(posedge clk)
        rst = 1'b1;
        @(posedge clk)
        rst = 1'b0;
    end
endtask

task load_t(input i,input[3:0]d);
    begin
        @(posedge clk)
        load =i;
        data = d;
    end
endtask

always

    begin
        #(cycle2/2);
        up_down =1;
        #(cycle2/2);
        up_down =0;
    end

initial
begin
    clk=0;
    rst =0;
    load=0;
    up_down=0;
    data=0;
   // count=0;
    rst_t;
    #100;
 //   up_down_t;
 //   #100;
    load_t(1'b1,4'd10);#20;
    load_t(1'b0,4'd5);#20;
    load_t(1'b0,4'd9);#20;
    load_t(1'b1,4'd12);
    $monitor("input rst=%b,load=%b,up_down=%b,data=%b,output count=%b",rst,load,up_down,data,count);
    #100;
    $finish;

end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule

    
