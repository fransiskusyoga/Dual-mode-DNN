//tb_Y : testing NNCore.v
// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module tb_W();
  wire	    [19:0]		SRAM_ADDR;
	wire		          		SRAM_CE_N;
	wire 		    [15:0]		SRAM_DQ;
	wire		          		SRAM_LB_N;
	wire		          		SRAM_OE_N;
	wire		          		SRAM_UB_N;
	wire		          		SRAM_WE_N;

  wire [7:0] data;
  wire [7:0] wraddress;
  wire wren;
  reg [15:0] sprdata;
  reg [1:0] spraddress;
  reg spren;
  reg [2:0]learn_rate;
  reg back_en;
  wire [23:0] cost;
  wire status, request_in;
  wire [15:0] q0,q1,q2;
  reg rst,clk;
  
  NN_Core NNC(
    .data({1'b0,data,7'b0}),
    .wraddress(wraddress),
    .wren(wren),
    .sprdata(sprdata),
    .spraddress(spraddress),
    .spren(spren),
    .learn_rate(learn_rate),
    .back_en(back_en),
    .status(status),
    .request_in(request_in),
    .q0(q0),.q1(q1),.q2(q2),
    .cost(cost),
    .rst(rst),
    .clk(clk));
  
  slidingwindow SlideIn(
    .count(wraddress),
    .data(data),
    .write_out(wren),
    .clk(clk),
    .rst(rst),
    .request_in(request_in));
  
   sraminterface sram_interface(
		.SRAM_DQ(SRAM_DQ),       // external_interface.DQ
		.SRAM_ADDR(SRAM_ADDR),     //                   .ADDR
		.SRAM_LB_N(SRAM_LB_N),     //                   .LB_N
		.SRAM_UB_N(SRAM_UB_N),     //                   .UB_N
		.SRAM_CE_N(SRAM_CE_N),     //                   .CE_N
		.SRAM_OE_N(SRAM_OE_N),     //                   .OE_N
		.SRAM_WE_N(SRAM_WE_N),     //                   .WE_N
    .R(q0[14:7]),.G(q1[14:7]),.B(q2[14:7]),
    .rst(rst), .clk(clk), .write(status));
    
  
  initial begin
  sprdata = 16'd0;
  spraddress = 2'b0;
  spren = 1'b0;
  learn_rate = 3'd2;
  back_en = 1'b0;  
  rst = 1'b0;
  clk = 1'b0;
  #300 rst = 1'b1;
  #100 rst = 1'b0;
  end
  
  always #50 clk = !clk;
endmodule