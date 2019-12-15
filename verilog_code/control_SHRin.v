module control_SHRin (
         rd_stage,
         mode_SHRin,slcin0_SHRin,
         slcaddr_SHRin,rst,clk);
  input [3:0] rd_stage;
  output mode_SHRin, slcin0_SHRin,slcaddr_SHRin; 
  input rst, clk;
  
  reg reg0, reg1;
  //below are the signal comninational logic
  //any unlisted conditions are considered as dont care 
  //combinational logic are calculated manually using karnaugh map
  //mode_SHRin > 0 if rd_stage=0,2,5,7,8,10
  //             1 if rd_stage=1,3,6,9
  assign mode_SHRin = (rd_stage==4'd1)||(rd_stage==4'd3)|| reg0;
  always @(posedge clk) reg0 <=(rd_stage==4'd6)||(rd_stage==4'd9);
  //slcin0_SHRin > 0 if rd_stage=0,2,7,10
  //               1 if rd_stage=5,8
  assign slcin0_SHRin = &{rd_stage[2],~rd_stage[1]} || reg1;
  always @(posedge clk) reg1 <=&{rd_stage[3],~rd_stage[1]};
  //slcaddr_SHRin > 1 from the end of rd_lstep=5 till the end of wr_stage=5
  //                1 from the end of rd_lstep=8 till the end of wr_stage=8
  //                0 from the end of rd_lstep=0 till the end of wr_stage=0
  //                0 from the end of rd_lstep=2 till the end of wr_stage=2
  assign slcaddr_SHRin = rd_stage>4'd5;
endmodule