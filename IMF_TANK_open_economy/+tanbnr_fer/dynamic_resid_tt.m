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

assert(length(T) >= 34);

T(1) = (-1)/params(5);
T(2) = (1-params(6))*y(7)^T(1);
T(3) = params(6)*y(10)^T(1);
T(4) = y(8)^T(1);
T(5) = params(6)*y(11)^T(1);
T(6) = y(9)^T(1);
T(7) = params(6)*y(12)^T(1);
T(8) = 1-1/params(5);
T(9) = params(6)*y(11)^T(8)+(1-params(6))*y(8)^T(8);
T(10) = y(26)^T(1);
T(11) = params(2)*y(23)*T(10);
T(12) = params(6)*y(28)^T(8)+(1-params(6))*y(26)^T(8);
T(13) = params(6)*y(12)^T(8)+(1-params(6))*y(9)^T(8);
T(14) = y(27)^T(1);
T(15) = params(2)*y(23)*T(14);
T(16) = params(6)*y(29)^T(8)+(1-params(6))*y(27)^T(8);
T(17) = params(6)*y(10)^T(8)+(1-params(6))*y(7)^T(8);
T(18) = y(15)^((1-params(7))*(1-params(1))-1);
T(19) = y(18)*(1-params(7))*(1-params(1))*T(18);
T(20) = y(16)^params(7);
T(21) = y(1)^(params(7)*(1-params(1)));
T(22) = y(15)^(params(7)*(1-params(1)));
T(23) = y(4)*T(22);
T(24) = y(2)^params(7);
T(25) = T(23)*T(24);
T(26) = (1-params(1))*y(16)*y(18)*params(4)*(y(18)*T(20)*T(21)/T(25)-1)*(-params(7));
T(27) = y(18)*T(26);
T(28) = T(20)*T(27);
T(29) = y(15)^(1+params(7)*(1-params(1)));
T(30) = y(4)*T(29);
T(31) = T(24)*T(30);
T(32) = y(15)^(1-params(1));
T(33) = params(4)/2*(y(18)/y(4)-1)^2;
T(34) = y(18)*T(33);

end
