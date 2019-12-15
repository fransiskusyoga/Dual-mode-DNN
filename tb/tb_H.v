//tb_H : testing memory_z.v
// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module tb_H();
  
	reg	[23:0]  in;
  wire	[23:0]  out;
	wire	[6:0]  addr;
	reg	wren,rst,clk;
  
  memory_z MEMZ(
    .in(in),.out(out),.rdaddr(addr),.rdslc(1'b0),
    .wraddr(addr),.wrslc(1'b0),.wren(wren),
    .actien(1'b0),.clk(clk));
  counter #(7) CNTR(
    .out(addr), .clk(clk), .stop(1'b0), .rst(rst));
  
  initial begin
  clk = 1'b0;
  rst = 1'b0;
  wren = 1'b0;
  in = 24'd999;
  #300 rst = 1'b1;
  #100 rst = 1'b0;
  #500 wren = 1'b1;
  #1500 wren = 1'b0;
  end
  
  always #50 clk = !clk;
  
endmodule
