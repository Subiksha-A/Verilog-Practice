module Multiplier #(parameter N = 5)(
    input  [N-1:0] A,
    input  [N-1:0] B,
    output reg [2*N-1:0] Product
);

    wire [N-1:0] partial_products [N-1:0];

    genvar i, j;
    generate
        for (i = 0; i < N; i = i + 1) begin : gen_partial
            for (j = 0; j < N; j = j + 1) begin : gen_bit
                assign partial_products[i][j] = A[j] & B[i];
            end
        end
    endgenerate

    integer row, col;
    reg [2*N-1:0] sum_all;
    always @(*) begin
        sum_all = 0;
        for (row = 0; row < N; row = row + 1) begin
            for (col = 0; col < N; col = col + 1) begin
                sum_all = sum_all + (partial_products[row][col] << (row + col));
            end
        end
        Product = sum_all;
    end

endmodule
