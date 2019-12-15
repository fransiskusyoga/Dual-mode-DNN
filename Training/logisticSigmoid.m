function out = logisticSigmoid(in)
% simpleLogisticSigmoid Logistic sigmoid activation function
% 
% INPUT:
% x     : Input vector.
%
% OUTPUT:
% y     : Output vector where the logistic sigmoid was applied element by
% element.
%
  x1 = 0.974;
  y1 = 0.1218;
  x2 = 3.0260;
  
  %% Output
  out = in/4 - (in/8 - y1).*(in>x1) - (in/8 - 0.5 + y1).*(in>x2) ...
      - (in/8 + y1).*(in<-x1) - (in/8 + 0.5 - y1).*(in<-x2);
  out = out +0.5;
end