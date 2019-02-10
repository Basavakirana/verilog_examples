module full_adder_tb;
reg a,b,cin;
wire sum,carry;
full_adder DUT(a,b,cin,sum,carry);
integer i;
//initial
//begin
//    a=1'b0;
//    b=1'b0;
//    cin=1'b0;
//end

initial
begin
    for(i=0;i<8;i=i+1)
    begin
        {a,b,cin}=i;
    end
//end

$monitor("input a=%b,b=%b,cin=%b,output sum=%b,carry=%b",a,b,cin,sum,carry);
//#100;
$finish;

//initial
//begin
  //  a=1'b0;
    //b=1'b0;
//    cin=1'b0;
  //  a=1'b1;b=1'b0;cin=1'b1;
//#10;
  //  a=1'b0;b=1'b1;cin=1'b0;
//#10;
  //  a=1'b1;b=1'b1;cin=1'b1;
//#10;
//    a=1'b0;b=1'b0;cin=1'b0;
//$monitor("input a=%b,b=%b,cin=%b,output sum=%b,carry=%b",a,b,cin,sum,carry);
//#100;
//$finish;
end


initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule
