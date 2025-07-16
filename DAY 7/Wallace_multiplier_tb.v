module WallaceTreeMult_tb;

  // Inputs
  reg [4:0] A;
  reg [4:0] B;


  wire [9:0] Out;

 
  WallaceTreeMult uut (
    .A(A), 
    .B(B), 
    .Out(Out)
  );

  // Task to apply inputs and display result in binary
  task apply_and_check;
    input [4:0] inA, inB;
    reg [9:0] expected;
    begin
      A = inA;
      B = inB;
      expected = inA * inB;
      #10; // wait for propagation
      $display("A = %b, B = %b | Output = %b | Expected = %b %s", 
               A, B, Out, expected, (Out !== expected) ? "False" : "True");
    end
  endtask

  initial begin
    $display("===== Wallace Tree Multiplier Binary Testbench =====");

    // Binary test cases
    apply_and_check(5'b00000, 5'b00000); // 0 * 0
    apply_and_check(5'b00001, 5'b00001); // 1 * 1
    apply_and_check(5'b00011, 5'b00010); // 3 * 2
    apply_and_check(5'b01111, 5'b00011); // 15 * 3
    apply_and_check(5'b00100, 5'b00101); // 4 * 5
    apply_and_check(5'b00111, 5'b00111); // 7 * 7
    apply_and_check(5'b01010, 5'b01010); // 10 * 10
    apply_and_check(5'b11111, 5'b11111); // 31 * 31
    $stop;
  end

endmodule
