module ring_count_test();
    reg clk_tb, clr_tb;
    wire [3:0] q_tb;

    // Instantiate the DUT
    ring_count dut1(q_tb, clk_tb, clr_tb);

    // Stimulus and monitoring
    initial begin
        $display("time,\t clk_tb,\t clr_tb,\t q_tb");
        $monitor("%g,\t %b,\t %b,\t %b", $time, clk_tb, clr_tb, q_tb);

        clk_tb = 0;
        clr_tb = 1'b0;

        #50 clr_tb = 1'b1;
        #100 clr_tb = 1'b0;
    end

    // Clock generation
    always #50 clk_tb = ~clk_tb;

    // VCD dump
    initial begin
        $dumpfile("dump.vcd");
        $dumpvars;
        #10000 $finish;
    end
endmodule
