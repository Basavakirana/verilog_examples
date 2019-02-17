//signals = wdata,wclk,wclk_en,waddr,full,raddr,rdata

module fifo_memory #(parameter dsize=8,parameter addr_size=4)
                    (input wclk,wclk_en,full,input[dsize-1:0]wdata,input[addr_size-1:0]waddr,raddr,output[dsize-1:0]rdata);

                    localparam depth = 1<<addr_size;
                    reg[dsize-1:0]mem[depth-1:0];

                    assign rdata = mem[raddr];

                    always@(posedge wclk)
                        if(wclk_en && !full)
                            begin
                                mem[waddr] <= wdata;
                            end

endmodule
