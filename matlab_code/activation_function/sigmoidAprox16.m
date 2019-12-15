function [out x2]= sigmoidAprox16(in, x1)
  %% input checking
  
  %% Variable initialization
  y1 = x1*3/16;
  x2 = (0.5 - y1)*16;
  
  %% Output
  out = in/4 - (in*3/16 - y1).*(in>x1) - (in/16 - 0.5 + y1).*(in>x2) ...
       - (in*3/16 + y1).*(in<-x1) - (in/16 + 0.5 - y1).*(in<-x2);
  out = out +0.5;
end