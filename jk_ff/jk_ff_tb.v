module jk_ff_tb();
reg clk,j,k;
wire q ,qbar;
parameter cycle=10;
jk_ff DUT(.clk(clk),.j(j),.k(k),.q(q),.qbar(qbar));
always
begin
#(cycle/2);
    clk=1'b0;
#(cycle/2);
    clk=1'b1;
end

task jkf(input a,b);
    begin
        @(posedge clk);
        j=a;
        k=b;
    end
endtask

initial
begin
    $monitor("clk=%b,j=%b,k=%b,q=%b,qbar=%b",clk,j,k,q,qbar);
    clk=1'b0;
    j=1'b0;
    k=1'b0;
    repeat(4)
    begin
    jkf({$random}%2,{$random}%2);
    end
    #100;
    $finish;
end

initial
begin
    $shm_open("wave.shm");
    $shm_probe("ACTMF");
end
endmodule


