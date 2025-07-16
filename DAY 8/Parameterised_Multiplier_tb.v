module tb_Multiplier;
    parameter N = 5;
    reg [N-1:0] A, B;
    wire [2*N-1:0] Product;

    Multiplier #(N) uut (
        .A(A),
        .B(B),
        .Product(Product)
    );

    initial begin
        A = 4'd3; B = 4'd5;
        #10 A = 4'd15; B = 4'd15;
        #10 A = 4'd9; B = 4'd2;
      	#10 A = 5'd16; B = 5'd16;
        #10 A = 5'd16; B = 3'd6;
        #10 $finish;
    end

    initial begin
        $monitor("A = %d, B = %d, Product = %d", A, B, Product);
    end
endmodule
