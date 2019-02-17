//signals = q2,rst,clk,din

module two_f_synch #(parameter size=4)(input clk,rst,input[size-1:0]din,output reg[size-1:0]q2);

    reg[size-1:0]q1;

    always@(posedge clk or posedge rst)
    begin
        if(rst)
            {q2,q1} <= 0;
        else
            {q2,q1} <= {q1,din};
    end
    
endmodule
