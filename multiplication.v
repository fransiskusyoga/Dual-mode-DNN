//Fixed point (32'h00.000000) multiplication 
//Nx: number of x input bit
//Px: posisitoin of point
// x: (Nx-Px).(Px)
//    Decimal.Fraction
module multiplication#(
         parameter Na = 24,
         parameter Pa = 20,
         parameter Nb = 16,
         parameter Pb = 15,
         parameter Nout = 24,
         parameter Pout = 20)(
         a,b,out );
  input signed [Na-1:0] a;
  input signed [Nb-1:0] b;
  output signed [Nout-1:0] out;
  wire signed [Na+Nb-1:0] result;
  assign result = a*b;
  assign out[Nout-1:0] = result[Pa+Pb+Nout-Pout-1:Pa+Pb-Pout];
endmodule