module asynch_fifo_tb();
parameter dsize = 8;
parameter asize = 4;
parameter depth = 1 << asize;
reg wclk,winc,wrst,rclk,rinc,rrst;
reg[dsize-1:0]wdata;
wire full,empty;
wire[dsize-1:0]rdata;
parameter cycle1 = 10;
parameter cycle2 = 20;
asynch_fifo_top #(asize,dsize)DUT(.wclk(wclk),.winc(winc),.wrst(wrst),.rclk(rclk),.rrst(rrst),.rinc(rinc),.wdata(wdata)
                                    ,.full(full),.empty(empty),.rdata(rdata));

always
begin
#(cycle1/2);
wclk = 1'b0;
#(cycle2/2);
wclk = 1'b1;
end

always
begin
#(cycle2/2);
rclk = 1'b0;
#(cycle2/2);
rclk=1'b1;
end

task reset;
    begin
        @(posedge wclk or posedge wrst or posedge rclk or posedge rrst);
        wrst = 1'b1;
        rrst = 1'b1;
        @(posedge wclk or posedge wrst or posedge rclk or posedge rrst);
        wrst = 1'b0;
        rrst = 1'b0;
    end
endtask

initial
begin
    wclk=1'b0;
    winc=1'b0;
    wrst=1'b0;
    rclk=1'b0;
    rinc=1'b0;
    rrst=1'b0;
    wdata=1'b0;
    reset;

    $display("\ntestcase 1 writing into fifo");
    repeat(18)
    begin
        @(posedge wclk);
   //     if(~full)
        begin
            wdata=wdata+1;
            winc=~full;
            $display("data in to the fifo =%d",wdata);
        end
    end
    winc=1'b0;
    @(posedge wclk);

    $display("\n testcase 2 trying into fifo when fifo is full");
    repeat(2)
    begin
        @(posedge wclk);
        wdata=wdata+1;
        winc=~full;
        $display("attempting write=%d,full=%b",wdata,full);
    end
    winc=1'b0;
    @(posedge wclk);

    $display("\ntestcase 3 reading from fifo");
    repeat(18)
    begin
        @(posedge rclk);
        if(~empty)
        begin
            rinc=1'b1;
            $display("reading from fifo=%d",rdata);
        end
    end
    rinc=1'b0;
    @(posedge rclk);

    $display("\ntestcase 4 reading from empty fifo");
    repeat(2)
    begin
        @(posedge rclk);
        rinc=1'b1;
        $display("reading from empty fifo=%d,empty=%b",rdata,empty);
    end
    rinc=1'b0;
    @(posedge rclk);

    $display("all tests are completed");
#50;
    $finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule



