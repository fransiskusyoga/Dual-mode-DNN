function [out x2]= funAprox_2_4(in, x1)
  %% input checking
  
   %% Variable initialization
  y1 = x1/4;
  x2 = 4-x1;
  
  %% Output
  out = in/2        .*(in<=x1 & in>=-x1) ...
      + (in/4 + y1) .*(in>x1 & in<=x2) ...
      + (1)         .*(in>x2) ...
      + (in/4 - y1) .*(in<-x1 & in>=-x2) ...
      + (-1)        .*(in<-x2);
end