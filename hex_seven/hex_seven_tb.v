module hex_seven_tb();

    reg[3:0]hex_in;
    reg dp_in;
    wire[7:0]seg_out;
    integer i;
    hex_seven DUT (
        .hex_in(hex_in),
        .dp_in(dp_in),
        .seg_out(seg_out)
    );

    initial begin
        $display("Hex\tDP\t7-Segment (dp,g,f,e,d,c,b,a)");
        $monitor(" %h\t %b\t %b", hex_in, dp_in, seg_out);

        dp_in = 0;  
        for (i = 0; i < 16; i = i + 1) begin
            hex_in = i[3:0];
            #10;
        end

        dp_in = 1; 
        for (i = 0; i < 16; i = i + 1) begin
            hex_in = i[3:0];
            #10;
        end

        $finish;
    end

    initial
    begin
        $shm_open("wave.shm");
        $shm_probe("ACTMF");
    end
endmodule

