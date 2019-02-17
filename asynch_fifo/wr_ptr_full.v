//signals = waddr,winc,wclk,wrst,full,wr_ptr,wq_rptr
module wr_ptr_full #(parameter addr_size=4)
    (input winc,wclk,wrst,input[addr_size:0]wq_rptr,output reg full,output reg[addr_size:0]wr_ptr,output[addr_size-1:0]waddr);

    reg[addr_size:0]wr_ptr_bin;
    wire[addr_size:0]wr_ptr_bin_next,wr_ptr_gray_next;
    wire full_val;

    always@(posedge wclk or posedge wrst)
    begin
        if(wrst)
            {wr_ptr_bin,wr_ptr} <= 0;
        else
            {wr_ptr_bin,wr_ptr} <= {wr_ptr_bin_next,wr_ptr_gray_next};
    end

    assign waddr = wr_ptr_bin[addr_size-1:0];
    assign wr_ptr_bin_next = wr_ptr_bin + (winc & ~full);
    assign wr_ptr_gray_next = (wr_ptr_bin_next>>1)^(wr_ptr_bin_next);
    assign full_val = (wr_ptr_gray_next=={~wq_rptr[addr_size:addr_size-1],wq_rptr[addr_size-2:0]});
    
always@(wr_ptr_bin or wr_ptr_bin_next)
begin
    $display("Time %0t: Write pointer binary: %d -> %d (increment: %d)", 
             $time, wr_ptr_bin, wr_ptr_bin_next, wr_ptr_bin_next - wr_ptr_bin);
    $display("Time %0t: Write pointer gray code: %b -> %b", 
             $time, wr_ptr, wr_ptr_gray_next);
    if(winc && !full)
        $display("Time %0t: Write pointer INCREMENTED - write enabled and not full", $time);
    else if(full)
        $display("Time %0t: Write pointer NOT incremented - buffer FULL", $time);
    else if(!winc)
        $display("Time %0t: Write pointer NOT incremented - write not enabled", $time);
end

always@(posedge wclk or posedge wrst)
    begin
        if(wrst)
            full <= 0;
        else
            full <= full_val;
    end

endmodule
