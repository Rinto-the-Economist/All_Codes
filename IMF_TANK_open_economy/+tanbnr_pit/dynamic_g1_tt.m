function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_g1_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 44);

T = tanbnr_pit.dynamic_resid_tt(T, y, x, params, steady_state, it_);

T(37) = (1-params(6))*getPowerDeriv(y(7),T(1),1);
T(38) = getPowerDeriv(y(8),T(1),1);
T(39) = y(19)*(1-params(6))*getPowerDeriv(y(8),T(9),1);
T(40) = getPowerDeriv(y(9),T(1),1);
T(41) = y(19)*params(6)*getPowerDeriv(y(11),T(9),1);
T(42) = getPowerDeriv(y(1),params(7)*(1-params(1)),1);
T(43) = getPowerDeriv(y(2),params(7),1);
T(44) = getPowerDeriv(y(16),params(7),1);

end
