module main_to_sram(
         SRAM_ADDR, SRAM_CE_N, SRAM_DQ, SRAM_LB_N, 
         SRAM_OE_N, SRAM_UB_N, SRAM_WE_N, rst, clk);
  output [19:0]		SRAM_ADDR;
	output       		SRAM_CE_N;
	output [15:0]		SRAM_DQ;
	output       		SRAM_LB_N;
	output       		SRAM_OE_N;
	output       		SRAM_UB_N;
	output       		SRAM_WE_N;
  input rst,clk;
 
  wire [7:0] data;
  wire [7:0] wraddress;
  wire wren;
  wire [23:0] cost;
  wire status, request_in;
  wire [15:0] q0,q1,q2;
  
  NN_Core NNC(
    .data({1'b0,data,7'b0}),
    .wraddress(wraddress),
    .wren(wren),
    .sprdata(16'h0),
    .spraddress(2'b0),
    .spren(1'b0),
    .learn_rate(1'b0),
    .back_en(1'b0),
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
endmodule