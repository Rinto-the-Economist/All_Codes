function T = static_g1_tt(T, y, x, params)
% function T = static_g1_tt(T, y, x, params)
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

assert(length(T) >= 23);

T = ranbfp_test.static_resid_tt(T, y, x, params);

T(16) = getPowerDeriv(y(1),T(1),1);
T(17) = getPowerDeriv(T(7),T(8),1);
T(18) = (1-params(5))*getPowerDeriv(y(1),T(6),1)*T(17);
T(19) = getPowerDeriv(y(2),T(1),1);
T(20) = getPowerDeriv(T(10),T(8),1);
T(21) = (1-params(5))*getPowerDeriv(y(2),T(6),1)*T(20);
T(22) = T(17)*params(5)*getPowerDeriv(y(3),T(6),1);
T(23) = T(20)*params(5)*getPowerDeriv(y(4),T(6),1);

end
