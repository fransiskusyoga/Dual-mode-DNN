//tb_C : testing weightbank.v
// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module tb_C();
  parameter N = 40; //number of ram bank
  parameter Ndata = 24;
  parameter Naddr = 9;
  reg [Ndata*N-1:0] in;
  wire [Ndata*N-1:0] out;
  reg [Naddr-1:0] rdaddr, wraddr;
  reg rst,wren,clk;

  weightbank WBANK(
    .in(in), .out(out), .rdaddr(rdaddr),
    .wraddr(wraddr), .rst(rst), .wren(wren), .clk(clk));
  initial begin
    rst = 1'b0;
    clk = 1'b0;
    wren = 1'b0;
    rdaddr = 9'b0;
    wraddr = 9'd9;
    in = {Ndata*N/4{4'hA}};
    #100 rdaddr = 9'd1;
    #100 rdaddr = 9'd2;
    #100 rdaddr = 9'd3;
    #100 rdaddr = 9'd4;
    #100 rdaddr = 9'd5;
    #100 rdaddr = 9'd6;
    #100 rdaddr = 9'd7;
    #100 rdaddr = 9'd8;
    #100 rdaddr = 9'd9;
    #300 wren = 1'b1;
    in = {Ndata*N/4{4'hB}};
    #100 in = {Ndata*N/4{4'hC}};
    #100 in = {Ndata*N/4{4'hD}};
    #100 in = {Ndata*N/4{4'hE}};
    #100 in = {Ndata*N/4{4'hF}};
    wren = 1'b0;
    #100 in = {Ndata*N/4{4'h1}};
    #100 in = {Ndata*N/4{4'h2}};
    #100 in = {Ndata*N/4{4'h3}};
    #100 in = {Ndata*N/4{4'h4}};
    #100 in = {Ndata*N/4{4'h5}};
    #100 in = {Ndata*N/4{4'h6}};
    #100 in = {Ndata*N/4{4'h7}};
    #100 in = {Ndata*N/4{4'h8}};
  end
  
  always #50 clk= !clk;
endmodule