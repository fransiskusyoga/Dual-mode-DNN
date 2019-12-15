//tb_F : testing controlengine.v
module tb_F();
  parameter Ba =8; 
  parameter Bm =6; //minimum bit length to represent N

  reg   rst,clk;
  wire [Ba-1:0] rd_step,wr_step;
  wire [Bm-1:0] source_addr,dest_addr;
  wire wren;
  
  controlengine CE(
         rd_step,wr_step,source_addr,dest_addr,
         wren,rst,clk);
  
  initial begin
  clk = 1'b0;
  rst = 1'b0;
  #300 rst = 1'b1;
  #100 rst = 1'b0;
  end
  
  always #50 clk = !clk;
  
endmodule
