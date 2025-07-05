module tb;
  parameter WIDTH = 4;

  reg clk;
  reg clr;
  wire [WIDTH-1:0] out;

 
  johnson_counter u0 (
    .clk(clk),
    .clr(clr),
    .out(out)
  );

  always #10 clk = ~clk;

  initial begin
     clk = 0;
     clr = 1;

    $monitor ("T=%0t out=%b", $time, out);
    repeat (2) @(posedge clk);
    clr = 0;
    @(posedge clk);
    clr = 0;
    repeat (15) @(posedge clk);
    $finish;
  end
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #10000 $finish;
  end
endmodule
