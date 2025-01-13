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

assert(length(T) >= 34);

T = tanbnr_pit.static_resid_tt(T, y, x, params);

T(26) = (1-params(6))*getPowerDeriv(y(1),T(1),1);
T(27) = getPowerDeriv(y(2),T(1),1);
T(28) = y(13)*(1-params(6))*getPowerDeriv(y(2),T(9),1);
T(29) = getPowerDeriv(y(3),T(1),1);
T(30) = (1-params(6))*getPowerDeriv(y(3),T(9),1);
T(31) = y(13)*params(6)*getPowerDeriv(y(5),T(9),1);
T(32) = params(6)*getPowerDeriv(y(6),T(9),1);
T(33) = getPowerDeriv(y(9),params(7)*(1-params(1)),1);
T(34) = getPowerDeriv(y(10),params(7),1);

end
