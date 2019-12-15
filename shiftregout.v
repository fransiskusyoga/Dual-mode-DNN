module shiftregout #(
         parameter B)( //bit length
         ins,in,outs,out1,out2,addr1,addr2,mode,rst,clk);
  localparam N = 40; //number of dsp unit (perceptron)
  input [N*B-1:0] ins;
  input [B-1:0] in;
  output [N*B-1:0] outs;
  output [B-1:0] out1,out2;
  input [5:0] addr1,addr2;
  input mode,rst,clk;
  
  wire [39:0] rstbus;
  wire [39:0] modebus;
  wire [N*B-1:0] regsout;
  
  //out1 multiplexer
  mux64in #(B) muxout1(
    .in0(regsout[1*B-1:0*B]),.in1(regsout[2*B-1:1*B]),.in2(regsout[3*B-1:2*B]),.in3(regsout[4*B-1:3*B]),.in4(regsout[5*B-1:4*B]),
    .in5(regsout[6*B-1:5*B]),.in6(regsout[7*B-1:6*B]),.in7(regsout[8*B-1:7*B]),.in8(regsout[9*B-1:8*B]),.in9(regsout[10*B-1:9*B]),
    .in10(regsout[11*B-1:10*B]),.in11(regsout[12*B-1:11*B]),.in12(regsout[13*B-1:12*B]),.in13(regsout[14*B-1:13*B]),.in14(regsout[15*B-1:14*B]),
    .in15(regsout[16*B-1:15*B]),.in16(regsout[17*B-1:16*B]),.in17(regsout[18*B-1:17*B]),.in18(regsout[19*B-1:18*B]),.in19(regsout[20*B-1:19*B]),
    .in20(regsout[21*B-1:20*B]),.in21(regsout[22*B-1:21*B]),.in22(regsout[23*B-1:22*B]),.in23(regsout[24*B-1:23*B]),.in24(regsout[25*B-1:24*B]),
    .in25(regsout[26*B-1:25*B]),.in26(regsout[27*B-1:26*B]),.in27(regsout[28*B-1:27*B]),.in28(regsout[29*B-1:28*B]),.in29(regsout[30*B-1:29*B]),
    .in30(regsout[31*B-1:30*B]),.in31(regsout[32*B-1:31*B]),.in32(regsout[33*B-1:32*B]),.in33(regsout[34*B-1:33*B]),.in34(regsout[35*B-1:34*B]),
    .in35(regsout[36*B-1:35*B]),.in36(regsout[37*B-1:36*B]),.in37(regsout[38*B-1:37*B]),.in38(regsout[39*B-1:38*B]),.in39(regsout[40*B-1:39*B]),
    .in40({B{1'b0}}),.in41({B{1'b0}}),.in42({B{1'b0}}),.in43({B{1'b0}}),.in44({B{1'b0}}),
    .in45({B{1'b0}}),.in46({B{1'b0}}),.in47({B{1'b0}}),.in48({B{1'b0}}),.in49({B{1'b0}}),
    .in50({B{1'b0}}),.in51({B{1'b0}}),.in52({B{1'b0}}),.in53({B{1'b0}}),.in54({B{1'b0}}),
    .in55({B{1'b0}}),.in56({B{1'b0}}),.in57({B{1'b0}}),.in58({B{1'b0}}),.in59({B{1'b0}}),
    .in60({B{1'b0}}),.in61({B{1'b0}}),.in62({B{1'b0}}),.in63({B{1'b0}}),    .out(out1),.slc(addr1));

  //out2 multiplexer
  mux64in #(B) muxout2(
    .in0(ins[1*B-1:0*B]),.in1(ins[2*B-1:1*B]),.in2(ins[3*B-1:2*B]),.in3(ins[4*B-1:3*B]),.in4(ins[5*B-1:4*B]),
    .in5(ins[6*B-1:5*B]),.in6(ins[7*B-1:6*B]),.in7(ins[8*B-1:7*B]),.in8(ins[9*B-1:8*B]),.in9(ins[10*B-1:9*B]),
    .in10(ins[11*B-1:10*B]),.in11(ins[12*B-1:11*B]),.in12(ins[13*B-1:12*B]),.in13(ins[14*B-1:13*B]),.in14(ins[15*B-1:14*B]),
    .in15(ins[16*B-1:15*B]),.in16(ins[17*B-1:16*B]),.in17(ins[18*B-1:17*B]),.in18(ins[19*B-1:18*B]),.in19(ins[20*B-1:19*B]),
    .in20(ins[21*B-1:20*B]),.in21(ins[22*B-1:21*B]),.in22(ins[23*B-1:22*B]),.in23(ins[24*B-1:23*B]),.in24(ins[25*B-1:24*B]),
    .in25(ins[26*B-1:25*B]),.in26(ins[27*B-1:26*B]),.in27(ins[28*B-1:27*B]),.in28(ins[29*B-1:28*B]),.in29(ins[30*B-1:29*B]),
    .in30(ins[31*B-1:30*B]),.in31(ins[32*B-1:31*B]),.in32(ins[33*B-1:32*B]),.in33(ins[34*B-1:33*B]),.in34(ins[35*B-1:34*B]),
    .in35(ins[36*B-1:35*B]),.in36(ins[37*B-1:36*B]),.in37(ins[38*B-1:37*B]),.in38(ins[39*B-1:38*B]),.in39(ins[40*B-1:39*B]),
    .in40({B{1'b0}}),.in41({B{1'b0}}),.in42({B{1'b0}}),.in43({B{1'b0}}),.in44({B{1'b0}}),
    .in45({B{1'b0}}),.in46({B{1'b0}}),.in47({B{1'b0}}),.in48({B{1'b0}}),.in49({B{1'b0}}),
    .in50({B{1'b0}}),.in51({B{1'b0}}),.in52({B{1'b0}}),.in53({B{1'b0}}),.in54({B{1'b0}}),
    .in55({B{1'b0}}),.in56({B{1'b0}}),.in57({B{1'b0}}),.in58({B{1'b0}}),.in59({B{1'b0}}),
    .in60({B{1'b0}}),.in61({B{1'b0}}),.in62({B{1'b0}}),.in63({B{1'b0}}),    .out(out2),.slc(addr2));


  //regunitout Block
  regunitout#(24) REGUNIT0(.in(ins[B-1:0]),.out(regsout[B-1:0]),.rst_in(rst),.rst_out(rstbus[0]),.clk(clk));
  regunitout#(24) REGUNIT1(.in(ins[2*B-1:1*B]),.out(regsout[2*B-1:1*B]),.rst_in(rstbus[0]),.rst_out(rstbus[1]),.clk(clk));
  regunitout#(24) REGUNIT2(.in(ins[3*B-1:2*B]),.out(regsout[3*B-1:2*B]),.rst_in(rstbus[1]),.rst_out(rstbus[2]),.clk(clk));
  regunitout#(24) REGUNIT3(.in(ins[4*B-1:3*B]),.out(regsout[4*B-1:3*B]),.rst_in(rstbus[2]),.rst_out(rstbus[3]),.clk(clk));
  regunitout#(24) REGUNIT4(.in(ins[5*B-1:4*B]),.out(regsout[5*B-1:4*B]),.rst_in(rstbus[3]),.rst_out(rstbus[4]),.clk(clk));
  regunitout#(24) REGUNIT5(.in(ins[6*B-1:5*B]),.out(regsout[6*B-1:5*B]),.rst_in(rstbus[4]),.rst_out(rstbus[5]),.clk(clk));
  regunitout#(24) REGUNIT6(.in(ins[7*B-1:6*B]),.out(regsout[7*B-1:6*B]),.rst_in(rstbus[5]),.rst_out(rstbus[6]),.clk(clk));
  regunitout#(24) REGUNIT7(.in(ins[8*B-1:7*B]),.out(regsout[8*B-1:7*B]),.rst_in(rstbus[6]),.rst_out(rstbus[7]),.clk(clk));
  regunitout#(24) REGUNIT8(.in(ins[9*B-1:8*B]),.out(regsout[9*B-1:8*B]),.rst_in(rstbus[7]),.rst_out(rstbus[8]),.clk(clk));
  regunitout#(24) REGUNIT9(.in(ins[10*B-1:9*B]),.out(regsout[10*B-1:9*B]),.rst_in(rstbus[8]),.rst_out(rstbus[9]),.clk(clk));
  regunitout#(24) REGUNIT10(.in(ins[11*B-1:10*B]),.out(regsout[11*B-1:10*B]),.rst_in(rstbus[9]),.rst_out(rstbus[10]),.clk(clk));
  regunitout#(24) REGUNIT11(.in(ins[12*B-1:11*B]),.out(regsout[12*B-1:11*B]),.rst_in(rstbus[10]),.rst_out(rstbus[11]),.clk(clk));
  regunitout#(24) REGUNIT12(.in(ins[13*B-1:12*B]),.out(regsout[13*B-1:12*B]),.rst_in(rstbus[11]),.rst_out(rstbus[12]),.clk(clk));
  regunitout#(24) REGUNIT13(.in(ins[14*B-1:13*B]),.out(regsout[14*B-1:13*B]),.rst_in(rstbus[12]),.rst_out(rstbus[13]),.clk(clk));
  regunitout#(24) REGUNIT14(.in(ins[15*B-1:14*B]),.out(regsout[15*B-1:14*B]),.rst_in(rstbus[13]),.rst_out(rstbus[14]),.clk(clk));
  regunitout#(24) REGUNIT15(.in(ins[16*B-1:15*B]),.out(regsout[16*B-1:15*B]),.rst_in(rstbus[14]),.rst_out(rstbus[15]),.clk(clk));
  regunitout#(24) REGUNIT16(.in(ins[17*B-1:16*B]),.out(regsout[17*B-1:16*B]),.rst_in(rstbus[15]),.rst_out(rstbus[16]),.clk(clk));
  regunitout#(24) REGUNIT17(.in(ins[18*B-1:17*B]),.out(regsout[18*B-1:17*B]),.rst_in(rstbus[16]),.rst_out(rstbus[17]),.clk(clk));
  regunitout#(24) REGUNIT18(.in(ins[19*B-1:18*B]),.out(regsout[19*B-1:18*B]),.rst_in(rstbus[17]),.rst_out(rstbus[18]),.clk(clk));
  regunitout#(24) REGUNIT19(.in(ins[20*B-1:19*B]),.out(regsout[20*B-1:19*B]),.rst_in(rstbus[18]),.rst_out(rstbus[19]),.clk(clk));
  regunitout#(24) REGUNIT20(.in(ins[21*B-1:20*B]),.out(regsout[21*B-1:20*B]),.rst_in(rstbus[19]),.rst_out(rstbus[20]),.clk(clk));
  regunitout#(24) REGUNIT21(.in(ins[22*B-1:21*B]),.out(regsout[22*B-1:21*B]),.rst_in(rstbus[20]),.rst_out(rstbus[21]),.clk(clk));
  regunitout#(24) REGUNIT22(.in(ins[23*B-1:22*B]),.out(regsout[23*B-1:22*B]),.rst_in(rstbus[21]),.rst_out(rstbus[22]),.clk(clk));
  regunitout#(24) REGUNIT23(.in(ins[24*B-1:23*B]),.out(regsout[24*B-1:23*B]),.rst_in(rstbus[22]),.rst_out(rstbus[23]),.clk(clk));
  regunitout#(24) REGUNIT24(.in(ins[25*B-1:24*B]),.out(regsout[25*B-1:24*B]),.rst_in(rstbus[23]),.rst_out(rstbus[24]),.clk(clk));
  regunitout#(24) REGUNIT25(.in(ins[26*B-1:25*B]),.out(regsout[26*B-1:25*B]),.rst_in(rstbus[24]),.rst_out(rstbus[25]),.clk(clk));
  regunitout#(24) REGUNIT26(.in(ins[27*B-1:26*B]),.out(regsout[27*B-1:26*B]),.rst_in(rstbus[25]),.rst_out(rstbus[26]),.clk(clk));
  regunitout#(24) REGUNIT27(.in(ins[28*B-1:27*B]),.out(regsout[28*B-1:27*B]),.rst_in(rstbus[26]),.rst_out(rstbus[27]),.clk(clk));
  regunitout#(24) REGUNIT28(.in(ins[29*B-1:28*B]),.out(regsout[29*B-1:28*B]),.rst_in(rstbus[27]),.rst_out(rstbus[28]),.clk(clk));
  regunitout#(24) REGUNIT29(.in(ins[30*B-1:29*B]),.out(regsout[30*B-1:29*B]),.rst_in(rstbus[28]),.rst_out(rstbus[29]),.clk(clk));
  regunitout#(24) REGUNIT30(.in(ins[31*B-1:30*B]),.out(regsout[31*B-1:30*B]),.rst_in(rstbus[29]),.rst_out(rstbus[30]),.clk(clk));
  regunitout#(24) REGUNIT31(.in(ins[32*B-1:31*B]),.out(regsout[32*B-1:31*B]),.rst_in(rstbus[30]),.rst_out(rstbus[31]),.clk(clk));
  regunitout#(24) REGUNIT32(.in(ins[33*B-1:32*B]),.out(regsout[33*B-1:32*B]),.rst_in(rstbus[31]),.rst_out(rstbus[32]),.clk(clk));
  regunitout#(24) REGUNIT33(.in(ins[34*B-1:33*B]),.out(regsout[34*B-1:33*B]),.rst_in(rstbus[32]),.rst_out(rstbus[33]),.clk(clk));
  regunitout#(24) REGUNIT34(.in(ins[35*B-1:34*B]),.out(regsout[35*B-1:34*B]),.rst_in(rstbus[33]),.rst_out(rstbus[34]),.clk(clk));
  regunitout#(24) REGUNIT35(.in(ins[36*B-1:35*B]),.out(regsout[36*B-1:35*B]),.rst_in(rstbus[34]),.rst_out(rstbus[35]),.clk(clk));
  regunitout#(24) REGUNIT36(.in(ins[37*B-1:36*B]),.out(regsout[37*B-1:36*B]),.rst_in(rstbus[35]),.rst_out(rstbus[36]),.clk(clk));
  regunitout#(24) REGUNIT37(.in(ins[38*B-1:37*B]),.out(regsout[38*B-1:37*B]),.rst_in(rstbus[36]),.rst_out(rstbus[37]),.clk(clk));
  regunitout#(24) REGUNIT38(.in(ins[39*B-1:38*B]),.out(regsout[39*B-1:38*B]),.rst_in(rstbus[37]),.rst_out(rstbus[38]),.clk(clk));
  regunitout#(24) REGUNIT39(.in(ins[40*B-1:39*B]),.out(regsout[40*B-1:39*B]),.rst_in(rstbus[38]),.rst_out(rstbus[39]),.clk(clk));


  simpleshiftreg #(1) MODESHF(.in(mode),.out(modebus),.rst(rstbus[0]),.clk(clk));
  //mode multiplever Block
  //mode = 0 : Normal
  //mode = 1 : Shifting
  assign outs[B-1:0] = modebus[0] ? in : regsout[B-1:0];
  assign outs[2*B-1:1*B] = modebus[1] ? regsout[1*B-1:0*B] : regsout[2*B-1:1*B];
  assign outs[3*B-1:2*B] = modebus[2] ? regsout[2*B-1:1*B] : regsout[3*B-1:2*B];
  assign outs[4*B-1:3*B] = modebus[3] ? regsout[3*B-1:2*B] : regsout[4*B-1:3*B];
  assign outs[5*B-1:4*B] = modebus[4] ? regsout[4*B-1:3*B] : regsout[5*B-1:4*B];
  assign outs[6*B-1:5*B] = modebus[5] ? regsout[5*B-1:4*B] : regsout[6*B-1:5*B];
  assign outs[7*B-1:6*B] = modebus[6] ? regsout[6*B-1:5*B] : regsout[7*B-1:6*B];
  assign outs[8*B-1:7*B] = modebus[7] ? regsout[7*B-1:6*B] : regsout[8*B-1:7*B];
  assign outs[9*B-1:8*B] = modebus[8] ? regsout[8*B-1:7*B] : regsout[9*B-1:8*B];
  assign outs[10*B-1:9*B] = modebus[9] ? regsout[9*B-1:8*B] : regsout[10*B-1:9*B];
  assign outs[11*B-1:10*B] = modebus[10] ? regsout[10*B-1:9*B] : regsout[11*B-1:10*B];
  assign outs[12*B-1:11*B] = modebus[11] ? regsout[11*B-1:10*B] : regsout[12*B-1:11*B];
  assign outs[13*B-1:12*B] = modebus[12] ? regsout[12*B-1:11*B] : regsout[13*B-1:12*B];
  assign outs[14*B-1:13*B] = modebus[13] ? regsout[13*B-1:12*B] : regsout[14*B-1:13*B];
  assign outs[15*B-1:14*B] = modebus[14] ? regsout[14*B-1:13*B] : regsout[15*B-1:14*B];
  assign outs[16*B-1:15*B] = modebus[15] ? regsout[15*B-1:14*B] : regsout[16*B-1:15*B];
  assign outs[17*B-1:16*B] = modebus[16] ? regsout[16*B-1:15*B] : regsout[17*B-1:16*B];
  assign outs[18*B-1:17*B] = modebus[17] ? regsout[17*B-1:16*B] : regsout[18*B-1:17*B];
  assign outs[19*B-1:18*B] = modebus[18] ? regsout[18*B-1:17*B] : regsout[19*B-1:18*B];
  assign outs[20*B-1:19*B] = modebus[19] ? regsout[19*B-1:18*B] : regsout[20*B-1:19*B];
  assign outs[21*B-1:20*B] = modebus[20] ? regsout[20*B-1:19*B] : regsout[21*B-1:20*B];
  assign outs[22*B-1:21*B] = modebus[21] ? regsout[21*B-1:20*B] : regsout[22*B-1:21*B];
  assign outs[23*B-1:22*B] = modebus[22] ? regsout[22*B-1:21*B] : regsout[23*B-1:22*B];
  assign outs[24*B-1:23*B] = modebus[23] ? regsout[23*B-1:22*B] : regsout[24*B-1:23*B];
  assign outs[25*B-1:24*B] = modebus[24] ? regsout[24*B-1:23*B] : regsout[25*B-1:24*B];
  assign outs[26*B-1:25*B] = modebus[25] ? regsout[25*B-1:24*B] : regsout[26*B-1:25*B];
  assign outs[27*B-1:26*B] = modebus[26] ? regsout[26*B-1:25*B] : regsout[27*B-1:26*B];
  assign outs[28*B-1:27*B] = modebus[27] ? regsout[27*B-1:26*B] : regsout[28*B-1:27*B];
  assign outs[29*B-1:28*B] = modebus[28] ? regsout[28*B-1:27*B] : regsout[29*B-1:28*B];
  assign outs[30*B-1:29*B] = modebus[29] ? regsout[29*B-1:28*B] : regsout[30*B-1:29*B];
  assign outs[31*B-1:30*B] = modebus[30] ? regsout[30*B-1:29*B] : regsout[31*B-1:30*B];
  assign outs[32*B-1:31*B] = modebus[31] ? regsout[31*B-1:30*B] : regsout[32*B-1:31*B];
  assign outs[33*B-1:32*B] = modebus[32] ? regsout[32*B-1:31*B] : regsout[33*B-1:32*B];
  assign outs[34*B-1:33*B] = modebus[33] ? regsout[33*B-1:32*B] : regsout[34*B-1:33*B];
  assign outs[35*B-1:34*B] = modebus[34] ? regsout[34*B-1:33*B] : regsout[35*B-1:34*B];
  assign outs[36*B-1:35*B] = modebus[35] ? regsout[35*B-1:34*B] : regsout[36*B-1:35*B];
  assign outs[37*B-1:36*B] = modebus[36] ? regsout[36*B-1:35*B] : regsout[37*B-1:36*B];
  assign outs[38*B-1:37*B] = modebus[37] ? regsout[37*B-1:36*B] : regsout[38*B-1:37*B];
  assign outs[39*B-1:38*B] = modebus[38] ? regsout[38*B-1:37*B] : regsout[39*B-1:38*B];
  assign outs[40*B-1:39*B] = modebus[39] ? regsout[39*B-1:38*B] : regsout[40*B-1:39*B];

  
endmodule
