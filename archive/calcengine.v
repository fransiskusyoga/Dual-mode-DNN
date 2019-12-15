module calcengine(
         a_bus,b_bus,x_bus,out_bus,acti_en,stop,rst,clk);
  parameter Ba = 24;
  parameter Bb = 16;
  parameter N = 40;
  input [N*Ba-1:0] a_bus;
  input [N*Bb-1:0] b_bus;
  input [N*Ba-1:0] x_bus;
  output  [N*Ba-1:0] out_bus;
  input acti_en,stop,rst,clk;
  
  wire [N-1:0] actienbus,stopbus;
  
  simpleshiftreg #(1) AFSHF(.in(acti_en),.out(actienbus),.rst(rst),.clk(clk));
  simpleshiftreg #(1) STOPSHF(.in(stop),.out(stopbus),.rst(rst),.clk(clk));
  
  perceptron PERCEP0(.a(a_bus[Ba-1:0]),.b(b_bus[Bb-1:0]),.x(x_bus[Ba-1:0]),.out(out_bus[Ba-1:0]),.acti_en(acti_en),.stop(stop));
  perceptron PERCEP1(.a(a_bus[2*Ba-1:1*Ba]),.b(b_bus[2*Bb-1:1*Bb]),.x(x_bus[2*Ba-1:1*Ba]),.out(out_bus[2*Ba-1:1*Ba]),.acti_en(actienbus[0]),.stop(stopbus[0]));
  perceptron PERCEP2(.a(a_bus[3*Ba-1:2*Ba]),.b(b_bus[3*Bb-1:2*Bb]),.x(x_bus[3*Ba-1:2*Ba]),.out(out_bus[3*Ba-1:2*Ba]),.acti_en(actienbus[1]),.stop(stopbus[1]));
  perceptron PERCEP3(.a(a_bus[4*Ba-1:3*Ba]),.b(b_bus[4*Bb-1:3*Bb]),.x(x_bus[4*Ba-1:3*Ba]),.out(out_bus[4*Ba-1:3*Ba]),.acti_en(actienbus[2]),.stop(stopbus[2]));
  perceptron PERCEP4(.a(a_bus[5*Ba-1:4*Ba]),.b(b_bus[5*Bb-1:4*Bb]),.x(x_bus[5*Ba-1:4*Ba]),.out(out_bus[5*Ba-1:4*Ba]),.acti_en(actienbus[3]),.stop(stopbus[3]));
  perceptron PERCEP5(.a(a_bus[6*Ba-1:5*Ba]),.b(b_bus[6*Bb-1:5*Bb]),.x(x_bus[6*Ba-1:5*Ba]),.out(out_bus[6*Ba-1:5*Ba]),.acti_en(actienbus[4]),.stop(stopbus[4]));
  perceptron PERCEP6(.a(a_bus[7*Ba-1:6*Ba]),.b(b_bus[7*Bb-1:6*Bb]),.x(x_bus[7*Ba-1:6*Ba]),.out(out_bus[7*Ba-1:6*Ba]),.acti_en(actienbus[5]),.stop(stopbus[5]));
  perceptron PERCEP7(.a(a_bus[8*Ba-1:7*Ba]),.b(b_bus[8*Bb-1:7*Bb]),.x(x_bus[8*Ba-1:7*Ba]),.out(out_bus[8*Ba-1:7*Ba]),.acti_en(actienbus[6]),.stop(stopbus[6]));
  perceptron PERCEP8(.a(a_bus[9*Ba-1:8*Ba]),.b(b_bus[9*Bb-1:8*Bb]),.x(x_bus[9*Ba-1:8*Ba]),.out(out_bus[9*Ba-1:8*Ba]),.acti_en(actienbus[7]),.stop(stopbus[7]));
  perceptron PERCEP9(.a(a_bus[10*Ba-1:9*Ba]),.b(b_bus[10*Bb-1:9*Bb]),.x(x_bus[10*Ba-1:9*Ba]),.out(out_bus[10*Ba-1:9*Ba]),.acti_en(actienbus[8]),.stop(stopbus[8]));
  perceptron PERCEP10(.a(a_bus[11*Ba-1:10*Ba]),.b(b_bus[11*Bb-1:10*Bb]),.x(x_bus[11*Ba-1:10*Ba]),.out(out_bus[11*Ba-1:10*Ba]),.acti_en(actienbus[9]),.stop(stopbus[9]));
  perceptron PERCEP11(.a(a_bus[12*Ba-1:11*Ba]),.b(b_bus[12*Bb-1:11*Bb]),.x(x_bus[12*Ba-1:11*Ba]),.out(out_bus[12*Ba-1:11*Ba]),.acti_en(actienbus[10]),.stop(stopbus[10]));
  perceptron PERCEP12(.a(a_bus[13*Ba-1:12*Ba]),.b(b_bus[13*Bb-1:12*Bb]),.x(x_bus[13*Ba-1:12*Ba]),.out(out_bus[13*Ba-1:12*Ba]),.acti_en(actienbus[11]),.stop(stopbus[11]));
  perceptron PERCEP13(.a(a_bus[14*Ba-1:13*Ba]),.b(b_bus[14*Bb-1:13*Bb]),.x(x_bus[14*Ba-1:13*Ba]),.out(out_bus[14*Ba-1:13*Ba]),.acti_en(actienbus[12]),.stop(stopbus[12]));
  perceptron PERCEP14(.a(a_bus[15*Ba-1:14*Ba]),.b(b_bus[15*Bb-1:14*Bb]),.x(x_bus[15*Ba-1:14*Ba]),.out(out_bus[15*Ba-1:14*Ba]),.acti_en(actienbus[13]),.stop(stopbus[13]));
  perceptron PERCEP15(.a(a_bus[16*Ba-1:15*Ba]),.b(b_bus[16*Bb-1:15*Bb]),.x(x_bus[16*Ba-1:15*Ba]),.out(out_bus[16*Ba-1:15*Ba]),.acti_en(actienbus[14]),.stop(stopbus[14]));
  perceptron PERCEP16(.a(a_bus[17*Ba-1:16*Ba]),.b(b_bus[17*Bb-1:16*Bb]),.x(x_bus[17*Ba-1:16*Ba]),.out(out_bus[17*Ba-1:16*Ba]),.acti_en(actienbus[15]),.stop(stopbus[15]));
  perceptron PERCEP17(.a(a_bus[18*Ba-1:17*Ba]),.b(b_bus[18*Bb-1:17*Bb]),.x(x_bus[18*Ba-1:17*Ba]),.out(out_bus[18*Ba-1:17*Ba]),.acti_en(actienbus[16]),.stop(stopbus[16]));
  perceptron PERCEP18(.a(a_bus[19*Ba-1:18*Ba]),.b(b_bus[19*Bb-1:18*Bb]),.x(x_bus[19*Ba-1:18*Ba]),.out(out_bus[19*Ba-1:18*Ba]),.acti_en(actienbus[17]),.stop(stopbus[17]));
  perceptron PERCEP19(.a(a_bus[20*Ba-1:19*Ba]),.b(b_bus[20*Bb-1:19*Bb]),.x(x_bus[20*Ba-1:19*Ba]),.out(out_bus[20*Ba-1:19*Ba]),.acti_en(actienbus[18]),.stop(stopbus[18]));
  perceptron PERCEP20(.a(a_bus[21*Ba-1:20*Ba]),.b(b_bus[21*Bb-1:20*Bb]),.x(x_bus[21*Ba-1:20*Ba]),.out(out_bus[21*Ba-1:20*Ba]),.acti_en(actienbus[19]),.stop(stopbus[19]));
  perceptron PERCEP21(.a(a_bus[22*Ba-1:21*Ba]),.b(b_bus[22*Bb-1:21*Bb]),.x(x_bus[22*Ba-1:21*Ba]),.out(out_bus[22*Ba-1:21*Ba]),.acti_en(actienbus[20]),.stop(stopbus[20]));
  perceptron PERCEP22(.a(a_bus[23*Ba-1:22*Ba]),.b(b_bus[23*Bb-1:22*Bb]),.x(x_bus[23*Ba-1:22*Ba]),.out(out_bus[23*Ba-1:22*Ba]),.acti_en(actienbus[21]),.stop(stopbus[21]));
  perceptron PERCEP23(.a(a_bus[24*Ba-1:23*Ba]),.b(b_bus[24*Bb-1:23*Bb]),.x(x_bus[24*Ba-1:23*Ba]),.out(out_bus[24*Ba-1:23*Ba]),.acti_en(actienbus[22]),.stop(stopbus[22]));
  perceptron PERCEP24(.a(a_bus[25*Ba-1:24*Ba]),.b(b_bus[25*Bb-1:24*Bb]),.x(x_bus[25*Ba-1:24*Ba]),.out(out_bus[25*Ba-1:24*Ba]),.acti_en(actienbus[23]),.stop(stopbus[23]));
  perceptron PERCEP25(.a(a_bus[26*Ba-1:25*Ba]),.b(b_bus[26*Bb-1:25*Bb]),.x(x_bus[26*Ba-1:25*Ba]),.out(out_bus[26*Ba-1:25*Ba]),.acti_en(actienbus[24]),.stop(stopbus[24]));
  perceptron PERCEP26(.a(a_bus[27*Ba-1:26*Ba]),.b(b_bus[27*Bb-1:26*Bb]),.x(x_bus[27*Ba-1:26*Ba]),.out(out_bus[27*Ba-1:26*Ba]),.acti_en(actienbus[25]),.stop(stopbus[25]));
  perceptron PERCEP27(.a(a_bus[28*Ba-1:27*Ba]),.b(b_bus[28*Bb-1:27*Bb]),.x(x_bus[28*Ba-1:27*Ba]),.out(out_bus[28*Ba-1:27*Ba]),.acti_en(actienbus[26]),.stop(stopbus[26]));
  perceptron PERCEP28(.a(a_bus[29*Ba-1:28*Ba]),.b(b_bus[29*Bb-1:28*Bb]),.x(x_bus[29*Ba-1:28*Ba]),.out(out_bus[29*Ba-1:28*Ba]),.acti_en(actienbus[27]),.stop(stopbus[27]));
  perceptron PERCEP29(.a(a_bus[30*Ba-1:29*Ba]),.b(b_bus[30*Bb-1:29*Bb]),.x(x_bus[30*Ba-1:29*Ba]),.out(out_bus[30*Ba-1:29*Ba]),.acti_en(actienbus[28]),.stop(stopbus[28]));
  perceptron PERCEP30(.a(a_bus[31*Ba-1:30*Ba]),.b(b_bus[31*Bb-1:30*Bb]),.x(x_bus[31*Ba-1:30*Ba]),.out(out_bus[31*Ba-1:30*Ba]),.acti_en(actienbus[29]),.stop(stopbus[29]));
  perceptron PERCEP31(.a(a_bus[32*Ba-1:31*Ba]),.b(b_bus[32*Bb-1:31*Bb]),.x(x_bus[32*Ba-1:31*Ba]),.out(out_bus[32*Ba-1:31*Ba]),.acti_en(actienbus[30]),.stop(stopbus[30]));
  perceptron PERCEP32(.a(a_bus[33*Ba-1:32*Ba]),.b(b_bus[33*Bb-1:32*Bb]),.x(x_bus[33*Ba-1:32*Ba]),.out(out_bus[33*Ba-1:32*Ba]),.acti_en(actienbus[31]),.stop(stopbus[31]));
  perceptron PERCEP33(.a(a_bus[34*Ba-1:33*Ba]),.b(b_bus[34*Bb-1:33*Bb]),.x(x_bus[34*Ba-1:33*Ba]),.out(out_bus[34*Ba-1:33*Ba]),.acti_en(actienbus[32]),.stop(stopbus[32]));
  perceptron PERCEP34(.a(a_bus[35*Ba-1:34*Ba]),.b(b_bus[35*Bb-1:34*Bb]),.x(x_bus[35*Ba-1:34*Ba]),.out(out_bus[35*Ba-1:34*Ba]),.acti_en(actienbus[33]),.stop(stopbus[33]));
  perceptron PERCEP35(.a(a_bus[36*Ba-1:35*Ba]),.b(b_bus[36*Bb-1:35*Bb]),.x(x_bus[36*Ba-1:35*Ba]),.out(out_bus[36*Ba-1:35*Ba]),.acti_en(actienbus[34]),.stop(stopbus[34]));
  perceptron PERCEP36(.a(a_bus[37*Ba-1:36*Ba]),.b(b_bus[37*Bb-1:36*Bb]),.x(x_bus[37*Ba-1:36*Ba]),.out(out_bus[37*Ba-1:36*Ba]),.acti_en(actienbus[35]),.stop(stopbus[35]));
  perceptron PERCEP37(.a(a_bus[38*Ba-1:37*Ba]),.b(b_bus[38*Bb-1:37*Bb]),.x(x_bus[38*Ba-1:37*Ba]),.out(out_bus[38*Ba-1:37*Ba]),.acti_en(actienbus[36]),.stop(stopbus[36]));
  perceptron PERCEP38(.a(a_bus[39*Ba-1:38*Ba]),.b(b_bus[39*Bb-1:38*Bb]),.x(x_bus[39*Ba-1:38*Ba]),.out(out_bus[39*Ba-1:38*Ba]),.acti_en(actienbus[37]),.stop(stopbus[37]));
  perceptron PERCEP39(.a(a_bus[40*Ba-1:39*Ba]),.b(b_bus[40*Bb-1:39*Bb]),.x(x_bus[40*Ba-1:39*Ba]),.out(out_bus[40*Ba-1:39*Ba]),.acti_en(actienbus[38]),.stop(stopbus[38]));

  
endmodule