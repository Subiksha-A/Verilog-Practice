module sequence_detector (
    input clk,
    input rst,
    input x,
    output reg [3:0] y 
);

    reg [7:0] shift;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            shift <= 8'bx;
            y <= 4'b0000;
        end 
      else begin
         shift <= {shift[6:0], x};  
        if (shift==8'b11110000) begin 
              y <= 4'b0001; // p1
            end
        else if (shift==8'b11001100) begin 
              y <= 4'b0010; // p2
          end
        else if (shift==8'b00110011) begin
              y <= 4'b0011; // p3
          end
        else if (shift==8'b00001111) begin 
              y <= 4'b0100; // p4
          end      
        end
    end

endmodule
