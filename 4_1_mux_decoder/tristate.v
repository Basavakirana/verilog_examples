module tristate(input in,y,output reg b);
always@(*)
begin
    if(y)
        b=in;
    else
        b=1'bz;
end
endmodule

