module alu(enable,command,operand1,operand2,data_out);
input enable;
input[3:0]command;
input[7:0]operand1,operand2;
output[15:0]data_out;
reg[15:0]temp;
parameter   add=4'b0000;
parameter            inc=4'd1;
parameter            sub=4'd2;
parameter            dec=4'd3;
parameter            mul=4'd4;
parameter            div=4'd5;
parameter            shl=4'd6;
parameter            shr=4'd7;
parameter            not=4'd8;
parameter            and=4'd9;
parameter            nand=4'd10;
parameter            or=4'd11;
parameter            nor=4'd12;
parameter            xor=4'd13;
parameter            xnor=4'd14;
parameter            buf=4'd15;

            always@(*)
            begin
                case(command)
                    add:temp=operand1+operand+2;
                    inc:temp=operand1+1;
                    sub:temp=operand1-operand-2;
                    dec:temp=operand-1;
                    mul:temp=opearand1*operand2;
                    div:temp=operand1/operand2;
                    shl:temp=operand1<<3;
                    shr:temp=operand1>>3;
                    not:temp=~operand1;
                    and:temp=operand1&operand2;
                    nand:temp=~(operand1&operand2);
                    or:temp=operand1|operand2;
                    nor:temp=~(operand1|operand2);
                    xor:temp=operand1^operand2;
                    xnor:temp=~(operand1^operand2);
                    buf:temp=operand1;
                endcase
            end
assign data_out = (enable)?temp:16'dz;
endmodule
