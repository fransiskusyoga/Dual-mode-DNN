module regunitin#(
         parameter B)(
         in0,in1,out,regval,slcin,stop_in,
         stop_out,rst_in, rst_out,clk);
  
  input [B-1:0] in0,in1;
  input slcin,stop_in;
  input rst_in,clk;
  output reg rst_out;
  output reg stop_out;
  output [B-1:0] out;
  
  output reg [B-1:0] regval;
  
  always @(posedge clk)
  begin
    rst_out<=rst_in;
    stop_out<=stop_in;
    if(rst_in) regval<=0;
    else regval <= out;
  end
  
  assign out = stop_in ? (slcin ? in1 : regval) :in0;
endmodule
