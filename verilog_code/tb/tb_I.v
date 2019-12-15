//tb_I : testing NNCore,v (2nd)
//z2 saved in memory_z
// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module tb_I();
  
  reg rst,clk;
  
  parameter N= 40; //variabled
  parameter Ba= 24;
  parameter Bb= 16;
  parameter Bm=6; //variabled
  parameter Bz= 7; //variabled, ram z bit address lenght
  wire [Bb-1:0] in;
  wire [N*Ba-1:0] a_bus,x_bus,out_bus;
  wire [N*Bb-1:0] b_bus;
  wire [Bm-1:0] source_addr,dest_addr;
  wire [7:0] cntr; //variabled
  wire [Ba-1:0] out1,outz;
  
  shiftregin #(Bb) SHRin(
    .in(in),.out(b_bus),.addr(6'b0),
    .stop(1'b0),.rst(rst),.clk(clk));
  calcengine CE( 
    .a_bus(a_bus),.b_bus(b_bus),.x_bus(x_bus),
    .out_bus(out_bus),.acti_en(1'b0),.stop(1'b0),
    .rst(rst),.clk(clk));
  shiftregout #(Ba) SHRout(
    .ins(out_bus),.in({Ba{1'b0}}),.outs(x_bus),
    .out1(out1),.out2(),.addr1(source_addr),.addr2(6'b0),
    .mode(1'b0),.rst(rst),.clk(clk));
  weightbank WBank(
    .in({N*Ba{1'b0}}),.out(a_bus),.rdaddr({1'b0,cntr}),
    .wraddr(9'b0),.rst(rst),.wren(1'b0),.clk(clk));
  
  //INP rdaddress and wraddress : be variabled
  ram_in INP(
    .clock(clk),.data(16'b0),.rdaddress(cntr),
    .wraddress(8'b0),.wren(1'b0),.q(in));
  
  controlengine CTRLEng(
    .rd_step(cntr),.wr_step(),
    .source_addr(source_addr),.dest_addr(dest_addr),
    .wren(wren),.rst(rst),.clk(clk));
  
  //I am still not sure about rdaddr value
  //wardr be variabled
  memory_z MEMZ( 
    .in(out1),.out(outz),.rdaddr(cntr[6:0]),.rdslc(1'b0),
    .wraddr({1'b0,dest_addr}),.wrslc(1'b0),.wren(wren),.actien(1'b0),
    .clk(clk));
  
  
  initial begin
  clk = 1'b0;
  rst = 1'b0;
  #300 rst = 1'b1;
  #100 rst = 1'b0;
  end
  
  always #50 clk = !clk;
endmodule
