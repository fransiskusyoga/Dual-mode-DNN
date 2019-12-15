module calcengine(
         a0_bus,a1_bus,b_bus,x0_bus,x1_bus,
         out_bus,mode,rst,clk);
  localparam Ba = 24;
  localparam Bb = 16;
  localparam N = 40;
  input [N*Ba-1:0] a0_bus,a1_bus;
  input [N*Bb-1:0] b_bus;
  input [N*Ba-1:0] x0_bus,x1_bus;
  output  [N*Ba-1:0] out_bus;
  input mode,rst,clk;
  
  wire [N-1:0] mode_bus;
  simpleshiftreg #(1) modeSHR(
    .in(mode),.out(mode_bus),.rst(rst),.clk(clk));
  
  perceptron PERCEP0(.a0(a0_bus[Ba-1:0]),.a1(a1_bus[Ba-1:0]),.b(b_bus[Bb-1:0]),.x0(x0_bus[Ba-1:0]),.x1(x1_bus[Ba-1:0]),.mode(mode),.out(out_bus[Ba-1:0]));
  perceptron PERCEP1(.a0(a0_bus[2*Ba-1:1*Ba]),.a1(a1_bus[2*Ba-1:1*Ba]),.b(b_bus[2*Bb-1:1*Bb]),.x0(x0_bus[2*Ba-1:1*Ba]),.x1(x1_bus[2*Ba-1:1*Ba]),.mode(mode_bus[0]),.out(out_bus[2*Ba-1:1*Ba]));
  perceptron PERCEP2(.a0(a0_bus[3*Ba-1:2*Ba]),.a1(a1_bus[3*Ba-1:2*Ba]),.b(b_bus[3*Bb-1:2*Bb]),.x0(x0_bus[3*Ba-1:2*Ba]),.x1(x1_bus[3*Ba-1:2*Ba]),.mode(mode_bus[1]),.out(out_bus[3*Ba-1:2*Ba]));
  perceptron PERCEP3(.a0(a0_bus[4*Ba-1:3*Ba]),.a1(a1_bus[4*Ba-1:3*Ba]),.b(b_bus[4*Bb-1:3*Bb]),.x0(x0_bus[4*Ba-1:3*Ba]),.x1(x1_bus[4*Ba-1:3*Ba]),.mode(mode_bus[2]),.out(out_bus[4*Ba-1:3*Ba]));
  perceptron PERCEP4(.a0(a0_bus[5*Ba-1:4*Ba]),.a1(a1_bus[5*Ba-1:4*Ba]),.b(b_bus[5*Bb-1:4*Bb]),.x0(x0_bus[5*Ba-1:4*Ba]),.x1(x1_bus[5*Ba-1:4*Ba]),.mode(mode_bus[3]),.out(out_bus[5*Ba-1:4*Ba]));
  perceptron PERCEP5(.a0(a0_bus[6*Ba-1:5*Ba]),.a1(a1_bus[6*Ba-1:5*Ba]),.b(b_bus[6*Bb-1:5*Bb]),.x0(x0_bus[6*Ba-1:5*Ba]),.x1(x1_bus[6*Ba-1:5*Ba]),.mode(mode_bus[4]),.out(out_bus[6*Ba-1:5*Ba]));
  perceptron PERCEP6(.a0(a0_bus[7*Ba-1:6*Ba]),.a1(a1_bus[7*Ba-1:6*Ba]),.b(b_bus[7*Bb-1:6*Bb]),.x0(x0_bus[7*Ba-1:6*Ba]),.x1(x1_bus[7*Ba-1:6*Ba]),.mode(mode_bus[5]),.out(out_bus[7*Ba-1:6*Ba]));
  perceptron PERCEP7(.a0(a0_bus[8*Ba-1:7*Ba]),.a1(a1_bus[8*Ba-1:7*Ba]),.b(b_bus[8*Bb-1:7*Bb]),.x0(x0_bus[8*Ba-1:7*Ba]),.x1(x1_bus[8*Ba-1:7*Ba]),.mode(mode_bus[6]),.out(out_bus[8*Ba-1:7*Ba]));
  perceptron PERCEP8(.a0(a0_bus[9*Ba-1:8*Ba]),.a1(a1_bus[9*Ba-1:8*Ba]),.b(b_bus[9*Bb-1:8*Bb]),.x0(x0_bus[9*Ba-1:8*Ba]),.x1(x1_bus[9*Ba-1:8*Ba]),.mode(mode_bus[7]),.out(out_bus[9*Ba-1:8*Ba]));
  perceptron PERCEP9(.a0(a0_bus[10*Ba-1:9*Ba]),.a1(a1_bus[10*Ba-1:9*Ba]),.b(b_bus[10*Bb-1:9*Bb]),.x0(x0_bus[10*Ba-1:9*Ba]),.x1(x1_bus[10*Ba-1:9*Ba]),.mode(mode_bus[8]),.out(out_bus[10*Ba-1:9*Ba]));
  perceptron PERCEP10(.a0(a0_bus[11*Ba-1:10*Ba]),.a1(a1_bus[11*Ba-1:10*Ba]),.b(b_bus[11*Bb-1:10*Bb]),.x0(x0_bus[11*Ba-1:10*Ba]),.x1(x1_bus[11*Ba-1:10*Ba]),.mode(mode_bus[9]),.out(out_bus[11*Ba-1:10*Ba]));
  perceptron PERCEP11(.a0(a0_bus[12*Ba-1:11*Ba]),.a1(a1_bus[12*Ba-1:11*Ba]),.b(b_bus[12*Bb-1:11*Bb]),.x0(x0_bus[12*Ba-1:11*Ba]),.x1(x1_bus[12*Ba-1:11*Ba]),.mode(mode_bus[10]),.out(out_bus[12*Ba-1:11*Ba]));
  perceptron PERCEP12(.a0(a0_bus[13*Ba-1:12*Ba]),.a1(a1_bus[13*Ba-1:12*Ba]),.b(b_bus[13*Bb-1:12*Bb]),.x0(x0_bus[13*Ba-1:12*Ba]),.x1(x1_bus[13*Ba-1:12*Ba]),.mode(mode_bus[11]),.out(out_bus[13*Ba-1:12*Ba]));
  perceptron PERCEP13(.a0(a0_bus[14*Ba-1:13*Ba]),.a1(a1_bus[14*Ba-1:13*Ba]),.b(b_bus[14*Bb-1:13*Bb]),.x0(x0_bus[14*Ba-1:13*Ba]),.x1(x1_bus[14*Ba-1:13*Ba]),.mode(mode_bus[12]),.out(out_bus[14*Ba-1:13*Ba]));
  perceptron PERCEP14(.a0(a0_bus[15*Ba-1:14*Ba]),.a1(a1_bus[15*Ba-1:14*Ba]),.b(b_bus[15*Bb-1:14*Bb]),.x0(x0_bus[15*Ba-1:14*Ba]),.x1(x1_bus[15*Ba-1:14*Ba]),.mode(mode_bus[13]),.out(out_bus[15*Ba-1:14*Ba]));
  perceptron PERCEP15(.a0(a0_bus[16*Ba-1:15*Ba]),.a1(a1_bus[16*Ba-1:15*Ba]),.b(b_bus[16*Bb-1:15*Bb]),.x0(x0_bus[16*Ba-1:15*Ba]),.x1(x1_bus[16*Ba-1:15*Ba]),.mode(mode_bus[14]),.out(out_bus[16*Ba-1:15*Ba]));
  perceptron PERCEP16(.a0(a0_bus[17*Ba-1:16*Ba]),.a1(a1_bus[17*Ba-1:16*Ba]),.b(b_bus[17*Bb-1:16*Bb]),.x0(x0_bus[17*Ba-1:16*Ba]),.x1(x1_bus[17*Ba-1:16*Ba]),.mode(mode_bus[15]),.out(out_bus[17*Ba-1:16*Ba]));
  perceptron PERCEP17(.a0(a0_bus[18*Ba-1:17*Ba]),.a1(a1_bus[18*Ba-1:17*Ba]),.b(b_bus[18*Bb-1:17*Bb]),.x0(x0_bus[18*Ba-1:17*Ba]),.x1(x1_bus[18*Ba-1:17*Ba]),.mode(mode_bus[16]),.out(out_bus[18*Ba-1:17*Ba]));
  perceptron PERCEP18(.a0(a0_bus[19*Ba-1:18*Ba]),.a1(a1_bus[19*Ba-1:18*Ba]),.b(b_bus[19*Bb-1:18*Bb]),.x0(x0_bus[19*Ba-1:18*Ba]),.x1(x1_bus[19*Ba-1:18*Ba]),.mode(mode_bus[17]),.out(out_bus[19*Ba-1:18*Ba]));
  perceptron PERCEP19(.a0(a0_bus[20*Ba-1:19*Ba]),.a1(a1_bus[20*Ba-1:19*Ba]),.b(b_bus[20*Bb-1:19*Bb]),.x0(x0_bus[20*Ba-1:19*Ba]),.x1(x1_bus[20*Ba-1:19*Ba]),.mode(mode_bus[18]),.out(out_bus[20*Ba-1:19*Ba]));
  perceptron PERCEP20(.a0(a0_bus[21*Ba-1:20*Ba]),.a1(a1_bus[21*Ba-1:20*Ba]),.b(b_bus[21*Bb-1:20*Bb]),.x0(x0_bus[21*Ba-1:20*Ba]),.x1(x1_bus[21*Ba-1:20*Ba]),.mode(mode_bus[19]),.out(out_bus[21*Ba-1:20*Ba]));
  perceptron PERCEP21(.a0(a0_bus[22*Ba-1:21*Ba]),.a1(a1_bus[22*Ba-1:21*Ba]),.b(b_bus[22*Bb-1:21*Bb]),.x0(x0_bus[22*Ba-1:21*Ba]),.x1(x1_bus[22*Ba-1:21*Ba]),.mode(mode_bus[20]),.out(out_bus[22*Ba-1:21*Ba]));
  perceptron PERCEP22(.a0(a0_bus[23*Ba-1:22*Ba]),.a1(a1_bus[23*Ba-1:22*Ba]),.b(b_bus[23*Bb-1:22*Bb]),.x0(x0_bus[23*Ba-1:22*Ba]),.x1(x1_bus[23*Ba-1:22*Ba]),.mode(mode_bus[21]),.out(out_bus[23*Ba-1:22*Ba]));
  perceptron PERCEP23(.a0(a0_bus[24*Ba-1:23*Ba]),.a1(a1_bus[24*Ba-1:23*Ba]),.b(b_bus[24*Bb-1:23*Bb]),.x0(x0_bus[24*Ba-1:23*Ba]),.x1(x1_bus[24*Ba-1:23*Ba]),.mode(mode_bus[22]),.out(out_bus[24*Ba-1:23*Ba]));
  perceptron PERCEP24(.a0(a0_bus[25*Ba-1:24*Ba]),.a1(a1_bus[25*Ba-1:24*Ba]),.b(b_bus[25*Bb-1:24*Bb]),.x0(x0_bus[25*Ba-1:24*Ba]),.x1(x1_bus[25*Ba-1:24*Ba]),.mode(mode_bus[23]),.out(out_bus[25*Ba-1:24*Ba]));
  perceptron PERCEP25(.a0(a0_bus[26*Ba-1:25*Ba]),.a1(a1_bus[26*Ba-1:25*Ba]),.b(b_bus[26*Bb-1:25*Bb]),.x0(x0_bus[26*Ba-1:25*Ba]),.x1(x1_bus[26*Ba-1:25*Ba]),.mode(mode_bus[24]),.out(out_bus[26*Ba-1:25*Ba]));
  perceptron PERCEP26(.a0(a0_bus[27*Ba-1:26*Ba]),.a1(a1_bus[27*Ba-1:26*Ba]),.b(b_bus[27*Bb-1:26*Bb]),.x0(x0_bus[27*Ba-1:26*Ba]),.x1(x1_bus[27*Ba-1:26*Ba]),.mode(mode_bus[25]),.out(out_bus[27*Ba-1:26*Ba]));
  perceptron PERCEP27(.a0(a0_bus[28*Ba-1:27*Ba]),.a1(a1_bus[28*Ba-1:27*Ba]),.b(b_bus[28*Bb-1:27*Bb]),.x0(x0_bus[28*Ba-1:27*Ba]),.x1(x1_bus[28*Ba-1:27*Ba]),.mode(mode_bus[26]),.out(out_bus[28*Ba-1:27*Ba]));
  perceptron PERCEP28(.a0(a0_bus[29*Ba-1:28*Ba]),.a1(a1_bus[29*Ba-1:28*Ba]),.b(b_bus[29*Bb-1:28*Bb]),.x0(x0_bus[29*Ba-1:28*Ba]),.x1(x1_bus[29*Ba-1:28*Ba]),.mode(mode_bus[27]),.out(out_bus[29*Ba-1:28*Ba]));
  perceptron PERCEP29(.a0(a0_bus[30*Ba-1:29*Ba]),.a1(a1_bus[30*Ba-1:29*Ba]),.b(b_bus[30*Bb-1:29*Bb]),.x0(x0_bus[30*Ba-1:29*Ba]),.x1(x1_bus[30*Ba-1:29*Ba]),.mode(mode_bus[28]),.out(out_bus[30*Ba-1:29*Ba]));
  perceptron PERCEP30(.a0(a0_bus[31*Ba-1:30*Ba]),.a1(a1_bus[31*Ba-1:30*Ba]),.b(b_bus[31*Bb-1:30*Bb]),.x0(x0_bus[31*Ba-1:30*Ba]),.x1(x1_bus[31*Ba-1:30*Ba]),.mode(mode_bus[29]),.out(out_bus[31*Ba-1:30*Ba]));
  perceptron PERCEP31(.a0(a0_bus[32*Ba-1:31*Ba]),.a1(a1_bus[32*Ba-1:31*Ba]),.b(b_bus[32*Bb-1:31*Bb]),.x0(x0_bus[32*Ba-1:31*Ba]),.x1(x1_bus[32*Ba-1:31*Ba]),.mode(mode_bus[30]),.out(out_bus[32*Ba-1:31*Ba]));
  perceptron PERCEP32(.a0(a0_bus[33*Ba-1:32*Ba]),.a1(a1_bus[33*Ba-1:32*Ba]),.b(b_bus[33*Bb-1:32*Bb]),.x0(x0_bus[33*Ba-1:32*Ba]),.x1(x1_bus[33*Ba-1:32*Ba]),.mode(mode_bus[31]),.out(out_bus[33*Ba-1:32*Ba]));
  perceptron PERCEP33(.a0(a0_bus[34*Ba-1:33*Ba]),.a1(a1_bus[34*Ba-1:33*Ba]),.b(b_bus[34*Bb-1:33*Bb]),.x0(x0_bus[34*Ba-1:33*Ba]),.x1(x1_bus[34*Ba-1:33*Ba]),.mode(mode_bus[32]),.out(out_bus[34*Ba-1:33*Ba]));
  perceptron PERCEP34(.a0(a0_bus[35*Ba-1:34*Ba]),.a1(a1_bus[35*Ba-1:34*Ba]),.b(b_bus[35*Bb-1:34*Bb]),.x0(x0_bus[35*Ba-1:34*Ba]),.x1(x1_bus[35*Ba-1:34*Ba]),.mode(mode_bus[33]),.out(out_bus[35*Ba-1:34*Ba]));
  perceptron PERCEP35(.a0(a0_bus[36*Ba-1:35*Ba]),.a1(a1_bus[36*Ba-1:35*Ba]),.b(b_bus[36*Bb-1:35*Bb]),.x0(x0_bus[36*Ba-1:35*Ba]),.x1(x1_bus[36*Ba-1:35*Ba]),.mode(mode_bus[34]),.out(out_bus[36*Ba-1:35*Ba]));
  perceptron PERCEP36(.a0(a0_bus[37*Ba-1:36*Ba]),.a1(a1_bus[37*Ba-1:36*Ba]),.b(b_bus[37*Bb-1:36*Bb]),.x0(x0_bus[37*Ba-1:36*Ba]),.x1(x1_bus[37*Ba-1:36*Ba]),.mode(mode_bus[35]),.out(out_bus[37*Ba-1:36*Ba]));
  perceptron PERCEP37(.a0(a0_bus[38*Ba-1:37*Ba]),.a1(a1_bus[38*Ba-1:37*Ba]),.b(b_bus[38*Bb-1:37*Bb]),.x0(x0_bus[38*Ba-1:37*Ba]),.x1(x1_bus[38*Ba-1:37*Ba]),.mode(mode_bus[36]),.out(out_bus[38*Ba-1:37*Ba]));
  perceptron PERCEP38(.a0(a0_bus[39*Ba-1:38*Ba]),.a1(a1_bus[39*Ba-1:38*Ba]),.b(b_bus[39*Bb-1:38*Bb]),.x0(x0_bus[39*Ba-1:38*Ba]),.x1(x1_bus[39*Ba-1:38*Ba]),.mode(mode_bus[37]),.out(out_bus[39*Ba-1:38*Ba]));
  perceptron PERCEP39(.a0(a0_bus[40*Ba-1:39*Ba]),.a1(a1_bus[40*Ba-1:39*Ba]),.b(b_bus[40*Bb-1:39*Bb]),.x0(x0_bus[40*Ba-1:39*Ba]),.x1(x1_bus[40*Ba-1:39*Ba]),.mode(mode_bus[38]),.out(out_bus[40*Ba-1:39*Ba]));

  
endmodule