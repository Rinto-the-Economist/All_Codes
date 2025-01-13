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

assert(length(T) >= 21);

T = tanbfp2.static_resid_tt(T, y, x, params);

T(15) = (1-params(5))*getPowerDeriv(y(1),T(1),1);
T(16) = getPowerDeriv(y(2),T(1),1);
T(17) = (1-params(5))*getPowerDeriv(y(2),T(8),1);
T(18) = getPowerDeriv(y(3),T(1),1);
T(19) = (1-params(5))*getPowerDeriv(y(3),T(8),1);
T(20) = params(5)*getPowerDeriv(y(5),T(8),1);
T(21) = params(5)*getPowerDeriv(y(6),T(8),1);

end
