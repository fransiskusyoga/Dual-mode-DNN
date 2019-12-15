function [out x2]= funAprox_1_4(in, x1)
  %% input checking
  
   %% Variable initialization
  y1 = x1*3/4;
  x2 = 4-3*x1;
  
  %% Output
  out = in          .*(in<=x1 & in>=-x1) ...
      + (in/4 + y1) .*(in>x1 & in<=x2) ...
      + (1)         .*(in>x2) ...
      + (in/4 - y1) .*(in<-x1 & in>=-x2) ...
      + (-1)        .*(in<-x2);
end