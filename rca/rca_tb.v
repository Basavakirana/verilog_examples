module rca_tb();
reg [3:0]a,b;
reg cin;
wire [3:0]sum;
wire carry_out;
rca DUT (.a(a),.b(b),.cin(cin),.sum(sum),.carry_out(carry_out));
initial
begin
    cin=1'b0;
    a=4'b0000;
    b=4'b0000;
#5;
    cin=1'b1;
    a=4'b0101;
    b=4'b1010;
#5;
    cin=4'b0;
    a=4'b0000;
    b=4'b1111;
#5;
    $monitor("cin=%b,a=%b,b=%b,carry_out=%b",cin,a,b,carry_out);
    $finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule
    
