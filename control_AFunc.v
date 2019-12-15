module control_AFunc(
         rd_stage,slcin_AF);
  input [3:0] rd_stage;
  output slcin_AF;
  //below are the signal comninational logic
  //any unlisted conditions are considered as dont care 
  //combinational logic are calculated manually using karnaugh map
  //slcin_AF > 0 if rd_stage=0,1,2,3,5;  1 if rd_stage=6,9
  assign slcin_AF = &{rd_stage[2:1]} || rd_stage[3];
endmodule