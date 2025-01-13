function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = tanbfp.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(19, 1);
residual(1) = T(2)-T(3)/y(15);
residual(2) = (1-params(5))*T(4)-T(5)/y(15);
residual(3) = (1-params(5))*T(6)-T(7)/y(15);
residual(4) = T(4)/T(9)-T(11)/T(12);
residual(5) = T(6)/T(13)-T(15)/T(16);
residual(6) = params(3)-T(2)/T(17)*y(16)*(1-y(10));
residual(7) = params(3)-y(16)*(1-params(5))*T(4)/T(9)*(1-y(11));
residual(8) = y(4)+y(7)*y(15)-y(16)*y(10)-y(22);
residual(9) = y(5)+y(15)*y(8)-y(16)*y(11)-y(21)-(y(2)-y(18)/y(20));
residual(10) = y(6)+y(15)*y(9)-y(14)-(y(3)-y(19)/y(20));
residual(11) = T(19)*T(20)-y(16);
residual(12) = y(15)*T(21)-y(16)*y(12)-y(17);
residual(13) = y(21)*params(9)+y(22)*(1-params(9))-y(17);
residual(14) = y(21)-y(17);
residual(15) = y(13)-y(7)*(1-params(9))-y(8)*params(9)-y(9);
residual(16) = y(14)-y(4)*(1-params(9))-y(5)*params(9)-y(6);
residual(17) = y(11)*params(9)+y(10)*(1-params(9))-y(12);
residual(18) = y(19)+y(18)*params(9);
residual(19) = params(8)+params(7)*y(1)-x(it_, 1)-y(14);

end
