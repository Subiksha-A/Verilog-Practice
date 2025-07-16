module tb;
  reg clk,rst;
  wire [3:0] op;
  LFSR lfsr1(clk,rst,op);
  always #2 clk=~clk;
  initial begin
    $monitor("op=%b",op);
    clk=0; rst=1;
      clk = 0; rst = 1;
      #5 rst = 0;
      #100; 
      $finish; 
    end
    initial begin
        $dumpfile("lfsr.vcd");
      $dumpvars(0, tb);
    end
endmodule
