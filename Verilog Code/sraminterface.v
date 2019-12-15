module sraminterface(
    SRAM_ADDR,SRAM_CE_N,SRAM_DQ,SRAM_LB_N,SRAM_OE_N,
    SRAM_UB_N,SRAM_WE_N, R,G,B,rst, clk, write);
  output	    [19:0]		SRAM_ADDR;
	output		          		SRAM_CE_N;
	output 		    [15:0]		SRAM_DQ;
	output		          		SRAM_LB_N;
	output		          		SRAM_OE_N;
	output		          		SRAM_UB_N;
	output		          		SRAM_WE_N;
  input [7:0] R,G,B;
  input write, clk, rst;
  
  //Posedge finder
  wire posedge_write;
  reg write_reg =1'b0;
  always @(posedge clk)
      write_reg <= write;
  assign posedge_write = write & ~write_reg;
    
  //Counter
  reg [1:0]countA = 1'b0;
  always @(posedge clk)
  begin
    if (rst || posedge_write)
      countA <= 1'b0;
    else
    begin
      if (countA==2'd3) countA <= 2'd3;
      else countA <= countA+2'd1;
    end
  end
  
  //Adress Counting
  reg [19:0] address = 20'h00000;
  always @(posedge clk)
  begin
    if (rst) address <= 20'h00000;
    else 
    begin
      if ((countA!=2'b11)&&write)
      begin 
        if(address == 20'hFFFFF) address <= 20'hFFFFF;
        else address <= address + 20'h00001;
      end
    end
  end
   
  wire [7:0] out;  
  assign out = countA[1] ? B : (countA[0] ? G : R);
  wire c1;
  assign c1 = countA[1];
  wire c0;
  assign c0 = countA[0];
  
  sram_controller SRAM(
		.address(address),       //  avalon_sram_slave.address
		.byteenable(2'b11),    //                   .byteenable
		.read(1'b0),          //                   .read
		.write(write),         //                   .write
		.writedata({8'b0,out}),     //                   .writedata
		.readdata(),      //                   .readdata
		.readdatavalid(), //                   .readdatavalid
		.clk(clk),           //                clk.clk
		.SRAM_DQ(SRAM_DQ),       // external_interface.DQ
		.SRAM_ADDR(SRAM_ADDR),     //                   .ADDR
		.SRAM_LB_N(SRAM_LB_N),     //                   .LB_N
		.SRAM_UB_N(SRAM_UB_N),     //                   .UB_N
		.SRAM_CE_N(SRAM_CE_N),     //                   .CE_N
		.SRAM_OE_N(SRAM_OE_N),     //                   .OE_N
		.SRAM_WE_N(SRAM_WE_N),     //                   .WE_N
		.reset(rst)          //              reset.reset
	);
endmodule