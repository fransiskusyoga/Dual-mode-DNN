`timescale 1 ps / 1 ps
module colorizer(
	clk,
	rst,
	SRAM_DQ,
	SRAM_ADDR,
	SRAM_LB_N,
	SRAM_UB_N,
	SRAM_CE_N,
	SRAM_OE_N,
	SRAM_WE_N,
	write_en,
	status,
	request_in,
	cost
);
	///////////////////////////////////////////////
	////////////// PORTS & VARIABLES //////////////
	///////////////////////////////////////////////
	// SRAM ports & variables
	input clk;
	input rst;
	inout [15:0] SRAM_DQ;
	output [19:0] SRAM_ADDR; 
	output wire SRAM_LB_N;     // .LB_N
	output wire SRAM_UB_N;     // .UB_N
	output wire SRAM_CE_N;     // .CE_N
	output wire SRAM_OE_N;     // .OE_N
	output wire SRAM_WE_N;     // .WE_N
	
	wire [7:0] red;
	wire [7:0] green;
	wire [7:0] blue;
	wire [15:0] red_tmp;
	wire [15:0] green_tmp;
	wire [15:0] blue_tmp;
	wire [15:0] data;
	wire [1:0] count;
	wire [19:0] current_addr;
	wire next;
	output write_en;
	reg tmp_write;
	
	// NN_core ports & variables
	output status;
    output request_in;
	output [23:0] cost;
	///////////////////////////////////////////////
	///////////////////////////////////////////////
	
	NN_Core nncore( 
		.data(16'd0),
		.wraddress(8'd0),
		.wren(1'b0),
		.sprdata(16'd0),
		.spraddress(2'b00),
		.spren(1'b0),
		.learn_rate(3'b010),
		.back_en(1'b0),
		.status(status),
		.request_in(request_in),
		.q0(red_tmp),
		.q1(green_tmp),
		.q2(blue_tmp),
		.cost(cost),
		.rst(rst),
		.clk(clk)
	);
	
	up_counter upcnt(
		.clk(clk),
		.rst(rst),
		.next(next),
		.Q(count)
	);
	
	addr_counter adcnt(
    .clk(clk),
		.next(next),
		.rst(rst),
		.Q(current_addr)
	);
	
	sram_controller sram(
		.clk(clk),
		.reset(~rst),
		.SRAM_DQ(SRAM_DQ),
		.SRAM_ADDR(SRAM_ADDR),
		.SRAM_LB_N(SRAM_LB_N),
		.SRAM_UB_N(SRAM_UB_N),
		.SRAM_CE_N(SRAM_CE_N),
		.SRAM_OE_N(SRAM_OE_N),
		.SRAM_WE_N(SRAM_WE_N),
		.address(current_addr),
		.byteenable(2'b11),
		.read(1'b0),
		.write(write_en),
		.writedata(data),
		.readdata(),
		.readdatavalid()
	);
	
	always @(posedge clk)
	begin
		tmp_write = status;
	end

	assign data = count[1] ? blue : (count[0] ? green : red);
	assign write_en = (count == 2'b11) ? 1'b0 : 1'b1;
	assign red = red_tmp[7:0];
	assign green = green_tmp[7:0];
	assign blue = blue_tmp[7:0];
	assign write = tmp_write;
	
endmodule

module up_counter (clk, next, rst, Q); 
input clk, rst, next; 
output [1:0] Q; 
reg [1:0] tmp;

  always @(posedge next)
  begin
	tmp = 2'b00;
  end
 
  always @(posedge clk or posedge rst) 
    begin 
      if (rst)
        tmp = 2'b00; 
      else if (tmp == 2'b11)
        tmp = tmp; 
      else 
        tmp = tmp + 1'b1; 
      end
  assign Q = tmp;
endmodule 

module addr_counter (clk, next, rst, Q); 
input clk, rst, next;
output [19:0] Q;
reg [19:0] tmp;
 
 up_counter upcnt(
		.clk(clk),
		.rst(rst),
		.next(next),
		.Q(count)
	);
 
  always @(posedge next or posedge rst) 
    begin 
      if (rst) 
        tmp = 20'hFFFFF; 
	  else
        tmp = tmp + 1'b1;
      end 
  assign Q = tmp; 
endmodule 

module colorizer_tb();

	reg clk;
	reg rst;
	wire [15:0] SRAM_DQ;
	wire [19:0] SRAM_ADDR;
	wire SRAM_LB_N;
	wire SRAM_UB_N;
	wire SRAM_CE_N;
	wire SRAM_OE_N;
	wire SRAM_WE_N;
	wire [23:0] cost;
	wire write_en;
	wire status;
	wire request_in;

	colorizer clrzr(
	.clk(clk),
	.rst(rst),
	.write_en(write_en),
	.SRAM_DQ(SRAM_DQ),
	.SRAM_ADDR(SRAM_ADDR),
	.SRAM_LB_N(SRAM_LB_N),
	.SRAM_UB_N(SRAM_UB_N),
	.SRAM_CE_N(SRAM_CE_N),
	.SRAM_OE_N(SRAM_OE_N),
	.SRAM_WE_N(SRAM_WE_N),
	.status(status),
	.request_in(request_in),
	.cost(cost)
	);
	
initial begin 
clk=0;
forever #5 clk=~clk;
end

initial begin
rst=0;
#50;
rst=1;
#20;
rst=0;
end
	
endmodule