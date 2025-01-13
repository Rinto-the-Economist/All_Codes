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

assert(length(T) >= 25);

T(1) = (-1)/params(5);
T(2) = (1-params(6))*y(1)^T(1);
T(3) = params(6)*y(4)^T(1);
T(4) = y(2)^T(1);
T(5) = params(6)*y(5)^T(1);
T(6) = y(3)^T(1);
T(7) = params(6)*y(6)^T(1);
T(8) = y(12)/y(13);
T(9) = 1-1/params(5);
T(10) = params(6)*y(5)^T(9)+(1-params(6))*y(2)^T(9);
T(11) = y(13)*T(10);
T(12) = params(6)*y(6)^T(9)+(1-params(6))*y(3)^T(9);
T(13) = params(6)*y(4)^T(9)+(1-params(6))*y(1)^T(9);
T(14) = y(13)*T(13);
T(15) = y(9)^((1-params(7))*(1-params(1))-1);
T(16) = y(12)*(1-params(7))*(1-params(1))*T(15);
T(17) = y(10)^params(7);
T(18) = y(9)^(params(7)*(1-params(1)));
T(19) = (1-params(1))*y(10)*y(12)*params(4)*(T(18)*y(12)*T(17)/(T(17)*y(12)*T(18))-1)*(-params(7));
T(20) = y(12)*T(19);
T(21) = T(17)*T(20);
T(22) = y(9)^(1+params(7)*(1-params(1)));
T(23) = y(12)*T(22);
T(24) = T(17)*T(23);
T(25) = y(9)^(1-params(1));

end
