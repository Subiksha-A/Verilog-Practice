module d_ff_tb;
    reg d;
    reg rst_n;
    reg clk;
    wire q;
    d_ff uut (
        .q(q),
        .d(d),
        .rst_n(rst_n),
        .clk(clk)
    );

   
    always #5 clk = ~clk;

    
    initial begin
        
        d = 0;
        rst_n = 0;
        clk = 0;

        
        #50 rst_n = 1;

        #10 d = 1;
        #20 d = 0;
        #30 d = 1;

        
        #100 $finish;
    end
initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
  #10000 $finish;
end
endmodule
