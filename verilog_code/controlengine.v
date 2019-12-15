module controlengine(
         rd_step,wr_step,source_addr,dest_addr,
         wren_MEMZ,slcwraddr_MEMZ,wrslc_MEMZ,rdslc_MEMZ,
         wren_MEMS,slcwraddr_MEMS,wrslc_MEMS,rdslc_MEMS,
         rdslc_MEMW,wrslc_MEMW,wren_MEMW,
         mode_SHRin,slcin0_SHRin,slcaddr_SHRin,
         rst_SHRout,mode_SHRout,slcin_SHRout,
         mode_SSHRin,
         mode_CE,
         slcin_AF,
         slcin_AD,slcinz_AD,
         clear_ERR,stop_ERR,
         status,request_in,
         wren_OU,
         rst,clk);
  localparam Ba =8; 
  localparam Bb =4;
  localparam Bc =16;
  localparam Bm =6; //minimum bit length to represent N
  localparam N =40; //number of multiplier are used
  
  output [Ba-1:0] rd_step,wr_step;
  output [Bm-1:0] source_addr,dest_addr;
  output wren_MEMZ,slcwraddr_MEMZ;
  output [1:0] wrslc_MEMZ,rdslc_MEMZ;
  output wren_MEMS,slcwraddr_MEMS;
  output [1:0] wrslc_MEMS,rdslc_MEMS;
  output [1:0] rdslc_MEMW,wrslc_MEMW;
  output wren_MEMW;
  output mode_SHRin,slcin0_SHRin,slcaddr_SHRin;
  output rst_SHRout,mode_SHRout,slcin_SHRout;
  output mode_SSHRin;
  output mode_CE;
  output slcin_AF;
  output slcin_AD,slcinz_AD;
  output clear_ERR,stop_ERR;
  output status,request_in;
  output wren_OU;
  input rst, clk;
  
  wire [Bb-1:0] rd_stage,wr_stage;
  wire [Bc-1:0] rd_epoch;
  wire rd_lstep, wr_lstep;
  wire rst_wr;
  wire slc_source_addr;
  
  wire rst_ccntr;
  
  //Two stage counter to indicate the read posistion
  //and write position
  stagecounter SCRead(    //read position indocator
    .count_step(rd_step),.count_stage(rd_stage),
    .count_epoch(rd_epoch),.last_step(rd_lstep),
    .stop_epoch(16'd60000),.clk(clk),.rst(rst));
  stagecounter SCWrite(    //write position inidcator
    .count_step(wr_step),.count_stage(wr_stage),
    .count_epoch(),.last_step(wr_lstep),
    .stop_epoch(16'd60000),.clk(clk),.rst(rst_wr));
  //Delay to shyncronize SCRead and SCWrite
  delay #(1,40) rst_delay(.in(rst),.out(rst_wr),.clk(clk));
  
  //Generate source_addr and dest_addr signal
  //Counter that count 0-39 everytime the module reseted
  cyclecounter #(Bm) CCntr(
    .out(dest_addr),.limit(6'd39),
    .clk(clk),.rst(rst_ccntr),.last(),.done());
  assign source_addr = slc_source_addr ? {6'd39}:dest_addr;
  control_CCntr cntr_ccntr(
    .rd_stage(rd_stage),.rd_lstep(rd_lstep),
    .wr_stage(wr_stage),
    .rst_in(rst),.rst_out(rst_ccntr),
    .slc_source_addr(slc_source_addr));
  
  //Control Units
  //Generate signal for MEMZ
  control_MEMZ CMEMZ(
    .rd_stage(rd_stage),.wr_stage(wr_stage),.rd_lstep(rd_lstep),.wr_lstep(wr_lstep),
    .wren_MEMZ(wren_MEMZ),.slcwraddr_MEMZ(slcwraddr_MEMZ),
    .wrslc_MEMZ(wrslc_MEMZ),.rdslc_MEMZ(rdslc_MEMZ),
    .rst(rst),.clk(clk));
  
  //Generate signal for MEMS
  control_MEMS CMEMS(
    .rd_stage(rd_stage),.wr_stage(wr_stage),
    .wren_MEMS(wren_MEMS),.slcwraddr_MEMS(slcwraddr_MEMS),
    .wrslc_MEMS(wrslc_MEMS),.rdslc_MEMS(rdslc_MEMS),
    .rst(rst),.clk(clk));
  
  //Generate signal for MEMW
  control_MEMW CMEMW(
    .rd_stage(rd_stage),.wren_MEMW(wren_MEMW),
    .rdslc_MEMW(rdslc_MEMW),.wrslc_MEMW(wrslc_MEMW),
    .rst(rst), .clk(clk));
    
  //Generate signal for SHRin
  control_SHRin CSHRin(
    .rd_stage(rd_stage),
    .mode_SHRin(mode_SHRin),.slcin0_SHRin(slcin0_SHRin),
    .slcaddr_SHRin(slcaddr_SHRin),
    .rst(rst), .clk(clk));
    
  //Generate signal for SHRout
  control_SHRout CSHRout(
    .rd_stage(rd_stage),.wr_stage(wr_stage),.rd_lstep(rd_lstep),.rst(rst),
    .rst_SHRout(rst_SHRout),.mode_SHRout(mode_SHRout),
    .slcin_SHRout(slcin_SHRout));
  
  //Generate signal for SSHRin  
  control_SSHRin CSSHRIN(
    .rd_stage(rd_stage),.mode_SSHRin(mode_SSHRin),
    .rst(rst),.clk(clk));
  
  //Generate signal for CE control engine
  control_CE CCE(
    .rd_stage(rd_stage),.mode_CE(mode_CE),
    .rst(rst),.clk(clk));
   
  //Generate signal for AFunc
  control_AFunc CAFunc(.rd_stage(rd_stage),.slcin_AF(slcin_AF));
   
  //Generate signal for ADeriv
  control_ADeriv CADeriv(
    .rd_stage(rd_stage),.slcin_AD(slcin_AD),.slcinz_AD(slcinz_AD));
    
  //Generate signal for ERR
  assign clear_ERR = wr_lstep && (wr_stage==4'd2);
  assign stop_ERR = (wr_stage!=4'd3);
  
  //Generate output signal
  assign request_in = rd_stage>=4'd10;
  assign status = wr_stage>=4'd4;
  assign wren_OU = (wr_stage==4'd3);
endmodule
