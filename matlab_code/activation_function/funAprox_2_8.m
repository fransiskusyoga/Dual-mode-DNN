function [out x2]= funAprox_2_8(in, x1)
  %% input checking
  
   %% Variable initialization
  y1 = x1*3/8;
  x2 = 8-3*x1;
  
  %% Output
  out = in/2        .*(in<=x1 & in>=-x1) ...
      + (in/8 + y1) .*(in>x1 & in<=x2) ...
      + (1)         .*(in>x2) ...
      + (in/8 - y1) .*(in<-x1 & in>=-x2) ...
      + (-1)        .*(in<-x2);
end