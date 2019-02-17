module rising(input clk,rst,signal,output q);
reg signal_delay=0;
always@(posedge clk or posedge rst)
begin
    if(rst)
        signal_delay <= 1'b0;
    else
        signal_delay <= signal;
end

assign q = signal && ~signal_delay;

endmodule


