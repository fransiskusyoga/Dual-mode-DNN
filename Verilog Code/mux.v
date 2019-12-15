//Mux N bit with 2 inputs
module mux2in #(
         parameter N = 16)(
         in0, in1, out, slc);
  input [N-1:0] in0, in1;
  output [N-1:0] out;
  input slc;
  assign out = slc ? in1 : in0;
endmodule

//Mux N bit with 4 input
module mux4in #(
         parameter N = 16)(
         in0,in1,in2,in3,out,slc);
  input [N-1:0] in0,in1,in2,in3;
  output [N-1:0] out;
  input [1:0] slc;
  wire [N-1:0] outmux1, outmux2;
  
  assign outmux1 = slc[0] ? in1 : in0;
  assign outmux2 = slc[0] ? in3 : in2;
  assign out = slc[1] ? outmux2 : outmux1;
endmodule

//Mux N bit with 8 input
module mux8in #(
        parameter N = 16) (
        in0, in1, in2, in3, in4, in5, in6, in7,
        out, slc);
  input [N-1:0] in0, in1, in2, in3, in4, in5, in6, in7;
  output [N-1:0] out;
  input [2:0] slc;
  wire [N-1:0] outmux1, outmux2;
  
  mux4in #(N) mux1 (
    .in0(in0),.in1(in1),.in2(in2), .in3(in3),
    .out(outmux1),.slc(slc[1:0]));
  mux4in #(N) mux2 (
    .in0(in4),.in1(in5),.in2(in6), .in3(in7),
    .out(outmux2),.slc(slc[1:0]));
  assign out = slc[2] ? outmux2 : outmux1;
endmodule

//Mux N bit with 16 input
module mux16in #(
        parameter N = 16) (
        in0, in1, in2, in3, in4, in5, in6, in7,
        in8, in9, in10, in11, in12, in13, in14, in15,
        out, slc);
  input [N-1:0] in0, in1, in2, in3, in4, in5, in6, in7;
  input [N-1:0] in8, in9, in10, in11, in12, in13, in14, in15;
  output [N-1:0] out;
  input [3:0] slc;
  wire [N-1:0] outmux1, outmux2;
  
  mux8in #(N) mux1 (
    .in0(in0),.in1(in1),.in2(in2), .in3(in3),
    .in4(in4),.in5(in5),.in6(in6), .in7(in7),
    .out(outmux1),.slc(slc[2:0]));
  mux8in #(N) mux2 (
    .in0(in8),.in1(in9),.in2(in10), .in3(in11),    
    .in4(in12),.in5(in13),.in6(in14), .in7(in15),
    .out(outmux2),.slc(slc[2:0]));
  assign out = slc[3] ? outmux2 : outmux1;
endmodule

//Mux N bit with 32 input
module mux32in #(
        parameter N = 16) (
        in0, in1, in2, in3, in4, in5, in6, in7,
        in8, in9, in10, in11, in12, in13, in14, in15,
        in16, in17, in18, in19, in20, in21, in22, in23,
        in24, in25, in26, in27, in28, in29, in30, in31,
        out, slc);
  input [N-1:0] in0, in1, in2, in3, in4, in5, in6, in7;
  input [N-1:0] in8, in9, in10, in11, in12, in13, in14, in15;
  input [N-1:0] in16, in17, in18, in19, in20, in21, in22, in23;
  input [N-1:0] in24, in25, in26, in27, in28, in29, in30, in31;
  output [N-1:0] out;
  input [4:0] slc;
  wire [N-1:0] outmux1, outmux2;
  
  mux16in #(N) mux1 (
    .in0(in0),.in1(in1),.in2(in2),.in3(in3),
    .in4(in4),.in5(in5),.in6(in6),.in7(in7),
    .in8(in8),.in9(in9),.in10(in10),.in11(in11),
    .in12(in12),.in13(in13),.in14(in14),.in15(in15),
    .out(outmux1),.slc(slc[3:0]));
  mux16in #(N) mux2 (
    .in0(in16),.in1(in17),.in2(in18),.in3(in19),
    .in4(in20),.in5(in21),.in6(in22),.in7(in23),
    .in8(in24),.in9(in25),.in10(in26),.in11(in27),
    .in12(in28),.in13(in29),.in14(in30),.in15(in31),
    .out(outmux2),.slc(slc[3:0]));
  assign out = slc[4] ? outmux2 : outmux1;
endmodule

