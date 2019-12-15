module cyclecounter#(
         parameter N)(
         out, limit, clk, rst, last, done);
  input [N-1:0] limit;
  output reg [N-1:0] out ={N{1'b0}};
  input clk,rst;
  output last;
  output reg done;
  wire [N-1:0] outmux1;
  always @(posedge clk)
  begin
    if(rst)
    begin
      out = {N{1'b0}} ;
      done = 1'b0;
    end
    else
    begin
      out <= outmux1;
      done <= last;
    end
  end
  assign outmux1 = last ? {N{1'b0}} : out+{{N-1{1'b0}},1'b1}; //last ? {N{1'b0}} : out+1;
  assign last = (out==limit);
endmodule
