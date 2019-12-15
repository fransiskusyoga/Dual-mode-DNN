module control_MEMZ(
        rd_stage,wr_stage,rd_lstep,wr_lstep,
        wren_MEMZ,slcwraddr_MEMZ,wrslc_MEMZ,rdslc_MEMZ,
        rst,clk);
  input [3:0] rd_stage,wr_stage;
  input rd_lstep,wr_lstep;
  output wren_MEMZ,slcwraddr_MEMZ;
  output [1:0] wrslc_MEMZ,rdslc_MEMZ;
  input rst,clk;
  
  wire wren_start, wren_stop;
  //below are the signal comninational logic
  //any unlisted conditions are considered as dont care 
  //combinational logic are calculated manually using karnaugh map
  //wren_MEMZ > 1 from end of rd_stage=0 till the end of wr_stage=1
  //            1 from end of rd_stage=2 till the end of wr_stage=3
  //            0 otherwise
  holdsignal  WREN(
    .start(wren_start),.stop(wren_stop),.out(wren_MEMZ),.rst(rst),.clk(clk));
  assign wren_start = &{~rd_stage[3:2],rd_lstep};
  assign wren_stop = wr_lstep && wr_stage[0];
  //wrslc_MEMZ > 0 if wr_stage = 0 ; 2 if wr_stage = 1,3;
  //             1 if wr_stage = 2 ;
  assign wrslc_MEMZ[1] = &{~wr_stage[3:2],wr_stage[0]};
  assign wrslc_MEMZ[0] = (wr_stage==4'd2);
  //rdslc_MEMZ > 0 if rd_stage=5,6 ; 1 if rd_stage = 8,9
  //             2 if rd_stage=3
  assign rdslc_MEMZ[1] = &(~rd_stage[3:2]);
  assign rdslc_MEMZ[0] = rd_stage[3];
  //slcwraddr_MEMZ > 0 if rd_stage= 0 or 2, 1 if rd_stage=1 or 3
  assign slcwraddr_MEMZ =(wr_stage==4'd1)||(wr_stage==4'd3);
endmodule