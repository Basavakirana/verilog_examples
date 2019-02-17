module dual_edge(input clk,rst,signal,output reg q=0);
reg signal_current=0;
reg signal_previous=0;
always@(posedge clk or posedge rst)
begin
    if(rst)begin
        signal_previous <= 1'b0;
        signal_current <= 1'b0;
        q <= 1'b0; end
        else begin
        signal_current <= signal;
        signal_previous <= signal_current;
        q <= signal_current ^ signal_previous;
end
end


endmodule
