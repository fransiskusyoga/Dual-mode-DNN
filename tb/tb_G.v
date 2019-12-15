//tb_G : testing NNCore.v
//from begining till first output of a2
// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module tb_G();
  reg stop,rst,clk;
  
  parameter N= 40; //variabled
  parameter Ba= 24;
  parameter Bb= 16;
  wire [Bb-1:0] in;
  wire [N*Ba-1:0] a_bus,x_bus,out_bus;
  wire [N*Bb-1:0] b_bus;
  wire [8:0] cntr; //variabled
  wire [Ba-1:0] out1;
  
  shiftregin #(Bb) SHRin( //SHRin and CE stop should be diffrent
    .in(in),.out(b_bus),.addr(6'b0),
    .stop(stop),.rst(rst),.clk(clk));
  calcengine CE( //SHRin and CE stop should be diffrent
    .a_bus(a_bus),.b_bus(b_bus),.x_bus(x_bus),
    .out_bus(out_bus),.acti_en(1'b0),.stop(stop),
    .rst(rst),.clk(clk));
  shiftregout #(Ba) SHRout(
    .ins(out_bus),.in({Ba{1'b0}}),.outs(x_bus),.out1(out1),.out2(),
    .addr1(6'b0),.addr2(6'b0),.mode(1'b0),
    .rst(rst),.clk(clk));
  weightbank WBank(
    .in({N*Ba{1'b0}}),.out(a_bus),.rdaddr(cntr),
    .wraddr(9'b0),.rst(rst),.wren(1'b0),.clk(clk));
  
  //TD rdaddress and wraddress : be variabled
  ram_in INP(
    .clock(clk),.data(16'b0),.rdaddress(cntr[7:0]),
    .wraddress(8'b0),.wren(1'b0),.q(in));
  
  counter #(9) CTR(
    .out(cntr),.clk(clk),.stop(1'b0),.rst(rst));
  
  
  initial begin
  clk = 1'b0;
  rst = 1'b0;
  stop = 1'b0;
  #300 rst = 1'b1;
  #100 rst = 1'b0;
  end
  
  always #50 clk = !clk;
endmodule