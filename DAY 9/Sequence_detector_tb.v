module tb_sequence_detector;

    reg clk, rst, x;
    wire [3:0] y;

    sequence_detector uut (
        .clk(clk),
        .rst(rst),
        .x(x),
        .y(y)
    );

  
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  
    end


    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_sequence_detector);
        $monitor("Time = %0t | x = %b | y = %b", $time, x, y);

        rst = 1;
        x = 0;
        #10 rst = 0;

        
        x = 1; #10;
        x = 1; #10;
        x = 1; #10;
        x = 1; #10;
        x = 0; #10;
        x = 0; #10;
        x = 0; #10;
        x = 0; #10;  

        x = 0; #10;
        x = 0; #10;
        x = 0; #10;
        x = 0; #10;
        x = 0; #10;
        x = 0; #10;
        x = 1; #10;
        x = 1; #10; 
      
        x = 1; #10;
        x = 1; #10;
        x = 0; #10;
        x = 0; #10;
        x = 1; #10;
        x = 1; #10;
        x = 0; #10;
        x = 0; #10;  

       
        x = 0; #10;
        x = 0; #10;
        x = 1; #10;
        x = 1; #10;
        x = 0; #10;
        x = 0; #10;
        x = 1; #10;
        x = 1; #10; 
        
        x = 0; #10;
        x = 0; #10;
        x = 0; #10;
        x = 0; #10;
        x = 1; #10;
        x = 1; #10;
        x = 1; #10;
        x = 1; #10;  

        #50;
        $finish;
    end

endmodule
