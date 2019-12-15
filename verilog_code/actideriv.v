//Derivation of acivation function multiplied with input (in)
//out = in*deriv(z)
//in*deriv(z) = if (z<-3.0)||(z>3.0) then 0
//              elsif (z<-1.0)||(z>1.0) then in/8
//              else in/4
module actideriv(
  input [23:0] in,
  input [23:0] z,
  output [23:0] out
);
  wire [23:0] outmux0;
  wire slc1, slc2; 
  
  //Mulltiplexers
  //mux0 : Gradient selector m=1/4 or m=1/8
  assign outmux0 = slc1 ? {{3{in[23]}} , in[23:3]} : {{2{in[23]}} , in[23:2]};
  //mux1 : Saturation selector (0 or outmux0)
  assign out = slc2 ? 24'h0 : outmux0;
  
  //Select wire assignment                      // slc0 : 1 if negative
  assign slc1 = (z<24'hF00000)&&(z>24'h100000); // slc1 = (z<-1.0)||(z>1.0)
  assign slc2 = (z<24'hD00000)&&(z>24'h300000); // slc4 = (z<-3.0)||(z>3.0)
endmodule
