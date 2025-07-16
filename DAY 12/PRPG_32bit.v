module DFF (
    input clk,
    input d,
    output reg q
);
    always @(posedge clk)
        q <= d;
endmodule
module PRPG_32bit (
    input clk,
    input init,
    input [31:0] seed,
    output [31:0] out
);

    wire [31:0] q;
    wire feedback;
    wire [31:0] d;

    // Feedback tap logic: x^32 + x^28 + x^27 + x + 1
    assign feedback = q[31] ^ q[27] ^ q[26] ^ q[0];

    // Generate D inputs for each DFF
    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : DFF_CHAIN
            if (i == 0)
                assign d[i] = init ? seed[i] : feedback;
            else
                assign d[i] = init ? seed[i] : q[i-1];

            DFF dff_inst (
                .clk(clk),
                .d(d[i]),
                .q(q[i])
            );
        end
    endgenerate

    assign out = q;

endmodule
