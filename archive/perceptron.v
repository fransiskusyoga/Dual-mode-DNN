//Perceptron
//On every clock posedge this module run function below
//out' = out + sigmoid(in*w) 
//stop : (1) freeze output value
//bias_en : (1) bias = -1,(0) bias = 0
module perceptron(
         a,b,x,out,acti_en,stop);
  input [23:0] a,x;
  input [15:0] b;
  output [23:0] out;
  input acti_en;
  input stop;
   
  wire [23:0] outsummer, outmux1, outmul1;
  wire [15:0] inpactiv,outactiv;
  
  //Modules
  multiplication mul1(.a(a),.b(b),.out(outmul1)); 
  actifunction AF (.in(outmux1),.out(outactiv)); 
  
  //Multiplexer
  //mux1 : Stop the increment
  assign outmux1 = stop ? x : outsummer;
  //Summer
  assign outsummer = x + outmul1;
  assign out = acti_en ? {{3{outactiv[15]}},outactiv,{5{1'b0}}} : outmux1;
endmodule
