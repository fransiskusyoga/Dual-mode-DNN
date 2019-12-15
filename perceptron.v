//Perceptron
//On every clock posedge this module run function below
//out = x + a*b;
module perceptron(
         a0,a1,b,x0,x1,mode,out);
  input [23:0] a0,a1,x0,x1;
  input [15:0] b;
  input mode;
  output [23:0] out;
   
  wire [23:0] outmul1,outmuxA,outmuxX;
  
  //Modules
  multiplication mul1(.a(outmuxA),.b(b),.out(outmul1)); 
  //Multiplexer
  assign outmuxA = mode ? a1 : a0;
  assign outmuxX = mode ? x1 : x0;
  //Summer
  assign out = outmuxX + outmul1;
endmodule
