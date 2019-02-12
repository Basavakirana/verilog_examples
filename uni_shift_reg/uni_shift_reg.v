module uni_shift_reg(input clk,rst,input[3:0]data_in,input[2:0]sel,output reg[3:0]data_out);
always@(posedge clk or posedge rst)
begin
    if(rst)
        data_out<=4'b0;
    else
    begin
        case(sel)
    //    begin
            3'b000:data_out<=data_out;
            3'b001:data_out<=({1'b0,data_out[3:1]});//right shift
            3'b010:data_out<=({data_out[2:0],1'b0});//left/airthmetic shift
            3'b011:data_out<=data_in;//parallel load
            3'b100:data_out<=({data_out[3],data_out[3:1]});//airthmetic right
            default:data_out<=data_out;
   //     end
        endcase
        end
    end
endmodule
