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

assert(length(T) >= 15);

T(1) = (-1)/params(4);
T(2) = y(1)^T(1);
T(3) = params(5)*y(3)^T(1);
T(4) = y(2)^T(1);
T(5) = params(5)*y(4)^T(1);
T(6) = 1-1/params(4);
T(7) = params(5)*y(3)^T(6)+(1-params(5))*y(1)^T(6);
T(8) = params(4)/(params(4)-1);
T(9) = T(7)^T(8);
T(10) = params(5)*y(4)^T(6)+(1-params(5))*y(2)^T(6);
T(11) = T(10)^T(8);
T(12) = y(5)^((1-params(6))*(1-params(1))-1);
T(13) = y(8)*(1-params(6))*(1-params(1))*T(12);
T(14) = y(6)^params(6);
T(15) = y(5)^(1-params(1));

end
