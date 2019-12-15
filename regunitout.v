module regunitout#(
         parameter B)(
         in,out,rst_in, rst_out,clk);
  input [B-1:0] in;
  input rst_in,clk;
  output reg rst_out;
  output reg [B-1:0] out;
  
  always @(posedge clk)
  begin
    rst_out<=rst_in;
    if(rst_out) out<=0;
    else out<=in;
  end
  
endmodule
