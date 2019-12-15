module control_CCntr (
         rd_stage,wr_stage,rd_lstep,
         rst_in,rst_out,slc_source_addr);
  input [3:0] rd_stage,wr_stage;
  input rd_lstep,rst_in;
  output rst_out;
  output slc_source_addr;
  wire yes_rst;  
  //below are the signal comninational logic
  //any unlisted conditions are considered as dont care 
  //combinational logic are calculated manually using karnaugh map
  //yes_rst > 0 id rd_stage=1,3,6,9; 1 if rd_stage=0,2,4,5,8
  assign yes_rst = (rd_stage==4'd0)||(rd_stage==4'd2)||(rd_stage==4'd4)||
                   (rd_stage==4'd5)||(rd_stage==4'd8);
  assign rst_out = (rd_lstep && yes_rst) || rst_in;
  //slc_source_addr > 1 if rd_lstep=1,3 ; 0 otherwise
  assign slc_source_addr = (wr_stage==4'd1)||(wr_stage==4'd3);
endmodule