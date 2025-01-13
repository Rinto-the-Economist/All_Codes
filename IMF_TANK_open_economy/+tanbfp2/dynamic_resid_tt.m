function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
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

assert(length(T) >= 20);

T(1) = (-1)/params(4);
T(2) = (1-params(5))*y(4)^T(1);
T(3) = params(5)*y(7)^T(1);
T(4) = y(5)^T(1);
T(5) = params(5)*y(8)^T(1);
T(6) = y(6)^T(1);
T(7) = params(5)*y(9)^T(1);
T(8) = 1-1/params(4);
T(9) = params(5)*y(8)^T(8)+(1-params(5))*y(5)^T(8);
T(10) = y(23)^T(1);
T(11) = params(2)*y(20)*T(10);
T(12) = params(5)*y(25)^T(8)+(1-params(5))*y(23)^T(8);
T(13) = params(5)*y(9)^T(8)+(1-params(5))*y(6)^T(8);
T(14) = y(24)^T(1);
T(15) = params(2)*y(20)*T(14);
T(16) = params(5)*y(26)^T(8)+(1-params(5))*y(24)^T(8);
T(17) = params(5)*y(7)^T(8)+(1-params(5))*y(4)^T(8);
T(18) = y(12)^((1-params(6))*(1-params(1))-1);
T(19) = y(15)*(1-params(6))*(1-params(1))*T(18);
T(20) = y(13)^params(6);

end
