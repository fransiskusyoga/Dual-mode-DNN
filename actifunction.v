//Sigmoid function approach using partial linearization
//with 3 gradient value 0,1/4, and 1/8
module actifunction(
  input [23:0] in,
  output [15:0] out
);
  wire [15:0] outmux0, outmux1, outmux2, outmux3;
  wire [15:0] result;
  wire slc0, slc1, slc4; //slc12=slc1 ; slc3 = slc0
  
  //Mulltiplexers
  //mux0 : Constant selector  y1 = 0.375 or y3 = 0.625
  assign outmux0 = slc0 ? 16'h3000 : 16'h5000;
  //mux1 : Constant selector outmux1 = c (outmux0 or 0.5)
  assign outmux1 = slc1 ? outmux0 : 16'h4000;
  //mux2 : Gradien selector mx (x/8) or (x/4) 
  assign outmux2 = slc1 ? in[23:8] : in[22:7];
  //mux3 : Saturation selector (0 or 1)
  assign outmux3 = slc0 ? 16'h0 : 16'h7FFF;
  //mux4 : Output selector
  assign out = slc4 ? outmux3 : result;
  
  //Select wire assignment
  assign slc0 = in[23];                           // slc0 : 1 if negative
  assign slc1 = (in<24'hF00000)&&(in>24'h100000); // slc1 = (in<-1.0)||(in>1.0)
  assign slc4 = (in<24'hD00000)&&(in>24'h300000); // slc4 = (in<-3.0)||(in>3.0)
  //adder to calculate output function
  assign result = outmux2 + outmux1; //mx + c
endmodule