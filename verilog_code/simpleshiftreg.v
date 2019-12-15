module simpleshiftreg #(parameter B)(
         in,out,rst,clk);
  localparam N=40; 
  localparam k=N*B-1;
  input [B-1:0] in;
  output [k:0] out;
  input rst,clk;
  
  reg [k:0] out={k{1'b0}};
  always @(posedge clk)
  begin
    out[k:B] <= out[k-B:0];
    if(rst) out[B-1:0]<=0;
    else out[B-1:0]<=in;
  end
endmodule
