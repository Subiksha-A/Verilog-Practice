module LFSR(
    input clk,
    input rst,
    output reg [3:0] op
);

    always @(posedge clk) begin
        if(rst)
            op <= 4'b0101; 
        else
            op <= {op[2:0], (op[3] ^ op[2])}; 
    end

endmodule
