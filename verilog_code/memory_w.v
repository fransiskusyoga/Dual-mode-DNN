module memory_w(
         in, out, rdaddr, wraddr,rdslc,wrslc,rst,wren,clk);
  parameter N = 40; //number of ram bank
  parameter Ndata = 24;
  parameter Naddr = 9;
  input [Ndata*N-1:0] in;
  output [Ndata*N-1:0] out;
  input [Naddr-2:0] rdaddr, wraddr;
  input [1:0] rdslc,wrslc;
  input rst,wren,clk;
  
  wire [Naddr-1:0] rdaddress, wraddress;
  wire [Naddr-2:0] rdoffset, wroffset;
  weightbank WB(
    .in(in),.out(out),.rdaddr(rdaddress),
    .wraddr(wraddress),.rst(rst),.wren(wren),.clk(clk));
  assign rdoffset = rdslc[0] ? 8'd225 : 8'd0;
  assign wroffset = wrslc[0] ? 8'd225 : 8'd0;
  assign rdaddress[Naddr-2:0] = rdaddr + rdoffset;
  assign wraddress[Naddr-2:0] = wraddr + wroffset;
  assign rdaddress[Naddr-1] = rdslc[1];
  assign wraddress[Naddr-1] = wrslc[1];
endmodule