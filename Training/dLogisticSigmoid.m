function out = dLogisticSigmoid(in)
% dLogisticSigmoid Derivative dari logistic sigmoid.
% 
% INPUT:
% x     : Input vector.
%
% OUTPUT:
% y     : Output vector
%
  x1 = 0.974;
  y1 = 0.1218;
  x2 = 3.0260;
    out = 0.125*((in<x1)&(in>-x1)) + 0.125*((in<x2)&(in>-x2));
end