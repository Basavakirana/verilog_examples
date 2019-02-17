//signals = wdata,winc,wclk,wrst,full,rdata,rinc,rclk,rrst,empty

module asynch_fifo_top #(parameter asize=4,parameter dsize=8)
                        (input wclk,wrst,winc,rclk,rrst,rinc,input[dsize-1:0]wdata,output full,empty,output[dsize-1:0]rdata);

                        wire[asize-1:0]waddr,raddr;
                        wire[asize:0]wr_ptr,rd_ptr,rq_wptr,wq_rptr;

                        fifo_memory #(dsize,asize) fifo_mem
                        (.wdata(wdata),.wclk(wclk),.wclk_en(winc),.full(full),.waddr(waddr),.rdata(rdata),.raddr(raddr));

                        two_f_synch #(asize+1) synch_wq_rptr
                        (.clk(wclk),.rst(wrst),.din(rd_ptr),.q2(wq_rptr));

                        two_f_synch #(asize+1) synch_rq_wptr
                        (.clk(rclk),.rst(rrst),.din(wr_ptr),.q2(rq_wptr));

                        rd_ptr_empty #(asize) rdptr_empty
                        (.rclk(rclk),.rrst(rrst),.rinc(rinc),.rd_ptr(rd_ptr),.raddr(raddr),.empty(empty),.rq_wptr(rq_wptr));

                        wr_ptr_full #(asize) wrptr_empty
                        (.wclk(wclk),.wrst(wrst),.winc(winc),.wr_ptr(wr_ptr),.waddr(waddr),.full(full),.wq_rptr(wq_rptr));

endmodule
