module control_CE(
         rd_stage,mode_CE,rst,clk);
  input [3:0] rd_stage;
  output reg mode_CE;
  input rst,clk;
  //below are the signal comninational logic
  //any unlisted conditions are considered as dont care 
  //combinational logic are calculated manually using karnaugh map
  //mode_CE > 0 if rd_stage=0,1,2,3,4,5,8,11
  //          1 if rd_stage=6,7,9,10
  always @(posedge clk)
    mode_CE = &{rd_stage[2:1]} || (rd_stage==4'd9)|| (rd_stage==4'd10);
endmodule