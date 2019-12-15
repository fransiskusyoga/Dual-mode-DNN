module buffer#(
         parameter B)(
         in,out,rst,clk);
  input [B-1:0] in;
  output reg [B-1:0] out;
  input rst,clk;
  always @(posedge clk)
  begin
    if (rst) out<= {B{1'b0}};
    else out<= in;
  end
endmodule 