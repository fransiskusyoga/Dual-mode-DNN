module control_SSHRin(
         rd_stage,mode_SSHRin,rst,clk);
  input[3:0] rd_stage;
  output reg mode_SSHRin;
  input rst,clk;
  //below are the signal comninational logic
  //any unlisted conditions are considered as dont care 
  //combinational logic are calculated manually using karnaugh map
  //mode_SSHRin > 0 if rd_stage=6,9
  //              1 if rd_stage=7,10
  always @(posedge clk)
  begin
    if (rst) mode_SSHRin = 1'b0;
    else mode_SSHRin = &{rd_stage[2],rd_stage[0]} || &{rd_stage[3],rd_stage[1]};
  end 
endmodule