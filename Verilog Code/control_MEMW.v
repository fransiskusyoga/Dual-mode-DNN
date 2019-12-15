module control_MEMW(
         rd_stage, rdslc_MEMW, wrslc_MEMW, wren_MEMW, rst, clk);
  input [3:0] rd_stage;
  output [1:0] rdslc_MEMW;
  output reg  [1:0] wrslc_MEMW = 2'b0;
  output reg wren_MEMW = 1'b0;
  input rst, clk;
  //below are the signal comninational logic
  //any unlisted conditions are considered as dont care 
  //combinational logic are calculated manually using karnaugh map
  //rdslc_MEMW > 0 if rd_stage=0,7 ; 1 if rd_stage=1,5,6;
  //             2 if rd_stage=2,10 ; 3 if rd_stage=3,8,9;
  assign rdslc_MEMW[1] = rd_stage[3] || &{!rd_stage[2],rd_stage[1]}; //1 if rd_stage=1,3, or more than 4
  assign rdslc_MEMW[0] = (rd_stage!=4'd0) && (rd_stage!=4'd2) &&
                   (rd_stage!=4'd7) && (rd_stage!=4'd10) && (rd_stage!=4'd15);
  always @(posedge clk)
  begin
    if (rst)
    begin
      wrslc_MEMW <= 2'b0;
      wren_MEMW <= 1'b0; 
    end else
    begin
    //wrslc_MEMW >0 if rd_stage=7 ; 1 if rd_stage=6;
    //            2 if rd_stage=10 ; 3 if rd_stage=9;
      wrslc_MEMW <= rdslc_MEMW;
    //wren_MEMW >1 if rd_stage=6,7,9,10s
    //           0 otherwise
      wren_MEMW <= (rd_stage==4'd6) || (rd_stage==4'd7) ||
                   (rd_stage==4'd9) || (rd_stage==4'd10);
    end
  end
endmodule