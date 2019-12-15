module control_MEMS(
        rd_stage,wr_stage,
        wren_MEMS,slcwraddr_MEMS,
        wrslc_MEMS,rdslc_MEMS,
        rst,clk);
  input [3:0] rd_stage,wr_stage;
  output reg wren_MEMS;
  output slcwraddr_MEMS;
  output [1:0] wrslc_MEMS,rdslc_MEMS;
  input rst,clk;
  
  wire wire1;
  //below are the signal comninational logic
  //any unlisted conditions are considered as dont care 
  //combinational logic are calculated manually using karnaugh map
  //wren_MEMS > 1 from end of rd_stage=5 till the end of wr_stage=5
  //            1 from end of rd_stage=8 till the end of wr_stage=8
  //            1 from end of wr_stage=3
  //            0 otherwise
  assign wire1 = &{(rd_stage>4'd5),(wr_stage<=4'd5)} ||
                     &{(rd_stage>4'd8),(wr_stage<=4'd8)} ||
                     (wr_stage==4'd3);
  always @(posedge clk) wren_MEMS = wire1;
  //wrslc_MEMS > 
  assign wrslc_MEMS[1] = (wr_stage<4'd4);
  assign wrslc_MEMS[0] = (rd_stage[3]);
  //rdslc_MEMS > 0 if rd_stage=7 ; 1 if rd_stage = 10
  //             2 if rd_stage=10;
  assign rdslc_MEMS[1] = ~rd_stage[1] || &{~rd_stage[3],~rd_stage[0]};
  assign rdslc_MEMS[0] = &{rd_stage[3],rd_stage[1]};
  //slcwraddr_MEMS > 0 if rd_stage=5 ; 1 if rd_stage=6,9
  assign slcwraddr_MEMS = 1'b1;
endmodule