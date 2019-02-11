module fifo_tb();
parameter depth=16,width=8,addr_bus_width=5;
reg clk,rst,re,we;
reg[width-1:0]data_in;
wire[width-1:0]data_out;
wire full,empty;
parameter cycle=10;
fifo #(.depth(depth),.width(width),.addr_bus_width(addr_bus_width))DUT(.clk(clk),.rst(rst),.we(we),.re(re),.data_in(data_in),.data_out(data_out),.full(full),.empty(empty));
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
    clk=1'b0;
    re=1'b0;
    we=1'b0;
    data_in=0;
//    rst=1'b0;
    reset;

    $display("\ntestcase 1 filling fifo");
    repeat(16)
    begin
        @(posedge clk);
        if(~full)
        begin
            we=1'b1;
            data_in=data_in+1;
            $display("writing into fifo=%d",data_in);
        end
    end
    we=1'b0;
    @(posedge clk);

    $display("\ntestcase 2 trying write into fifo when full");
    repeat(2)
    begin
        @(posedge clk);
        we=1'b1;
        data_in=data_in+1;
        $display("attempting write=%d,full=%b",data_in,full);
    end
    we=1'b0;
    @(posedge clk);

    $display("\ntestcase 3 readata_ing from fifo");
    repeat(16)
    begin
        @(posedge clk);
        if(~empty)
        begin
            re=1'b1;
            $display("readata_ing from fifo=%d",data_out);
        end
    end
    re=1'b0;
    @(posedge clk);

    $display("\ntestcase 4 readata_ing from empty fifo");
    repeat(2)
    begin
        @(posedge clk);
        re=1'b1;
        $display("attempting read=%d,empty=%b",data_out,empty);
    end
    re=1'b0;
    @(posedge clk);

    $display("\ntestcase 5 simultaneous write and read");
    repeat(8)
    begin
        @(posedge clk);
        we=1'b1;
        re=1'b1;
        data_in=data_in+1;
        $display("write fifo=%d,read fifo=%d",data_in,data_out);
    end
    we=1'b0;
    re=1'b0;
    @(posedge clk);

    $display("\ntestcase 6 fifo wrap around");
    repeat(8)
    begin
        @(posedge clk);
        we=1'b1;
        data_in=data_in+1;
        $display("write=%d",data_in);
    end
    we=1'b0;
    repeat(8)
    begin
        @(posedge clk);
        re=1'b1;
        $display("read=%d",data_out);
    end
    re=1'b0;
    @(posedge clk);

    $display("all tests completed");
    #50;
    $finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule





