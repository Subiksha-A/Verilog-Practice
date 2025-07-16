module sequence_detector (
    input clk,
    input rst,
    input x,
    output reg [3:0] y
);

    reg [7:0] shift;
  reg [3:0] bit_count;  // to count the number of bits

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift <= 8'b0;
            bit_count <= 0;
            y <= 4'b0000;
        end 
        else begin
          shift <= {shift[6:0], x};  // Shift in 1 bit

            // Count up to 8 bits
            if (bit_count < 8)
                bit_count <= bit_count + 1;

            // check for pattern only after 8 bits are detected
            if (bit_count >= 8) begin
                if (shift == 8'b11110000)
                    y <= 4'b0001; // p1
                else if (shift == 8'b11001100)
                    y <= 4'b0010; // p2
                else if (shift == 8'b00110011)
                    y <= 4'b0011; // p3
                else if (shift == 8'b00001111)
                    y <= 4'b0100; // p4
                end else begin
                y <= 4'b0000; // no match
            end
        end
    end
endmodule
