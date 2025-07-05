module mod5_counter (
    input clk,
    input reset,
    output reg QA, QB, QC
);

  reg [2:0] state;

  always @(posedge clk or posedge reset) begin
    if (reset)
      state <= 3'b000;
    else begin
      case (state)
        3'b000: state <= 3'b001; 
        3'b001: state <= 3'b010; 
        3'b010: state <= 3'b011; 
        3'b011: state <= 3'b100; 
        3'b100: state <= 3'b000; 
        default: state <= 3'b000;
      endcase
    end
  end

  
  always @(*) begin
    {QA, QB, QC} = state;
  end

endmodule
