//tb_Z : testing NNCore.v
// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module tb_Z();
  reg [15:0] data;
  reg [7:0] wraddress;
  reg wren;
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
    .data(data),
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
  
  
  initial begin
  data = 16'd0;
  wraddress = 8'd0;
  wren = 1'b0;
  sprdata = 16'd0;
  spraddress = 2'b0;
  spren = 1'b0;
  learn_rate = 3'd2;
  back_en = 1'b1;  
  rst = 1'b0;
  clk = 1'b0;
  #300 rst = 1'b1;
  #100 rst = 1'b0;
  end
  
  always #50 clk = !clk;
endmodule