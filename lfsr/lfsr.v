module lfsr(input clk,rst,output reg[7:0]out=0);
wire feedback;
assign feedback = out[7]^out[5]^out[4]^out[3];
always@(posedge clk)
begin
    if(rst)
        out<=8'b00000001;
    else
        out<=({out[6:0],feedback});
end
endmodule
