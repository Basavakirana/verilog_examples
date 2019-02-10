module sr_ff_tb();
reg s,r,clk;
wire q,qbar;
parameter cycle=10;
sr_ff DUT(.s(s),.r(r),.clk(clk),.q(q),.qbar(qbar));

always
begin
#(cycle/2);
    clk=1'b0;
#(cycle/2);
    clk=1'b1;
end

task srf(input a,b);
    begin
        @(posedge clk)
        s=a;
        r=b;
    end
endtask

initial
begin
    $monitor("clk=%b,s=%b,r=%b,q=%b,qbar=%b",clk,s,r,q,qbar);
    clk=1'b0;
    s=1'b0;
    r=1'b0;
    repeat(4)
    srf({$random}%2,{$random}%2);
#100;
    $finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule
