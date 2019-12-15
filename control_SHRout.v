module control_SHRout(
         rd_stage,wr_stage,rd_lstep,rst,
         rst_SHRout,mode_SHRout,
         slcin_SHRout);
  input [3:0] rd_stage,wr_stage;
  input rd_lstep, rst;
  output rst_SHRout,mode_SHRout,slcin_SHRout;
  wire temp1;
  //below are the signal comninational logic
  //any unlisted conditions are considered as dont care 
  //combinational logic are calculated manually using karnaugh map
  //rst_SHRout > don't reset output register on 0'th and 2'nd stage
  assign temp1 = (rd_stage==4'd0) || (rd_stage==4'd2);
  assign rst_SHRout = rst || (rd_lstep && !temp1);
  //mode_SHRout > 0 indicating acumulation operation
  //              1 inidcating systolic operation
  //systolic operation on rd_stage=1 or 3
  //normal operation on other stages
  //(except 4th and 11th stage which actually dont care)
  assign mode_SHRout = (rd_stage==4'd1)||(rd_stage==4'd3);
  //slcin_SHRout > 0 if rd_stage=1; 1 if rd_stage = 3
  assign slcin_SHRout = rd_stage[1];
endmodule