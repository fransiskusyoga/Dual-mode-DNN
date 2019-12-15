module stagecounter(
         count_step,count_stage,count_epoch,
         last_step, stop_epoch,clk,rst);
  parameter Na =8; //varibled
  parameter Nc =4; //variabled
  parameter PowNc = 16;
  parameter Nd =16; //variabled
  
  output [Na-1:0] count_step;
  output [Nc-1:0] count_stage;
  output [Nd-1:0] count_epoch;
  output last_step;
  input [Nd-1:0] stop_epoch;
  input clk,rst;

  wire [Na-1:0] limit_step;
  wire [Nc-1:0] limit_stage;
  wire done_step,done_stage,done_epoch;
  wire last_stage,last_epoch;
  reg [Na-1:0] mem_step [0:PowNc-1];
  cyclecounter#(Na) cntr_step(
    .out(count_step),.limit(limit_step),.clk(clk),
    .rst(rst),.last(last_step),.done(done_step));
  cyclecounter#(Nc) cntr_stage(
    .out(count_stage),.limit(limit_stage),.clk(done_step),
    .rst(rst),.last(last_stage),.done(done_stage));
  cyclecounter#(Nd) cntr_epoch(
    .out(count_epoch),.limit(stop_epoch),.clk(done_stage),
    .rst(rst),.last(last_epoch),.done(done_epoch));
  always @(posedge clk)
  begin
    if (rst)
    begin
      // mem_step[N] <= Y; Y = required step
      mem_step[4'd0] <= 8'd225;
      mem_step[4'd1] <= 8'd3;
      mem_step[4'd2] <= 8'd225;
      mem_step[4'd3] <= 8'd3;
      mem_step[4'd4] <= 8'd39;
      mem_step[4'd5] <= 8'd3;
      mem_step[4'd6] <= 8'd2;
      mem_step[4'd7] <= 8'd224;
      mem_step[4'd8] <= 8'd3;
      mem_step[4'd9] <= 8'd2;
      mem_step[4'd10] <= 8'd224;
      mem_step[4'd11] <= 8'd40;
      mem_step[4'd12] <= 8'd255;
      mem_step[4'd13] <= 8'd255;
      mem_step[4'd14] <= 8'd255;
      mem_step[4'd15] <= 8'd255;
    end
  end
  assign limit_step = mem_step[count_stage];
  assign limit_stage = 4'd11; //Number of stage
endmodule 
