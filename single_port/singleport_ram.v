module singleport_ram(clk,addr,data_in,we,data_out);
parameter width = 8;
parameter depth = 16;
parameter size = 4;
input clk,we;
input[size-1:0]addr;
input[width-1:0]data_in;
output reg [width-1:0] data_out =0;
reg[width-1:0]mem[depth-1:0];

    always@(posedge clk)
    begin
        if(we)
            mem[addr] <= data_in;
        else
            data_out <= mem[addr];
    end
endmodule


