module NN_Core( 
    input [15:0] data,     //15x15 pixel input data
    input [7:0] wraddress, //address of input data
    input wren,            //enable data input
    input [15:0] sprdata,  //3 supervisor value
    input [1:0] spraddress,//address of supervisor value
    input spren,           //enable dupervisor data input
    input [2:0]learn_rate, //learning rate = 2^(2-learn_rate)
    input back_en,         //1=forward and backward, 0 >forward only
    output status,         //0=forward prop is being processed, 1=back prop
    output request_in,     //inputing datas are only allowed if request_in = 1
    output [15:0] q0,      //1'st output data
    output [15:0] q1,      //2'nd output data
    output [15:0] q2,      //3'rd output data
    output [23:0] cost,    //output cost value
    input rst,             //reset signal
    input clk);            //clock signal
	 //output [N*Ba-1:0] a_bus,
	 //output [N*Ba-1:0] x_bus,
	 //output [N*Ba-1:0] out_bus,
	 //output [N*Bb-1:0] b_bus,
	 //output [N*Ba-1:0] s_bus);
	 

  
  /**********LOCAL PARAMETER**********/
  localparam N= 40; 
  localparam Ba= 24;
  localparam Bb= 16;
  localparam Bm=6; 
  localparam Bcntr=8;
  
  /**********DATA WIRES**********/
  //Input data
  wire [Bb-1:0] in;
  //Main data bus
  wire [N*Ba-1:0] a_bus,x_bus,out_bus;
  wire [N*Bb-1:0] b_bus;
  wire [N*Ba-1:0] s_bus;
  //Read and wirte wire address signa;
  wire [Bm-1:0] source_addr,dest_addr;
  wire [Bcntr-1:0] cntr;
  //SHRin wire
  wire [Bb-1:0] in0_SHRin;
  wire [Bm-1:0] addr_SHRin;
  //SHRout wire
  wire [Ba-1:0] out1;
  wire [Ba-1:0] in_SHRout;
  //Memoru Z and S output wire
  wire [Ba-1:0] outZ,outS;
  wire [Bm-1:0] wraddr_MEMZ,wraddr_MEMS;
  //Activation function wire
  wire [Ba-1:0] inAF,inzAD;
  wire [Bb-1:0] outAF;
  //Activation derivation and Error wire
  wire [Bb-1:0] out_ERR;
  wire [Ba-1:0] learn_ERR,final_ERR;
  wire [Ba-1:0] inAD,outAD;
  //Buffered data
  wire [Bm-1:0] buff_dest_addr;
  wire [Ba-1:0] buff_outAD, buff_out1;
  wire [Bcntr-1:0] buff_cntr;
  
  /**********CONTROL SIGNAL WIRES**********/
  wire [1:0] rdslc_MEMW,wrslc_MEMW;  //MEMW
  wire wren_MEMW;
  wire wren_MEMZ,slcwraddr_MEMZ;     //MEMZ
  wire [1:0] wrslc_MEMZ, rdslc_MEMZ;
  wire wren_MEMS, slcwraddr_MEMS;    //MEMS
  wire [1:0] wrslc_MEMS, rdslc_MEMS;
  wire mode_SHRin,slcin0_SHRin;      //SHRin
  wire slcaddr_SHRin;
  wire rst_SHRout,mode_SHRout;       //SHRout
  wire slcin_SHRout;
  wire mode_SSHRin;                  //SSHRin
  wire mode_CE;                      //CE Calculation engine
  wire slcin_AF;                     //AF Activation function
  wire slcin_AD,slcinz_AD;           //AD Derivatife function 
  wire clear_ERR,stop_ERR;            //ERR (Error function)       //edit for further devp 
  wire wren_OU;
  
  /**********MAIN PROCESSING**********/
  //Input shift register
  shiftregin #(Bb) SHRin(
    .in0(in0_SHRin),.in1(outAF),.out(b_bus),.addr(addr_SHRin),     //edit for further devp (addr)
    .mode(mode_SHRin),.rst(rst),.clk(clk));
  assign in0_SHRin = slcin0_SHRin ? outS[20:5] : in;
  assign addr_SHRin = slcaddr_SHRin ? buff_dest_addr : dest_addr;
  //output shift register
  shiftregout #(Ba) SHRout(
    .ins(out_bus),.in(in_SHRout),
    .outs(x_bus),.out1(out1),.out2(),
    .addr1(source_addr),.addr2({Bm{1'b0}}),
    .mode(mode_SHRout),.rst(rst_SHRout),.clk(clk));
  assign in_SHRout = slcin_SHRout ? outZ : {Ba{1'b0}};
  
  //shift register for memory s data
  shiftregin #(Ba) SSHRin( //MEMS Shift reg in
    .in0(outS),.in1(outS),.out(s_bus),.addr(buff_cntr[5:0]),   //edit for further devp (addr)
    .mode(mode_SSHRin),.rst(rst),.clk(clk));
  
  //Main DSP cluster
  calcengine CE( 
    .a0_bus(a_bus),.a1_bus(s_bus),.b_bus(b_bus),
    .x0_bus(x_bus),.x1_bus(a_bus),.out_bus(out_bus),
    .mode(mode_CE),.rst(rst),.clk(clk));
  
  /**********ACTIVATION FUNCTION**********/
  //forward function
  actifunction AFunc(
    .in(inAF),.out(outAF));
  assign inAF = slcin_AF ? outZ : out1;                                 //edit for further devp
  //derivation function
  actideriv ADeriv(
    .in(inAD),.z(inzAD),.out(outAD));
  assign inAD =  slcin_AD ? buff_out1 : final_ERR; 
  assign inzAD = slcinz_AD ? outZ : out1;
  
  /********** BUFFERED DATAS***********/
  buffer #(Ba) BUFF_AD(
    .in(outAD),.out(buff_outAD),.rst(rst),.clk(clk));
  buffer #(Ba) BUFF_out1(
    .in(out1),.out(buff_out1),.rst(rst),.clk(clk));
  buffer #(Bm) BUFF_dest(
    .in(dest_addr),.out(buff_dest_addr),.rst(rst),.clk(clk));
  buffer #(Bcntr) BUFF_cntr(
    .in(cntr),.out(buff_cntr),.rst(rst),.clk(clk));
  
  /**********LEARNING RATE AND ERROR**********/
  //Error to supervisor value
  error ERR(
    .in(outAF),.rdaddr(buff_dest_addr[1:0]),.out(out_ERR),
    .data(sprdata), .wraddr(spraddress),.wren(spren),
    .cost(cost),.clear(clear_ERR),.stop(stop_ERR),
    .rst(rst),.clk(clk));
  //Learning rate choose
  mux8in #(Ba) MUXLearn(
    .in0({{1{out_ERR[15]}} , out_ERR , {7{1'b0}}}),
    .in1({{2{out_ERR[15]}} , out_ERR , {6{1'b0}}}),
    .in2({{3{out_ERR[15]}} , out_ERR , {5{1'b0}}}),
    .in3({{4{out_ERR[15]}} , out_ERR , {4{1'b0}}}),
    .in4({{5{out_ERR[15]}} , out_ERR , {3{1'b0}}}),
    .in5({{6{out_ERR[15]}} , out_ERR , {2{1'b0}}}),
    .in6({{7{out_ERR[15]}} , out_ERR , {1{1'b0}}}),
    .in7({{8{out_ERR[15]}} , out_ERR}),
    .out(learn_ERR),.slc(learn_rate));
  //If backward is not active than error = 0
  assign final_ERR = back_en ? learn_ERR : {Ba{1'b0}};
  
  /**********ALL MEMORY COMPONENT**********/
  //Weight memory bank
  memory_w MEMW(
    .in(out_bus),.out(a_bus),.rdaddr(cntr),
    .wraddr(buff_cntr),.rdslc(rdslc_MEMW),.wrslc(wrslc_MEMW),
    .rst(rst),.wren(wren_MEMW),.clk(clk));
  //Z memory
  memory_z MEMZ( 
    .in(out1),.rdout(outZ),.wrout(),
    .rdaddr(dest_addr),.rdslc(rdslc_MEMZ),
    .wraddr(wraddr_MEMZ),.wrslc(wrslc_MEMZ),.wren(wren_MEMZ),
    .clk(clk));
  assign wraddr_MEMZ = slcwraddr_MEMZ ? buff_dest_addr : dest_addr;
  //S memory
  memory_s MEMS(         
    .in(outAD),.rdout(outS),.wrout(),
    .rdaddr(cntr[5:0]),.rdslc(rdslc_MEMS),
    .wraddr(wraddr_MEMS),.wrslc(wrslc_MEMS),.wren(wren_MEMS),
    .clk(clk));
  assign wraddr_MEMS = slcwraddr_MEMS ? buff_dest_addr : dest_addr;
  //Input memory
  ram_in INP(
    .clock(clk),.data(data),.rdaddress(cntr),
    .wraddress(wraddress),.wren(wren),.q(in));
  
  /**********PHERIPERAL CONTROLLER**********/
  controlengine CTRLEng(
    .rd_step(cntr),.wr_step(),
    .source_addr(source_addr),.dest_addr(dest_addr),
    .wren_MEMZ(wren_MEMZ),.slcwraddr_MEMZ(slcwraddr_MEMZ),      //MEMZ control signal
    .wrslc_MEMZ(wrslc_MEMZ),.rdslc_MEMZ(rdslc_MEMZ),
    .wren_MEMS(wren_MEMS),.slcwraddr_MEMS(slcwraddr_MEMS),      //MEMS control signal
    .wrslc_MEMS(wrslc_MEMS),.rdslc_MEMS(rdslc_MEMS),
    .rdslc_MEMW(rdslc_MEMW),.wrslc_MEMW(wrslc_MEMW),            //MEMW control signal
    .wren_MEMW(wren_MEMW),
    .mode_SHRin(mode_SHRin),.slcin0_SHRin(slcin0_SHRin),        //SHRin control signal
    .slcaddr_SHRin(slcaddr_SHRin),
    .rst_SHRout(rst_SHRout),.mode_SHRout(mode_SHRout),          //SHRout control signal
    .slcin_SHRout(slcin_SHRout),
    .mode_SSHRin(mode_SSHRin),                                  //SSHRin control signal
    .mode_CE(mode_CE),                                          //CE control signal
    .slcin_AF(slcin_AF),                                        //AF control signal
    .slcin_AD(slcin_AD),.slcinz_AD(slcinz_AD),                  //AD control signal
    .clear_ERR(clear_ERR),.stop_ERR(stop_ERR),
    .status(status),.request_in(request_in),
    .wren_OU(wren_OU),
    .rst(rst),.clk(clk));
  
  /**********OUTPUT MODULE**********/
  output_module OU(
    .in(outAF),.addr(buff_dest_addr[1:0]),
    .out0(q0), .out1(q1), .out2(q2),
    .wren(wren_OU), .rst(rst), .clk(clk));
endmodule