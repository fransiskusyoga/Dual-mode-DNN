function [out x2]= funAprox_1_2(in, x1)
  %% input checking
  
   %% Variable initialization
  y1 = x1/2;
  x2 = 2-x1;
  
  %% Output
  out = in          .*(in<=x1 & in>=-x1) ...
      + (in/2 + y1) .*(in>x1 & in<=x2) ...
      + (1)         .*(in>x2) ...
      + (in/2 - y1) .*(in<-x1 & in>=-x2) ...
      + (-1)        .*(in<-x2);
end