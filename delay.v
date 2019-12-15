//Delay clk with B bit input and 
module delay #(
         parameter B,
         parameter N)(
         in, out, clk);
  input [B-1:0] in;
  output [B-1:0] out;
  input clk;
  
  reg [N*B-1:0] buffer = {N*B{1'b0}};

  wire [B-1:0] incout, outmux1;
  
  always @(posedge clk)
  begin
    buffer[B-1:0] <= in;
    buffer[N*B-1:B] <= buffer [N*B-B-1:0];
  end
  
  assign out = buffer[N*B-1:(N-1)*B]; 
endmodule