module johnson_counter( out,clr,clk);
input clk,clr;
output [3:0] out;
reg [3:0] q;
always @(posedge clk)
begin
  if(clr)
q=4'd0;
else
begin
  q[2]<=q[3];
  q[1]<=q[2];
  q[0]<=q[1];
  q[3]<=(~q[0]);
end

end

assign out=q;

endmodule
