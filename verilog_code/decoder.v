module decode1to2(
         en,in,out);
  input en;
  input in;
  output [1:0] out;
  assign out[0] = en & ~in;
  assign out[1] = en & in;
endmodule

module decode2to4(
         en, in, out);
  input en;
  input [1:0] in;
  output [3:0] out;
  
  decode1to2 DC1T2_0(en & ~in[1],in[0],out[1:0]);
  decode1to2 DC1T2_1(en & in[1],in[0],out[3:2]);
endmodule

module decode3to8(
         en, in, out);
  input en;
  input [2:0] in;
  output [7:0] out;
  
  decode2to4 DC2T4_0(en & ~in[2],in[1:0],out[3:0]);
  decode2to4 DC2T4_1(en & in[2],in[1:0],out[7:4]);
endmodule

module decode4to16(
         en, in, out);
  input en;
  input [3:0] in;
  output [15:0] out;
  
  decode3to8 DC3T8_0(en & ~in[3],in[2:0],out[7:0]);
  decode3to8 DC3T8_1(en & in[3],in[2:0],out[15:8]);
endmodule

module decode5to32(
         en, in, out);
  input en;
  input [4:0] in;
  output [31:0] out;
  
  decode4to16 DC4T16_0(en & ~in[4],in[3:0],out[15:0]);
  decode4to16 DC4T16_1(en & in[4],in[3:0],out[31:16]);
endmodule

module decode6to64(
         en, in, out);
  input en;
  input [5:0] in;
  output [63:0] out;
  
  decode5to32 DC5T32_0(en & ~in[5],in[4:0],out[31:0]);
  decode5to32 DC5T32_1(en & in[5],in[4:0],out[63:32]);
endmodule

module decode7to128(
         en, in, out);
  input en;
  input [6:0] in;
  output [127:0] out;
  
  decode6to64 DC6T64_0(en & ~in[6],in[5:0],out[63:0]);
  decode6to64 DC6T64_1(en & in[6],in[5:0],out[127:64]);
endmodule

module decode8to256(
         en, in, out);
  input en;
  input [7:0] in;
  output [255:0] out;
  
  decode7to128 DC7T128_0(en & ~in[7],in[6:0],out[127:0]);
  decode7to128 DC7T128_1(en & in[7],in[6:0],out[255:128]);
endmodule

module decode9to512(
         en, in, out);
  input en;
  input [8:0] in;
  output [511:0] out;
  
  decode8to256 DC8T256_0(en & ~in[8],in[7:0],out[255:0]);
  decode8to256 DC8T256_1(en & in[8],in[7:0],out[511:256]);
endmodule

module decode10to1024(
         en, in, out);
  input en;
  input [9:0] in;
  output [1023:0] out;
  
  decode9to512 DC9T512_0(en & ~in[9],in[8:0],out[511:0]);
  decode9to512 DC9T512_1(en & in[9],in[8:0],out[1023:512]);
endmodule
