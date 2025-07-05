module tb_mod5_counter;

  reg clk;
  reg reset;
  wire QA, QB, QC;
  wire [2:0] count;

  assign count = {QA, QB, QC}; 

  mod5_counter uut (
    .clk(clk),
    .reset(reset),
    .QA(QA),
    .QB(QB),
    .QC(QC)
  );

 
  initial clk = 0;
  always #5 clk = ~clk;

  
  initial begin
    $display("Time\tQA QB QC\tDecimal Count");
    $monitor("%0t\t%b  %b  %b\t%d", $time, QA, QB, QC, count);

    reset = 1;
    #10;
    reset = 0;

    #100;
    $finish;
  end
initial begin
  $dumpfile("dump.vcd");
  $dumpvars;
  #10000 $finish;
end
endmodule
