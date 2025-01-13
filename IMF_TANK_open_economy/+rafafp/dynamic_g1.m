function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = rafafp.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(10, 12);
g1(1,2)=T(11);
g1(1,4)=(-(params(4)*getPowerDeriv(y(4),T(1),1)/y(9)));
g1(1,9)=(-((-T(3))/(y(9)*y(9))));
g1(2,3)=(1-params(4))*getPowerDeriv(y(3),T(1),1);
g1(2,5)=(-(params(4)*getPowerDeriv(y(5),T(1),1)/y(9)));
g1(2,9)=(-((-T(4))/(y(9)*y(9))));
g1(3,2)=(-((1-y(6))*y(10)*(T(6)*T(11)-T(2)*(1-params(4))*getPowerDeriv(y(2),T(5),1))/(T(6)*T(6))));
g1(3,4)=(-((1-y(6))*y(10)*(-(T(2)*params(4)*getPowerDeriv(y(4),T(5),1)))/(T(6)*T(6))));
g1(3,6)=T(2)/T(6)*y(10);
g1(3,10)=(-(T(2)/T(6)*(1-y(6))));
g1(4,2)=1;
g1(4,4)=y(9);
g1(4,6)=(-y(10));
g1(4,9)=y(4);
g1(4,10)=(-y(6));
g1(4,11)=(-1);
g1(5,3)=1;
g1(5,5)=y(9);
g1(5,8)=(-1);
g1(5,9)=y(5);
g1(6,6)=T(9)*y(9)*(1-params(5))*(1-params(1))*getPowerDeriv(y(6),(1-params(5))*(1-params(1))-1,1);
g1(6,7)=T(8)*getPowerDeriv(y(7),params(5),1);
g1(6,9)=T(9)*(1-params(5))*(1-params(1))*T(7);
g1(6,10)=(-1);
g1(7,6)=y(9)*getPowerDeriv(y(6),1-params(1),1)-y(10);
g1(7,9)=T(10);
g1(7,10)=(-y(6));
g1(7,11)=(-1);
g1(8,4)=(-1);
g1(8,5)=(-1);
g1(8,7)=1;
g1(9,2)=(-1);
g1(9,3)=(-1);
g1(9,8)=1;
g1(10,1)=params(6);
g1(10,8)=(-1);
g1(10,12)=(-1);

end
