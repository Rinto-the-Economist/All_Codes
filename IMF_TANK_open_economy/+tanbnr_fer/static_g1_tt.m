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

assert(length(T) >= 31);

T = tanbnr_fer.static_resid_tt(T, y, x, params);

T(23) = (1-params(6))*getPowerDeriv(y(1),T(1),1);
T(24) = getPowerDeriv(y(2),T(1),1);
T(25) = (1-params(6))*getPowerDeriv(y(2),T(8),1);
T(26) = getPowerDeriv(y(3),T(1),1);
T(27) = (1-params(6))*getPowerDeriv(y(3),T(8),1);
T(28) = params(6)*getPowerDeriv(y(5),T(8),1);
T(29) = params(6)*getPowerDeriv(y(6),T(8),1);
T(30) = getPowerDeriv(y(9),params(7)*(1-params(1)),1);
T(31) = getPowerDeriv(y(10),params(7),1);

end
