module weightbank(
         in, out, rdaddr, wraddr,rst,wren,clk);
  localparam N = 40; //number of ram bank
  localparam Ndata = 24;
  localparam Naddr = 9;
  input [Ndata*N-1:0] in;
  output [Ndata*N-1:0] out;
  input [Naddr-1:0] rdaddr, wraddr;
  input rst, wren,clk;
  
  wire [Naddr*N-1:0] rdaddrbus,wraddrbus;
  wire [N-1:0] wrenbus;
  
  simpleshiftreg #(Naddr) WRAD (.in(wraddr),.out(wraddrbus),.rst(rst),.clk(clk));
  simpleshiftreg #(Naddr) RDAD (.in(rdaddr),.out(rdaddrbus),.rst(rst),.clk(clk));
  simpleshiftreg #(1) WREN (.in(wren),.out(wrenbus),.rst(rst),.clk(clk));
  
  ram_w RAMW0 (.clock(clk),.data(in[Ndata-1:0]),.wren(wren),.rdaddress(rdaddr),.wraddress(wraddr),.q(out[Ndata-1:0]));
  ram_w RAMW1 (.clock(clk),.data(in[2*Ndata-1:1*Ndata]),.wren(wrenbus[0]),.rdaddress(rdaddrbus[1*Naddr-1:0*Naddr]),.wraddress(wraddrbus[1*Naddr-1:0*Naddr]),.q(out[2*Ndata-1:1*Ndata]));
  ram_w RAMW2 (.clock(clk),.data(in[3*Ndata-1:2*Ndata]),.wren(wrenbus[1]),.rdaddress(rdaddrbus[2*Naddr-1:1*Naddr]),.wraddress(wraddrbus[2*Naddr-1:1*Naddr]),.q(out[3*Ndata-1:2*Ndata]));
  ram_w RAMW3 (.clock(clk),.data(in[4*Ndata-1:3*Ndata]),.wren(wrenbus[2]),.rdaddress(rdaddrbus[3*Naddr-1:2*Naddr]),.wraddress(wraddrbus[3*Naddr-1:2*Naddr]),.q(out[4*Ndata-1:3*Ndata]));
  ram_w RAMW4 (.clock(clk),.data(in[5*Ndata-1:4*Ndata]),.wren(wrenbus[3]),.rdaddress(rdaddrbus[4*Naddr-1:3*Naddr]),.wraddress(wraddrbus[4*Naddr-1:3*Naddr]),.q(out[5*Ndata-1:4*Ndata]));
  ram_w RAMW5 (.clock(clk),.data(in[6*Ndata-1:5*Ndata]),.wren(wrenbus[4]),.rdaddress(rdaddrbus[5*Naddr-1:4*Naddr]),.wraddress(wraddrbus[5*Naddr-1:4*Naddr]),.q(out[6*Ndata-1:5*Ndata]));
  ram_w RAMW6 (.clock(clk),.data(in[7*Ndata-1:6*Ndata]),.wren(wrenbus[5]),.rdaddress(rdaddrbus[6*Naddr-1:5*Naddr]),.wraddress(wraddrbus[6*Naddr-1:5*Naddr]),.q(out[7*Ndata-1:6*Ndata]));
  ram_w RAMW7 (.clock(clk),.data(in[8*Ndata-1:7*Ndata]),.wren(wrenbus[6]),.rdaddress(rdaddrbus[7*Naddr-1:6*Naddr]),.wraddress(wraddrbus[7*Naddr-1:6*Naddr]),.q(out[8*Ndata-1:7*Ndata]));
  ram_w RAMW8 (.clock(clk),.data(in[9*Ndata-1:8*Ndata]),.wren(wrenbus[7]),.rdaddress(rdaddrbus[8*Naddr-1:7*Naddr]),.wraddress(wraddrbus[8*Naddr-1:7*Naddr]),.q(out[9*Ndata-1:8*Ndata]));
  ram_w RAMW9 (.clock(clk),.data(in[10*Ndata-1:9*Ndata]),.wren(wrenbus[8]),.rdaddress(rdaddrbus[9*Naddr-1:8*Naddr]),.wraddress(wraddrbus[9*Naddr-1:8*Naddr]),.q(out[10*Ndata-1:9*Ndata]));
  ram_w RAMW10 (.clock(clk),.data(in[11*Ndata-1:10*Ndata]),.wren(wrenbus[9]),.rdaddress(rdaddrbus[10*Naddr-1:9*Naddr]),.wraddress(wraddrbus[10*Naddr-1:9*Naddr]),.q(out[11*Ndata-1:10*Ndata]));
  ram_w RAMW11 (.clock(clk),.data(in[12*Ndata-1:11*Ndata]),.wren(wrenbus[10]),.rdaddress(rdaddrbus[11*Naddr-1:10*Naddr]),.wraddress(wraddrbus[11*Naddr-1:10*Naddr]),.q(out[12*Ndata-1:11*Ndata]));
  ram_w RAMW12 (.clock(clk),.data(in[13*Ndata-1:12*Ndata]),.wren(wrenbus[11]),.rdaddress(rdaddrbus[12*Naddr-1:11*Naddr]),.wraddress(wraddrbus[12*Naddr-1:11*Naddr]),.q(out[13*Ndata-1:12*Ndata]));
  ram_w RAMW13 (.clock(clk),.data(in[14*Ndata-1:13*Ndata]),.wren(wrenbus[12]),.rdaddress(rdaddrbus[13*Naddr-1:12*Naddr]),.wraddress(wraddrbus[13*Naddr-1:12*Naddr]),.q(out[14*Ndata-1:13*Ndata]));
  ram_w RAMW14 (.clock(clk),.data(in[15*Ndata-1:14*Ndata]),.wren(wrenbus[13]),.rdaddress(rdaddrbus[14*Naddr-1:13*Naddr]),.wraddress(wraddrbus[14*Naddr-1:13*Naddr]),.q(out[15*Ndata-1:14*Ndata]));
  ram_w RAMW15 (.clock(clk),.data(in[16*Ndata-1:15*Ndata]),.wren(wrenbus[14]),.rdaddress(rdaddrbus[15*Naddr-1:14*Naddr]),.wraddress(wraddrbus[15*Naddr-1:14*Naddr]),.q(out[16*Ndata-1:15*Ndata]));
  ram_w RAMW16 (.clock(clk),.data(in[17*Ndata-1:16*Ndata]),.wren(wrenbus[15]),.rdaddress(rdaddrbus[16*Naddr-1:15*Naddr]),.wraddress(wraddrbus[16*Naddr-1:15*Naddr]),.q(out[17*Ndata-1:16*Ndata]));
  ram_w RAMW17 (.clock(clk),.data(in[18*Ndata-1:17*Ndata]),.wren(wrenbus[16]),.rdaddress(rdaddrbus[17*Naddr-1:16*Naddr]),.wraddress(wraddrbus[17*Naddr-1:16*Naddr]),.q(out[18*Ndata-1:17*Ndata]));
  ram_w RAMW18 (.clock(clk),.data(in[19*Ndata-1:18*Ndata]),.wren(wrenbus[17]),.rdaddress(rdaddrbus[18*Naddr-1:17*Naddr]),.wraddress(wraddrbus[18*Naddr-1:17*Naddr]),.q(out[19*Ndata-1:18*Ndata]));
  ram_w RAMW19 (.clock(clk),.data(in[20*Ndata-1:19*Ndata]),.wren(wrenbus[18]),.rdaddress(rdaddrbus[19*Naddr-1:18*Naddr]),.wraddress(wraddrbus[19*Naddr-1:18*Naddr]),.q(out[20*Ndata-1:19*Ndata]));
  ram_w RAMW20 (.clock(clk),.data(in[21*Ndata-1:20*Ndata]),.wren(wrenbus[19]),.rdaddress(rdaddrbus[20*Naddr-1:19*Naddr]),.wraddress(wraddrbus[20*Naddr-1:19*Naddr]),.q(out[21*Ndata-1:20*Ndata]));
  ram_w RAMW21 (.clock(clk),.data(in[22*Ndata-1:21*Ndata]),.wren(wrenbus[20]),.rdaddress(rdaddrbus[21*Naddr-1:20*Naddr]),.wraddress(wraddrbus[21*Naddr-1:20*Naddr]),.q(out[22*Ndata-1:21*Ndata]));
  ram_w RAMW22 (.clock(clk),.data(in[23*Ndata-1:22*Ndata]),.wren(wrenbus[21]),.rdaddress(rdaddrbus[22*Naddr-1:21*Naddr]),.wraddress(wraddrbus[22*Naddr-1:21*Naddr]),.q(out[23*Ndata-1:22*Ndata]));
  ram_w RAMW23 (.clock(clk),.data(in[24*Ndata-1:23*Ndata]),.wren(wrenbus[22]),.rdaddress(rdaddrbus[23*Naddr-1:22*Naddr]),.wraddress(wraddrbus[23*Naddr-1:22*Naddr]),.q(out[24*Ndata-1:23*Ndata]));
  ram_w RAMW24 (.clock(clk),.data(in[25*Ndata-1:24*Ndata]),.wren(wrenbus[23]),.rdaddress(rdaddrbus[24*Naddr-1:23*Naddr]),.wraddress(wraddrbus[24*Naddr-1:23*Naddr]),.q(out[25*Ndata-1:24*Ndata]));
  ram_w RAMW25 (.clock(clk),.data(in[26*Ndata-1:25*Ndata]),.wren(wrenbus[24]),.rdaddress(rdaddrbus[25*Naddr-1:24*Naddr]),.wraddress(wraddrbus[25*Naddr-1:24*Naddr]),.q(out[26*Ndata-1:25*Ndata]));
  ram_w RAMW26 (.clock(clk),.data(in[27*Ndata-1:26*Ndata]),.wren(wrenbus[25]),.rdaddress(rdaddrbus[26*Naddr-1:25*Naddr]),.wraddress(wraddrbus[26*Naddr-1:25*Naddr]),.q(out[27*Ndata-1:26*Ndata]));
  ram_w RAMW27 (.clock(clk),.data(in[28*Ndata-1:27*Ndata]),.wren(wrenbus[26]),.rdaddress(rdaddrbus[27*Naddr-1:26*Naddr]),.wraddress(wraddrbus[27*Naddr-1:26*Naddr]),.q(out[28*Ndata-1:27*Ndata]));
  ram_w RAMW28 (.clock(clk),.data(in[29*Ndata-1:28*Ndata]),.wren(wrenbus[27]),.rdaddress(rdaddrbus[28*Naddr-1:27*Naddr]),.wraddress(wraddrbus[28*Naddr-1:27*Naddr]),.q(out[29*Ndata-1:28*Ndata]));
  ram_w RAMW29 (.clock(clk),.data(in[30*Ndata-1:29*Ndata]),.wren(wrenbus[28]),.rdaddress(rdaddrbus[29*Naddr-1:28*Naddr]),.wraddress(wraddrbus[29*Naddr-1:28*Naddr]),.q(out[30*Ndata-1:29*Ndata]));
  ram_w RAMW30 (.clock(clk),.data(in[31*Ndata-1:30*Ndata]),.wren(wrenbus[29]),.rdaddress(rdaddrbus[30*Naddr-1:29*Naddr]),.wraddress(wraddrbus[30*Naddr-1:29*Naddr]),.q(out[31*Ndata-1:30*Ndata]));
  ram_w RAMW31 (.clock(clk),.data(in[32*Ndata-1:31*Ndata]),.wren(wrenbus[30]),.rdaddress(rdaddrbus[31*Naddr-1:30*Naddr]),.wraddress(wraddrbus[31*Naddr-1:30*Naddr]),.q(out[32*Ndata-1:31*Ndata]));
  ram_w RAMW32 (.clock(clk),.data(in[33*Ndata-1:32*Ndata]),.wren(wrenbus[31]),.rdaddress(rdaddrbus[32*Naddr-1:31*Naddr]),.wraddress(wraddrbus[32*Naddr-1:31*Naddr]),.q(out[33*Ndata-1:32*Ndata]));
  ram_w RAMW33 (.clock(clk),.data(in[34*Ndata-1:33*Ndata]),.wren(wrenbus[32]),.rdaddress(rdaddrbus[33*Naddr-1:32*Naddr]),.wraddress(wraddrbus[33*Naddr-1:32*Naddr]),.q(out[34*Ndata-1:33*Ndata]));
  ram_w RAMW34 (.clock(clk),.data(in[35*Ndata-1:34*Ndata]),.wren(wrenbus[33]),.rdaddress(rdaddrbus[34*Naddr-1:33*Naddr]),.wraddress(wraddrbus[34*Naddr-1:33*Naddr]),.q(out[35*Ndata-1:34*Ndata]));
  ram_w RAMW35 (.clock(clk),.data(in[36*Ndata-1:35*Ndata]),.wren(wrenbus[34]),.rdaddress(rdaddrbus[35*Naddr-1:34*Naddr]),.wraddress(wraddrbus[35*Naddr-1:34*Naddr]),.q(out[36*Ndata-1:35*Ndata]));
  ram_w RAMW36 (.clock(clk),.data(in[37*Ndata-1:36*Ndata]),.wren(wrenbus[35]),.rdaddress(rdaddrbus[36*Naddr-1:35*Naddr]),.wraddress(wraddrbus[36*Naddr-1:35*Naddr]),.q(out[37*Ndata-1:36*Ndata]));
  ram_w RAMW37 (.clock(clk),.data(in[38*Ndata-1:37*Ndata]),.wren(wrenbus[36]),.rdaddress(rdaddrbus[37*Naddr-1:36*Naddr]),.wraddress(wraddrbus[37*Naddr-1:36*Naddr]),.q(out[38*Ndata-1:37*Ndata]));
  ram_w RAMW38 (.clock(clk),.data(in[39*Ndata-1:38*Ndata]),.wren(wrenbus[37]),.rdaddress(rdaddrbus[38*Naddr-1:37*Naddr]),.wraddress(wraddrbus[38*Naddr-1:37*Naddr]),.q(out[39*Ndata-1:38*Ndata]));
  ram_w RAMW39 (.clock(clk),.data(in[40*Ndata-1:39*Ndata]),.wren(wrenbus[38]),.rdaddress(rdaddrbus[39*Naddr-1:38*Naddr]),.wraddress(wraddrbus[39*Naddr-1:38*Naddr]),.q(out[40*Ndata-1:39*Ndata]));

  
  //Override parameter RAM hidden weights
  defparam
    RAMW0.altsyncram_component.init_file = "mif/W_0.mif",
    RAMW1.altsyncram_component.init_file = "mif/W_1.mif",
    RAMW2.altsyncram_component.init_file = "mif/W_2.mif",
    RAMW3.altsyncram_component.init_file = "mif/W_3.mif",
    RAMW4.altsyncram_component.init_file = "mif/W_4.mif",
    RAMW5.altsyncram_component.init_file = "mif/W_5.mif",
    RAMW6.altsyncram_component.init_file = "mif/W_6.mif",
    RAMW7.altsyncram_component.init_file = "mif/W_7.mif",
    RAMW8.altsyncram_component.init_file = "mif/W_8.mif",
    RAMW9.altsyncram_component.init_file = "mif/W_9.mif",
    RAMW10.altsyncram_component.init_file = "mif/W_10.mif",
    RAMW11.altsyncram_component.init_file = "mif/W_11.mif",
    RAMW12.altsyncram_component.init_file = "mif/W_12.mif",
    RAMW13.altsyncram_component.init_file = "mif/W_13.mif",
    RAMW14.altsyncram_component.init_file = "mif/W_14.mif",
    RAMW15.altsyncram_component.init_file = "mif/W_15.mif",
    RAMW16.altsyncram_component.init_file = "mif/W_16.mif",
    RAMW17.altsyncram_component.init_file = "mif/W_17.mif",
    RAMW18.altsyncram_component.init_file = "mif/W_18.mif",
    RAMW19.altsyncram_component.init_file = "mif/W_19.mif",
    RAMW20.altsyncram_component.init_file = "mif/W_20.mif",
    RAMW21.altsyncram_component.init_file = "mif/W_21.mif",
    RAMW22.altsyncram_component.init_file = "mif/W_22.mif",
    RAMW23.altsyncram_component.init_file = "mif/W_23.mif",
    RAMW24.altsyncram_component.init_file = "mif/W_24.mif",
    RAMW25.altsyncram_component.init_file = "mif/W_25.mif",
    RAMW26.altsyncram_component.init_file = "mif/W_26.mif",
    RAMW27.altsyncram_component.init_file = "mif/W_27.mif",
    RAMW28.altsyncram_component.init_file = "mif/W_28.mif",
    RAMW29.altsyncram_component.init_file = "mif/W_29.mif",
    RAMW30.altsyncram_component.init_file = "mif/W_30.mif",
    RAMW31.altsyncram_component.init_file = "mif/W_31.mif",
    RAMW32.altsyncram_component.init_file = "mif/W_32.mif",
    RAMW33.altsyncram_component.init_file = "mif/W_33.mif",
    RAMW34.altsyncram_component.init_file = "mif/W_34.mif",
    RAMW35.altsyncram_component.init_file = "mif/W_35.mif",
    RAMW36.altsyncram_component.init_file = "mif/W_36.mif",
    RAMW37.altsyncram_component.init_file = "mif/W_37.mif",
    RAMW38.altsyncram_component.init_file = "mif/W_38.mif",
    RAMW39.altsyncram_component.init_file = "mif/W_39.mif";

  
endmodule