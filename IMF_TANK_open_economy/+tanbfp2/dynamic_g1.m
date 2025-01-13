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
    T = tanbfp2.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(19, 27);
g1(1,4)=T(21);
g1(1,7)=(-(params(5)*getPowerDeriv(y(7),T(1),1)/y(15)));
g1(1,15)=(-((-T(3))/(y(15)*y(15))));
g1(2,5)=(1-params(5))*T(22);
g1(2,8)=(-(params(5)*getPowerDeriv(y(8),T(1),1)/y(15)));
g1(2,15)=(-((-T(5))/(y(15)*y(15))));
g1(3,6)=(1-params(5))*T(24);
g1(3,9)=(-(params(5)*getPowerDeriv(y(9),T(1),1)/y(15)));
g1(3,15)=(-((-T(7))/(y(15)*y(15))));
g1(4,5)=(T(9)*T(22)-T(4)*T(23))/(T(9)*T(9));
g1(4,23)=(-((T(12)*params(2)*y(20)*getPowerDeriv(y(23),T(1),1)-T(11)*(1-params(5))*getPowerDeriv(y(23),T(8),1))/(T(12)*T(12))));
g1(4,8)=(-(T(4)*T(25)))/(T(9)*T(9));
g1(4,25)=(-((-(T(11)*params(5)*getPowerDeriv(y(25),T(8),1)))/(T(12)*T(12))));
g1(4,20)=(-(params(2)*T(10)/T(12)));
g1(5,6)=(T(13)*T(24)-T(6)*(1-params(5))*getPowerDeriv(y(6),T(8),1))/(T(13)*T(13));
g1(5,24)=(-((T(16)*params(2)*y(20)*getPowerDeriv(y(24),T(1),1)-T(15)*(1-params(5))*getPowerDeriv(y(24),T(8),1))/(T(16)*T(16))));
g1(5,9)=(-(T(6)*params(5)*getPowerDeriv(y(9),T(8),1)))/(T(13)*T(13));
g1(5,26)=(-((-(T(15)*params(5)*getPowerDeriv(y(26),T(8),1)))/(T(16)*T(16))));
g1(5,20)=(-(params(2)*T(14)/T(16)));
g1(6,4)=(-((1-y(10))*y(16)*(T(17)*T(21)-T(2)*(1-params(5))*getPowerDeriv(y(4),T(8),1))/(T(17)*T(17))));
g1(6,7)=(-((1-y(10))*y(16)*(-(T(2)*params(5)*getPowerDeriv(y(7),T(8),1)))/(T(17)*T(17))));
g1(6,10)=T(2)/T(17)*y(16);
g1(6,16)=(-(T(2)/T(17)*(1-y(10))));
g1(7,5)=(-((1-y(11))*y(16)*(T(9)*(1-params(5))*T(22)-(1-params(5))*T(4)*T(23))/(T(9)*T(9))));
g1(7,8)=(-((1-y(11))*y(16)*(-((1-params(5))*T(4)*T(25)))/(T(9)*T(9))));
g1(7,11)=y(16)*(1-params(5))*T(4)/T(9);
g1(7,16)=(-((1-params(5))*T(4)/T(9)*(1-y(11))));
g1(8,4)=1;
g1(8,7)=y(15);
g1(8,10)=(-y(16));
g1(8,15)=y(7);
g1(8,16)=(-y(10));
g1(8,22)=(-1);
g1(9,5)=1;
g1(9,8)=y(15);
g1(9,11)=(-y(16));
g1(9,15)=y(8);
g1(9,16)=(-y(11));
g1(9,2)=(-1);
g1(9,18)=1/y(20);
g1(9,20)=(-y(18))/(y(20)*y(20));
g1(9,21)=(-1);
g1(10,6)=1;
g1(10,9)=y(15);
g1(10,14)=(-1);
g1(10,15)=y(9);
g1(10,3)=(-1);
g1(10,19)=1/y(20);
g1(10,20)=(-y(19))/(y(20)*y(20));
g1(11,12)=T(20)*y(15)*(1-params(6))*(1-params(1))*getPowerDeriv(y(12),(1-params(6))*(1-params(1))-1,1);
g1(11,13)=T(19)*getPowerDeriv(y(13),params(6),1);
g1(11,15)=T(20)*(1-params(6))*(1-params(1))*T(18);
g1(11,16)=(-1);
g1(12,12)=(-y(16));
g1(12,13)=y(15);
g1(12,15)=y(13);
g1(12,16)=(-y(12));
g1(12,17)=(-1);
g1(13,12)=getPowerDeriv(y(12),1-params(1),1);
g1(13,13)=(-1);
g1(14,17)=(-1);
g1(14,21)=params(9);
g1(14,22)=1-params(9);
g1(15,7)=(-(1-params(9)));
g1(15,8)=(-params(9));
g1(15,9)=(-1);
g1(15,13)=1;
g1(16,4)=(-(1-params(9)));
g1(16,5)=(-params(9));
g1(16,6)=(-1);
g1(16,14)=1;
g1(17,10)=1-params(9);
g1(17,11)=params(9);
g1(17,12)=(-1);
g1(18,18)=params(9);
g1(18,19)=1;
g1(19,1)=params(7);
g1(19,14)=(-1);
g1(19,27)=(-1);

end
