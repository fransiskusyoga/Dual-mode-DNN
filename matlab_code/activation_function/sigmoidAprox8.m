function [out x2]= sigmoidAprox8(in, x1)
  %% input checking
  
   %% Variable initialization
  y1 = x1/8;
  x2 = 4 - x1;
  
  %% Output
  out = in/4 - (in/8 - y1).*(in>x1) - (in/8 - 0.5 + y1).*(in>x2) ...
      - (in/8 + y1).*(in<-x1) - (in/8 + 0.5 - y1).*(in<-x2);
  out = out +0.5;
end