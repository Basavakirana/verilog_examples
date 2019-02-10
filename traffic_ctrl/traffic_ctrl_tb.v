module traffic_ctrl_tb();
reg clk,rst,ta,tb;
wire la,lb;
parameter cycle =10;
traffic_ctrl DUT(clk,rst,ta,tb,la,lb);

always
begin
#(cycle/2);
clk = 1'b0;
#(cycle/2);
clk = 1'b1;
end

initial
begin
clk = 0;
rst = 1;
ta = 0;
tb = 0;
#10 rst = 0;
#20;
            $display("state: s0,l_a=%b, lb=%b",la,lb);
            ta = 1;
          #20;
             $display("State: S1, L_A=%b, L_B=%b",la, lb);
             #20;
           $display("State: S2, L_A=%b, L_B=%b", la,lb);
          tb =1;
          #20;
          $display("State: S3, L_A=%b, L_B=%b",la,lb);                                                          
          #20;
          $display("State: S0, L_A=%b, L_B=%b",la ,lb);
          $finish;
      end
      initial begin
          $monitor("Time=%0t | State: L_A=%b, L_B=%b", $time,la,lb);
      end

      initial
      begin
          $shm_open("wave.shm");
          $shm_probe("ACTMF");
      end
      endmodule
