module dualport_ram (rst,clk,we,re,wr_data,wr_addr,rd_addr,rd_data);
parameter width = 8;
parameter depth = 16;
parameter size = 4;
input rst,clk,we,re;
input[width-1:0]wr_data;
input[size-1:0]wr_addr,rd_addr;
output reg [width-1:0]rd_data =0;
reg [width-1:0] mem [depth-1:0];
integer i =0;

    always@(posedge clk)
    begin
        if(rst)
        begin
            rd_data <= 0;
            for(i=0;i<=depth;i=i+1)
                mem[i] <= 0;
                rd_data <= 0;
        end
        else
        begin
            if(we)
                mem[wr_addr] <= wr_data;
            if(re)
                rd_data <= mem[rd_addr];
        end
    end
endmodule



