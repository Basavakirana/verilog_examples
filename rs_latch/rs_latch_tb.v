module rs_latch_tb();
reg s,r;
wire q,qbar;
rs_latch DUT(.s(s),.r(r),.q(q),.qbar(qbar));
initial
begin
    s=1'b1;
    r=1'b1;
end

initial
begin
#10;
s=0;r=1;
#10;
s=1;r=0;
#10;
s=0;r=0;
#10;
$monitor("time=%t,s=%b,r=%b,q=%b.qbar=%b",$time,s,r,q,qbar);
$finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule
