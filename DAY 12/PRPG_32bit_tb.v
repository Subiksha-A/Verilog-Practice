module tb_PRPG_32bit;

    reg clk;
    reg init;
    reg [31:0] seed;
    wire [31:0] out;

    // Instantiate the PRPG
    PRPG_32bit uut (
        .clk(clk),
        .init(init),
        .seed(seed),
        .out(out)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Toggle every 5s
    end

    // Stimulus logic
    initial begin
        // Initial state
      $dumpfile("prpg.vcd");   // dump file For waveform
        $dumpvars(0, tb_PRPG_32bit);
        init = 1;
        seed = 32'hA5A5A5A5;  // seed pattern
        #10;
        //start generating random sequence
        init = 0;
        #220;
		
        $finish;
    end

endmodule
