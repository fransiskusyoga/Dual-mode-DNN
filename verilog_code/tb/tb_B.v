//tb_B : testing shiftregin.v
// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module tb_B();
  parameter N= 40;
  parameter B= 16;
  reg [B-1:0] in0, in1;
  wire [N*B-1:0] out;
  reg [5:0] addr;
  reg stop,rst,clk;
  
  shiftregin #(B) SHRin(.in0(in0),.in1(in1),.out(out),.addr(addr),.mode(stop),.rst(rst),.clk(clk));
  
  
  initial begin
  clk = 1'b0;
  rst = 1'b0;
  addr = 6'd0;
  stop = 1'b0;
  in0 = 16'd1;
  in1 = 16'd99;
  #300 rst = 1'b1;
  #100 rst = 1'b0;
  in0 = 16'd12;
  #100 in0 = 16'd123;
  #100 in0 = 16'd1234;
  #100 in0 = 16'd12345;
  #100 in0 = 16'd1;
  #100 in0 = 16'd2;
  #100 in0 = 16'd3;
  #100 in0 = 16'd4;
  #100 in0 = 16'd5;
  #100 in0 = 16'd6;
  stop = 1'b1;
  addr = 6'd4;
  #100 in0 = 16'd7;
  #100 in0 = 16'd8;
  addr = 1'd0;
  #100 in0 = 16'd9;
  #100 in0 = 16'd10;
  stop = 1'b0;
  end
  
  always #50 clk = !clk;
endmodule