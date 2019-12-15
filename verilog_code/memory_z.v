module memory_z(
         rdaddr,wraddr,in,
         wren,rdslc,wrslc,
         rdout,wrout,clk);
	input	[5:0]  rdaddr,wraddr;
	input	[23:0] in;
	input	wren;
	input	[1:0] rdslc,wrslc;
	output	[23:0]  rdout,wrout;
  input clk;
  
  wire [6:0] address_a, address_b;
  wire [6:0] offset_a, offset_b;
  
  ram_z RAMZ(
    .address_a(address_a),.address_b(address_b),
    .data_a(24'b0),.data_b(in),
    .wren_a(1'b0),.wren_b(wren),
	  .q_a(rdout),.q_b(wrout),
    .clock(clk));
  
  assign offset_a = rdslc[1] ? 7'd80 : (rdslc[0] ? 7'd40 : 7'd0);
  assign offset_b = wrslc[1] ? 7'd80 : (wrslc[0] ? 7'd40 : 7'd0);
  assign address_a = rdaddr + offset_a; 
  assign address_b = wraddr + offset_b; 
endmodule 
