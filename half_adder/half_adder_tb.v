module half_adder_tb;
reg a,b;
wire sum,carry;
half_adder DUT(a,b,sum,carry);
integer i;

//initial
//begin
//    a = 1'b0;
//    b = 1'b0;
//end

initial
begin
    for(i=0;i<4;i=i+1)
    begin
        {a,b}=i;
#10;
end
//initial
//begin
//    a=1'b0;
//    b=1'b0;
  //  sum=1'b0;
//    carry=1'b0;
//    a=1'b0;b=1'b1;
//#50;
//    a=1'b1;b=1'b1;
//#50;
//    a=1'b1;b=1'b0;
$monitor("input a=%b,b=%b,output sum=%b,carry=%b",a,b,sum,carry);
//#100;
$finish;
end


initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule
