function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 14);

T(1) = (-1)/params(4);
T(2) = (1-params(5))*y(1)^T(1);
T(3) = params(5)*y(4)^T(1);
T(4) = y(2)^T(1);
T(5) = params(5)*y(5)^T(1);
T(6) = y(3)^T(1);
T(7) = params(5)*y(6)^T(1);
T(8) = 1-1/params(4);
T(9) = params(5)*y(5)^T(8)+(1-params(5))*y(2)^T(8);
T(10) = params(5)*y(6)^T(8)+(1-params(5))*y(3)^T(8);
T(11) = params(5)*y(4)^T(8)+(1-params(5))*y(1)^T(8);
T(12) = y(9)^((1-params(6))*(1-params(1))-1);
T(13) = y(12)*(1-params(6))*(1-params(1))*T(12);
T(14) = y(10)^params(6);

end
