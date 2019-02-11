module fifo(clk,rst,re,we,data_in,data_out,empty,full);

parameter depth=16,width=8,addr_bus_width=5;
input clk,rst,we,re;
input[width-1:0]data_in;
output reg[width-1:0]data_out;
output empty,full;

reg[width-1:0]mem[depth-1:0];
reg[addr_bus_width-1:0]read_ptr,write_ptr;
reg[addr_bus_width:0]fifo_count;
integer i;

always @(posedge clk)
begin
    if(rst)
    begin
        read_ptr <= 5'b00000;
        write_ptr <= 5'b00000;
    end
    else if(re && ~empty)
    begin
        read_ptr <= read_ptr+1'b1;
    end
    else if(we && ~full)
    begin
        write_ptr <= write_ptr+1'b1;
    end
end

always @(posedge clk)
begin
    if(rst)
    begin
        for(i=0;i<depth;i=i+1)
        begin
            mem[i] <= 8'b00000000;
            data_out <= 8'b00000000;
        end
    end
    else
    begin
        if(we && ~full)
        begin
            mem[write_ptr[3:0]] <= data_in;
            fifo_count <= fifo_count+1;
        end
        else if(re && ~empty)
        begin
            data_out <= mem[read_ptr[3:0]];
            fifo_count <= fifo_count-1;
        end
    end
$display("write_ptr=%b, read_ptr=%b, full=%b", write_ptr, read_ptr, full);

end

assign empty =(write_ptr==read_ptr)?1'b1:1'b0;
//assign full = (write_ptr=={~read_ptr[4],read_ptr[3:0]})?1'b1:1'b0;
assign full = (write_ptr[4] != read_ptr[4]) &&(write_ptr[3:0]==read_ptr[3:0]);
endmodule


        
