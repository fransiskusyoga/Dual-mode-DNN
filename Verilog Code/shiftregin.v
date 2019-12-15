module shiftregin #(
         parameter B)( //bit length
         in0, in1, out, addr, mode, rst, clk);
  localparam N = 40; //number of dsp unit (perceptron)
  input [B-1:0] in0, in1;
  output [N*B-1:0] out;
  input [5:0] addr;
  input mode,rst,clk;
  
  wire [63:0] wrenbus;
  wire [39:0] rstbus;
  wire [39:0] modebus;
  wire [N*B-1:0] regvalbus;
   
  decode6to64 DC(.en(1'b1),.in(addr),.out(wrenbus));
  
  //The other register
  regunitin #(B) REG1(.in0(regvalbus[1*B-1:0*B]),.in1(in1),.out(out[2*B-1:1*B]),.regval(regvalbus[2*B-1:1*B]),.slcin(modebus[0]&&wrenbus[1]),.stop_in(modebus[0]),.stop_out(modebus[1]),.rst_in(rstbus[0]),.rst_out(rstbus[1]),.clk(clk));
  regunitin #(B) REG2(.in0(regvalbus[2*B-1:1*B]),.in1(in1),.out(out[3*B-1:2*B]),.regval(regvalbus[3*B-1:2*B]),.slcin(modebus[1]&&wrenbus[2]),.stop_in(modebus[1]),.stop_out(modebus[2]),.rst_in(rstbus[1]),.rst_out(rstbus[2]),.clk(clk));
  regunitin #(B) REG3(.in0(regvalbus[3*B-1:2*B]),.in1(in1),.out(out[4*B-1:3*B]),.regval(regvalbus[4*B-1:3*B]),.slcin(modebus[2]&&wrenbus[3]),.stop_in(modebus[2]),.stop_out(modebus[3]),.rst_in(rstbus[2]),.rst_out(rstbus[3]),.clk(clk));
  regunitin #(B) REG4(.in0(regvalbus[4*B-1:3*B]),.in1(in1),.out(out[5*B-1:4*B]),.regval(regvalbus[5*B-1:4*B]),.slcin(modebus[3]&&wrenbus[4]),.stop_in(modebus[3]),.stop_out(modebus[4]),.rst_in(rstbus[3]),.rst_out(rstbus[4]),.clk(clk));
  regunitin #(B) REG5(.in0(regvalbus[5*B-1:4*B]),.in1(in1),.out(out[6*B-1:5*B]),.regval(regvalbus[6*B-1:5*B]),.slcin(modebus[4]&&wrenbus[5]),.stop_in(modebus[4]),.stop_out(modebus[5]),.rst_in(rstbus[4]),.rst_out(rstbus[5]),.clk(clk));
  regunitin #(B) REG6(.in0(regvalbus[6*B-1:5*B]),.in1(in1),.out(out[7*B-1:6*B]),.regval(regvalbus[7*B-1:6*B]),.slcin(modebus[5]&&wrenbus[6]),.stop_in(modebus[5]),.stop_out(modebus[6]),.rst_in(rstbus[5]),.rst_out(rstbus[6]),.clk(clk));
  regunitin #(B) REG7(.in0(regvalbus[7*B-1:6*B]),.in1(in1),.out(out[8*B-1:7*B]),.regval(regvalbus[8*B-1:7*B]),.slcin(modebus[6]&&wrenbus[7]),.stop_in(modebus[6]),.stop_out(modebus[7]),.rst_in(rstbus[6]),.rst_out(rstbus[7]),.clk(clk));
  regunitin #(B) REG8(.in0(regvalbus[8*B-1:7*B]),.in1(in1),.out(out[9*B-1:8*B]),.regval(regvalbus[9*B-1:8*B]),.slcin(modebus[7]&&wrenbus[8]),.stop_in(modebus[7]),.stop_out(modebus[8]),.rst_in(rstbus[7]),.rst_out(rstbus[8]),.clk(clk));
  regunitin #(B) REG9(.in0(regvalbus[9*B-1:8*B]),.in1(in1),.out(out[10*B-1:9*B]),.regval(regvalbus[10*B-1:9*B]),.slcin(modebus[8]&&wrenbus[9]),.stop_in(modebus[8]),.stop_out(modebus[9]),.rst_in(rstbus[8]),.rst_out(rstbus[9]),.clk(clk));
  regunitin #(B) REG10(.in0(regvalbus[10*B-1:9*B]),.in1(in1),.out(out[11*B-1:10*B]),.regval(regvalbus[11*B-1:10*B]),.slcin(modebus[9]&&wrenbus[10]),.stop_in(modebus[9]),.stop_out(modebus[10]),.rst_in(rstbus[9]),.rst_out(rstbus[10]),.clk(clk));
  regunitin #(B) REG11(.in0(regvalbus[11*B-1:10*B]),.in1(in1),.out(out[12*B-1:11*B]),.regval(regvalbus[12*B-1:11*B]),.slcin(modebus[10]&&wrenbus[11]),.stop_in(modebus[10]),.stop_out(modebus[11]),.rst_in(rstbus[10]),.rst_out(rstbus[11]),.clk(clk));
  regunitin #(B) REG12(.in0(regvalbus[12*B-1:11*B]),.in1(in1),.out(out[13*B-1:12*B]),.regval(regvalbus[13*B-1:12*B]),.slcin(modebus[11]&&wrenbus[12]),.stop_in(modebus[11]),.stop_out(modebus[12]),.rst_in(rstbus[11]),.rst_out(rstbus[12]),.clk(clk));
  regunitin #(B) REG13(.in0(regvalbus[13*B-1:12*B]),.in1(in1),.out(out[14*B-1:13*B]),.regval(regvalbus[14*B-1:13*B]),.slcin(modebus[12]&&wrenbus[13]),.stop_in(modebus[12]),.stop_out(modebus[13]),.rst_in(rstbus[12]),.rst_out(rstbus[13]),.clk(clk));
  regunitin #(B) REG14(.in0(regvalbus[14*B-1:13*B]),.in1(in1),.out(out[15*B-1:14*B]),.regval(regvalbus[15*B-1:14*B]),.slcin(modebus[13]&&wrenbus[14]),.stop_in(modebus[13]),.stop_out(modebus[14]),.rst_in(rstbus[13]),.rst_out(rstbus[14]),.clk(clk));
  regunitin #(B) REG15(.in0(regvalbus[15*B-1:14*B]),.in1(in1),.out(out[16*B-1:15*B]),.regval(regvalbus[16*B-1:15*B]),.slcin(modebus[14]&&wrenbus[15]),.stop_in(modebus[14]),.stop_out(modebus[15]),.rst_in(rstbus[14]),.rst_out(rstbus[15]),.clk(clk));
  regunitin #(B) REG16(.in0(regvalbus[16*B-1:15*B]),.in1(in1),.out(out[17*B-1:16*B]),.regval(regvalbus[17*B-1:16*B]),.slcin(modebus[15]&&wrenbus[16]),.stop_in(modebus[15]),.stop_out(modebus[16]),.rst_in(rstbus[15]),.rst_out(rstbus[16]),.clk(clk));
  regunitin #(B) REG17(.in0(regvalbus[17*B-1:16*B]),.in1(in1),.out(out[18*B-1:17*B]),.regval(regvalbus[18*B-1:17*B]),.slcin(modebus[16]&&wrenbus[17]),.stop_in(modebus[16]),.stop_out(modebus[17]),.rst_in(rstbus[16]),.rst_out(rstbus[17]),.clk(clk));
  regunitin #(B) REG18(.in0(regvalbus[18*B-1:17*B]),.in1(in1),.out(out[19*B-1:18*B]),.regval(regvalbus[19*B-1:18*B]),.slcin(modebus[17]&&wrenbus[18]),.stop_in(modebus[17]),.stop_out(modebus[18]),.rst_in(rstbus[17]),.rst_out(rstbus[18]),.clk(clk));
  regunitin #(B) REG19(.in0(regvalbus[19*B-1:18*B]),.in1(in1),.out(out[20*B-1:19*B]),.regval(regvalbus[20*B-1:19*B]),.slcin(modebus[18]&&wrenbus[19]),.stop_in(modebus[18]),.stop_out(modebus[19]),.rst_in(rstbus[18]),.rst_out(rstbus[19]),.clk(clk));
  regunitin #(B) REG20(.in0(regvalbus[20*B-1:19*B]),.in1(in1),.out(out[21*B-1:20*B]),.regval(regvalbus[21*B-1:20*B]),.slcin(modebus[19]&&wrenbus[20]),.stop_in(modebus[19]),.stop_out(modebus[20]),.rst_in(rstbus[19]),.rst_out(rstbus[20]),.clk(clk));
  regunitin #(B) REG21(.in0(regvalbus[21*B-1:20*B]),.in1(in1),.out(out[22*B-1:21*B]),.regval(regvalbus[22*B-1:21*B]),.slcin(modebus[20]&&wrenbus[21]),.stop_in(modebus[20]),.stop_out(modebus[21]),.rst_in(rstbus[20]),.rst_out(rstbus[21]),.clk(clk));
  regunitin #(B) REG22(.in0(regvalbus[22*B-1:21*B]),.in1(in1),.out(out[23*B-1:22*B]),.regval(regvalbus[23*B-1:22*B]),.slcin(modebus[21]&&wrenbus[22]),.stop_in(modebus[21]),.stop_out(modebus[22]),.rst_in(rstbus[21]),.rst_out(rstbus[22]),.clk(clk));
  regunitin #(B) REG23(.in0(regvalbus[23*B-1:22*B]),.in1(in1),.out(out[24*B-1:23*B]),.regval(regvalbus[24*B-1:23*B]),.slcin(modebus[22]&&wrenbus[23]),.stop_in(modebus[22]),.stop_out(modebus[23]),.rst_in(rstbus[22]),.rst_out(rstbus[23]),.clk(clk));
  regunitin #(B) REG24(.in0(regvalbus[24*B-1:23*B]),.in1(in1),.out(out[25*B-1:24*B]),.regval(regvalbus[25*B-1:24*B]),.slcin(modebus[23]&&wrenbus[24]),.stop_in(modebus[23]),.stop_out(modebus[24]),.rst_in(rstbus[23]),.rst_out(rstbus[24]),.clk(clk));
  regunitin #(B) REG25(.in0(regvalbus[25*B-1:24*B]),.in1(in1),.out(out[26*B-1:25*B]),.regval(regvalbus[26*B-1:25*B]),.slcin(modebus[24]&&wrenbus[25]),.stop_in(modebus[24]),.stop_out(modebus[25]),.rst_in(rstbus[24]),.rst_out(rstbus[25]),.clk(clk));
  regunitin #(B) REG26(.in0(regvalbus[26*B-1:25*B]),.in1(in1),.out(out[27*B-1:26*B]),.regval(regvalbus[27*B-1:26*B]),.slcin(modebus[25]&&wrenbus[26]),.stop_in(modebus[25]),.stop_out(modebus[26]),.rst_in(rstbus[25]),.rst_out(rstbus[26]),.clk(clk));
  regunitin #(B) REG27(.in0(regvalbus[27*B-1:26*B]),.in1(in1),.out(out[28*B-1:27*B]),.regval(regvalbus[28*B-1:27*B]),.slcin(modebus[26]&&wrenbus[27]),.stop_in(modebus[26]),.stop_out(modebus[27]),.rst_in(rstbus[26]),.rst_out(rstbus[27]),.clk(clk));
  regunitin #(B) REG28(.in0(regvalbus[28*B-1:27*B]),.in1(in1),.out(out[29*B-1:28*B]),.regval(regvalbus[29*B-1:28*B]),.slcin(modebus[27]&&wrenbus[28]),.stop_in(modebus[27]),.stop_out(modebus[28]),.rst_in(rstbus[27]),.rst_out(rstbus[28]),.clk(clk));
  regunitin #(B) REG29(.in0(regvalbus[29*B-1:28*B]),.in1(in1),.out(out[30*B-1:29*B]),.regval(regvalbus[30*B-1:29*B]),.slcin(modebus[28]&&wrenbus[29]),.stop_in(modebus[28]),.stop_out(modebus[29]),.rst_in(rstbus[28]),.rst_out(rstbus[29]),.clk(clk));
  regunitin #(B) REG30(.in0(regvalbus[30*B-1:29*B]),.in1(in1),.out(out[31*B-1:30*B]),.regval(regvalbus[31*B-1:30*B]),.slcin(modebus[29]&&wrenbus[30]),.stop_in(modebus[29]),.stop_out(modebus[30]),.rst_in(rstbus[29]),.rst_out(rstbus[30]),.clk(clk));
  regunitin #(B) REG31(.in0(regvalbus[31*B-1:30*B]),.in1(in1),.out(out[32*B-1:31*B]),.regval(regvalbus[32*B-1:31*B]),.slcin(modebus[30]&&wrenbus[31]),.stop_in(modebus[30]),.stop_out(modebus[31]),.rst_in(rstbus[30]),.rst_out(rstbus[31]),.clk(clk));
  regunitin #(B) REG32(.in0(regvalbus[32*B-1:31*B]),.in1(in1),.out(out[33*B-1:32*B]),.regval(regvalbus[33*B-1:32*B]),.slcin(modebus[31]&&wrenbus[32]),.stop_in(modebus[31]),.stop_out(modebus[32]),.rst_in(rstbus[31]),.rst_out(rstbus[32]),.clk(clk));
  regunitin #(B) REG33(.in0(regvalbus[33*B-1:32*B]),.in1(in1),.out(out[34*B-1:33*B]),.regval(regvalbus[34*B-1:33*B]),.slcin(modebus[32]&&wrenbus[33]),.stop_in(modebus[32]),.stop_out(modebus[33]),.rst_in(rstbus[32]),.rst_out(rstbus[33]),.clk(clk));
  regunitin #(B) REG34(.in0(regvalbus[34*B-1:33*B]),.in1(in1),.out(out[35*B-1:34*B]),.regval(regvalbus[35*B-1:34*B]),.slcin(modebus[33]&&wrenbus[34]),.stop_in(modebus[33]),.stop_out(modebus[34]),.rst_in(rstbus[33]),.rst_out(rstbus[34]),.clk(clk));
  regunitin #(B) REG35(.in0(regvalbus[35*B-1:34*B]),.in1(in1),.out(out[36*B-1:35*B]),.regval(regvalbus[36*B-1:35*B]),.slcin(modebus[34]&&wrenbus[35]),.stop_in(modebus[34]),.stop_out(modebus[35]),.rst_in(rstbus[34]),.rst_out(rstbus[35]),.clk(clk));
  regunitin #(B) REG36(.in0(regvalbus[36*B-1:35*B]),.in1(in1),.out(out[37*B-1:36*B]),.regval(regvalbus[37*B-1:36*B]),.slcin(modebus[35]&&wrenbus[36]),.stop_in(modebus[35]),.stop_out(modebus[36]),.rst_in(rstbus[35]),.rst_out(rstbus[36]),.clk(clk));
  regunitin #(B) REG37(.in0(regvalbus[37*B-1:36*B]),.in1(in1),.out(out[38*B-1:37*B]),.regval(regvalbus[38*B-1:37*B]),.slcin(modebus[36]&&wrenbus[37]),.stop_in(modebus[36]),.stop_out(modebus[37]),.rst_in(rstbus[36]),.rst_out(rstbus[37]),.clk(clk));
  regunitin #(B) REG38(.in0(regvalbus[38*B-1:37*B]),.in1(in1),.out(out[39*B-1:38*B]),.regval(regvalbus[39*B-1:38*B]),.slcin(modebus[37]&&wrenbus[38]),.stop_in(modebus[37]),.stop_out(modebus[38]),.rst_in(rstbus[37]),.rst_out(rstbus[38]),.clk(clk));
  regunitin #(B) REG39(.in0(regvalbus[39*B-1:38*B]),.in1(in1),.out(out[40*B-1:39*B]),.regval(regvalbus[40*B-1:39*B]),.slcin(modebus[38]&&wrenbus[39]),.stop_in(modebus[38]),.stop_out(modebus[39]),.rst_in(rstbus[38]),.rst_out(rstbus[39]),.clk(clk));


  //First Register
  reg [B-1:0] REG0;
  wire [B-1:0] inp;
  reg mode_buff,rst_buff;
  wire mode_reg0;
  always @(posedge clk)
  begin
    mode_buff <= mode;
    rst_buff <= rst;
    if (mode_reg0) REG0 <= inp;
  end
  assign inp = mode ? in1 :in0;
  assign mode_reg0 = !mode || wrenbus[0] ;
  assign out[B-1:0] = rst_buff ? {B-1{1'b0}} : ( mode_reg0 ? inp : REG0 );
  assign modebus[0] = mode_buff;
  assign rstbus[0] = rst_buff;
  assign regvalbus[1*B-1:0*B] = REG0;
endmodule
