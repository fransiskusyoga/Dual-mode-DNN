//tb_E : testing stagecounter.v
module tb_E();
  parameter Na =8; //varibled
  parameter Nc =4; //variabled
  parameter Nd =16; //variabled
  
  wire [Na-1:0] count_step;
  wire [Nc-1:0] count_stage;
  wire [Nd-1:0] count_epoch;
  wire last_step;
  reg [Nd-1:0] stop_epoch;
  reg clk,rst;
  
  stagecounter SC(
    .count_step(count_step),.count_stage(count_stage),
    .count_epoch(count_epoch),.last_step(last_step),
    .stop_epoch(stop_epoch),.clk(clk),.rst(rst));
         
  initial begin
  //In initial value
    clk = 1'b0;
    rst = 1'b0;
    stop_epoch = 24'd2;
    #300 rst = 1'b1;
    #100 rst = 1'b0;
  end
  
  always #50 clk = ~clk;
  
endmodule
