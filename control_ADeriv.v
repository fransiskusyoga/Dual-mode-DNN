module control_ADeriv(
         rd_stage,slcin_AD,slcinz_AD);
  input [3:0] rd_stage;
  output slcin_AD,slcinz_AD;
  //below are the signal comninational logic
  //any unlisted conditions are considered as dont care 
  //combinational logic are calculated manually using karnaugh map
  //slcin_AD > 0 if rd_stage=5 ; 1 if rd_stage=6,9
  assign slcin_AD = |{rd_stage[1],rd_stage[3]};
  //slcinz_AD > 0 if rd_stage=5 ; 1 if rd_stage=6,9
  assign slcinz_AD = |{rd_stage[1],rd_stage[3]};
endmodule