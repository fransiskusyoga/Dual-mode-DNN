//Counter N bit with stop and reset
module counter #(
         parameter N= 8)(
         out, clk, stop, rst);
  output reg [N-1:0] out = 0;
  input clk, stop, rst;

  wire [N-1:0] incout, outmux1;
  always @(posedge clk)
  begin
    if (rst) out <= 0;
    else out <= outmux1;
  end
  assign incout = out + 1;
  assign outmux1 = stop ? out : incout;
endmodule