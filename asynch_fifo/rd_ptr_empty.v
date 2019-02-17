//signals = raddr,rinc,rclk,rrst,rd_ptr,rq_wptr,empty
module rd_ptr_empty #(parameter addr_size =4)
      (input rclk,rrst,rinc,input[addr_size:0]rq_wptr,output reg empty,output reg[addr_size:0]rd_ptr,output[addr_size-1:0]raddr);

      reg[addr_size:0]rd_ptr_bin;
      wire[addr_size:0]rd_ptr_bin_next,rd_ptr_gray_next;
      wire empty_val;

      always@(posedge rclk or posedge rrst)
      begin
          if(rrst)
   //     begin
              {rd_ptr_bin,rd_ptr} <= 0;
          else
              {rd_ptr_bin,rd_ptr} <= {rd_ptr_bin_next,rd_ptr_gray_next};
   //      end
      end

      assign raddr = rd_ptr_bin[addr_size-1:0];
      assign rd_ptr_bin_next = rd_ptr_bin + (rinc & ~empty);
      assign rd_ptr_gray_next = (rd_ptr_bin_next>>1)^(rd_ptr_bin_next);
      assign empty_val = (rd_ptr_gray_next == rq_wptr);

      always@(posedge rclk or posedge rrst)
      begin
          if(rrst)
              empty <= 0;
          else
              empty <= empty_val;
      end
endmodule