//Mux N bit with 32 input
module mux40in #(
        parameter N = 16) (
        in0, in1, in2, in3, in4, in5, in6, in7,
        in8, in9, in10, in11, in12, in13, in14, in15,
        in16, in17, in18, in19, in20, in21, in22, in23,
        in24, in25, in26, in27, in28, in29, in30, in31,
        in32, in33, in34, in35, in36, in37, in38, in39,
        out, slc);
  input [N-1:0] in0, in1, in2, in3, in4, in5, in6, in7;
  input [N-1:0] in8, in9, in10, in11, in12, in13, in14, in15;
  input [N-1:0] in16, in17, in18, in19, in20, in21, in22, in23;
  input [N-1:0] in24, in25, in26, in27, in28, in29, in30, in31;
  input [N-1:0] in32, in33, in34, in35, in36, in37, in38, in39;
  output [N-1:0] out;
  input [5:0] slc;
  wire [N-1:0] outmux1, outmux2;
  
  mux32in #(N) mux1 (
    .in0(in0),.in1(in1),.in2(in2), .in3(in3),
    .in4(in4),.in5(in5),.in6(in6), .in7(in7),
    .in8(in8),.in9(in9),.in10(in10),.in11(in11),
    .in12(in12),.in13(in13),.in14(in14),.in15(in15),
    .in16(in16),.in17(in17),.in18(in18),.in19(in19),
    .in20(in20),.in21(in21),.in22(in22),.in23(in23),
    .in24(in24),.in25(in25),.in26(in26),.in27(in27),
    .in28(in28),.in29(in29),.in30(in30),.in31(in31),
    .out(outmux1),.slc(slc[4:0]));
  mux8in #(N) mux2 (
    .in0(in32),.in1(in33),.in2(in34), .in3(in35),
    .in4(in36),.in5(in37),.in6(in38), .in7(in39),
    .out(outmux2),.slc(slc[2:0]));
  assign out = slc[5] ? outmux2 : outmux1;
endmodule

module mux64in #(
        parameter N = 16) (
        in0, in1, in2, in3, in4, in5, in6, in7,
        in8, in9, in10, in11, in12, in13, in14, in15,
        in16, in17, in18, in19, in20, in21, in22, in23,
        in24, in25, in26, in27, in28, in29, in30, in31,
        in32, in33, in34, in35, in36, in37, in38, in39,
        in40, in41, in42, in43, in44, in45, in46, in47,
        in48, in49, in50, in51, in52, in53, in54, in55,
        in56, in57, in58, in59, in60, in61, in62, in63,
        out, slc);
  input [N-1:0] in0, in1, in2, in3, in4, in5, in6, in7;
  input [N-1:0] in8, in9, in10, in11, in12, in13, in14, in15;
  input [N-1:0] in16, in17, in18, in19, in20, in21, in22, in23;
  input [N-1:0] in24, in25, in26, in27, in28, in29, in30, in31;
  input [N-1:0] in32, in33, in34, in35, in36, in37, in38, in39;
  input [N-1:0] in40, in41, in42, in43, in44, in45, in46, in47;
  input [N-1:0] in48, in49, in50, in51, in52, in53, in54, in55;
  input [N-1:0] in56, in57, in58, in59, in60, in61, in62, in63;
  output [N-1:0] out;
  input [5:0] slc;
  wire [N-1:0] outmux1, outmux2;
  mux32in #(N) mux1 (
    .in0(in0),.in1(in1),.in2(in2), .in3(in3),
    .in4(in4),.in5(in5),.in6(in6), .in7(in7),
    .in8(in8),.in9(in9),.in10(in10),.in11(in11),
    .in12(in12),.in13(in13),.in14(in14),.in15(in15),
    .in16(in16),.in17(in17),.in18(in18),.in19(in19),
    .in20(in20),.in21(in21),.in22(in22),.in23(in23),
    .in24(in24),.in25(in25),.in26(in26),.in27(in27),
    .in28(in28),.in29(in29),.in30(in30),.in31(in31),
    .out(outmux1),.slc(slc[4:0]));
  mux32in #(N) mux2 (
    .in0(in32),.in1(in33),.in2(in34), .in3(in35),
    .in4(in36),.in5(in37),.in6(in38), .in7(in39),
    .in8(in40),.in9(in41),.in10(in42),.in11(in43),
    .in12(in44),.in13(in45),.in14(in46),.in15(in47),
    .in16(in48),.in17(in49),.in18(in50),.in19(in51),
    .in20(in52),.in21(in53),.in22(in54),.in23(in55),
    .in24(in56),.in25(in57),.in26(in58),.in27(in59),
    .in28(in60),.in29(in61),.in30(in62),.in31(in63),
    .out(outmux2),.slc(slc[4:0]));
  assign out = slc[5] ? outmux2 : outmux1;
endmodule
