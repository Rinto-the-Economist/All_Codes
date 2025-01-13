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
    T = tanbnr_pit.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(20, 32);
g1(1,7)=T(37)/y(19);
g1(1,10)=(-(params(6)*getPowerDeriv(y(10),T(1),1)/y(18)));
g1(1,18)=(-((-T(3))/(y(18)*y(18))));
g1(1,19)=(-T(2))/(y(19)*y(19));
g1(2,8)=(1-params(6))*T(38)/y(19);
g1(2,11)=(-(params(6)*getPowerDeriv(y(11),T(1),1)/y(18)));
g1(2,18)=(-((-T(5))/(y(18)*y(18))));
g1(2,19)=(-((1-params(6))*T(4)))/(y(19)*y(19));
g1(3,9)=(1-params(6))*T(40);
g1(3,12)=(-(params(6)*getPowerDeriv(y(12),T(1),1)/T(8)));
g1(3,18)=(-((-(T(7)*1/y(19)))/(T(8)*T(8))));
g1(3,19)=(-((-(T(7)*(-y(18))/(y(19)*y(19))))/(T(8)*T(8))));
g1(4,8)=(T(11)*T(38)-T(4)*T(39))/(T(11)*T(11));
g1(4,27)=(-((T(15)*params(2)*y(24)*getPowerDeriv(y(27),T(1),1)-T(13)*y(31)*(1-params(6))*getPowerDeriv(y(27),T(9),1))/(T(15)*T(15))));
g1(4,11)=(-(T(4)*T(41)))/(T(11)*T(11));
g1(4,29)=(-((-(T(13)*y(31)*params(6)*getPowerDeriv(y(29),T(9),1)))/(T(15)*T(15))));
g1(4,19)=(-(T(4)*T(10)))/(T(11)*T(11));
g1(4,31)=(-((-(T(13)*T(14)))/(T(15)*T(15))));
g1(4,24)=(-(params(2)*T(12)/T(15)));
g1(5,9)=(T(16)*T(40)-T(6)*(1-params(6))*getPowerDeriv(y(9),T(9),1))/(T(16)*T(16));
g1(5,28)=(-((T(19)*params(2)*y(24)*getPowerDeriv(y(28),T(1),1)-T(18)*(1-params(6))*getPowerDeriv(y(28),T(9),1))/(T(19)*T(19))));
g1(5,12)=(-(T(6)*params(6)*getPowerDeriv(y(12),T(9),1)))/(T(16)*T(16));
g1(5,30)=(-((-(T(18)*params(6)*getPowerDeriv(y(30),T(9),1)))/(T(19)*T(19))));
g1(5,24)=(-(params(2)*T(17)/T(19)));
g1(6,7)=(-((1-y(13))*y(20)*(T(21)*T(37)-T(2)*y(19)*(1-params(6))*getPowerDeriv(y(7),T(9),1))/(T(21)*T(21))));
g1(6,10)=(-((1-y(13))*y(20)*(-(T(2)*y(19)*params(6)*getPowerDeriv(y(10),T(9),1)))/(T(21)*T(21))));
g1(6,13)=T(2)/T(21)*y(20);
g1(6,19)=(-((1-y(13))*y(20)*(-(T(2)*T(20)))/(T(21)*T(21))));
g1(6,20)=(-(T(2)/T(21)*(1-y(13))));
g1(7,8)=(-((1-y(14))*y(20)*(T(11)*(1-params(6))*T(38)-(1-params(6))*T(4)*T(39))/(T(11)*T(11))));
g1(7,11)=(-((1-y(14))*y(20)*(-((1-params(6))*T(4)*T(41)))/(T(11)*T(11))));
g1(7,14)=y(20)*(1-params(6))*T(4)/T(11);
g1(7,19)=(-((1-y(14))*y(20)*(-((1-params(6))*T(4)*T(10)))/(T(11)*T(11))));
g1(7,20)=(-((1-params(6))*T(4)/T(11)*(1-y(14))));
g1(8,7)=y(19);
g1(8,10)=y(18);
g1(8,13)=(-y(20));
g1(8,18)=y(10);
g1(8,19)=y(7);
g1(8,20)=(-y(13));
g1(8,26)=(-1);
g1(9,8)=y(19);
g1(9,11)=y(18);
g1(9,14)=(-y(20));
g1(9,18)=y(11);
g1(9,19)=y(8)-(y(5)-y(22)/y(24));
g1(9,20)=(-y(14));
g1(9,5)=(-y(19));
g1(9,22)=(-(y(19)*(-(1/y(24)))));
g1(9,24)=(-(y(19)*(-((-y(22))/(y(24)*y(24))))));
g1(9,25)=(-1);
g1(10,9)=1;
g1(10,12)=T(8);
g1(10,17)=(-1);
g1(10,18)=y(12)*1/y(19);
g1(10,19)=y(12)*(-y(18))/(y(19)*y(19));
g1(10,6)=(-1);
g1(10,23)=1/y(24);
g1(10,24)=(-y(23))/(y(24)*y(24));
g1(11,1)=(-((T(32)*T(42)+T(25)*T(24)*y(18)*(1-params(1))*(-params(7))*y(16)*y(18)*params(4)*y(18)*T(24)*T(42)/T(29))/T(35)));
g1(11,15)=T(24)*y(18)*(1-params(7))*(1-params(1))*getPowerDeriv(y(15),(1-params(7))*(1-params(1))-1,1)-(T(35)*T(25)*T(24)*y(18)*(1-params(1))*(-params(7))*y(16)*y(18)*params(4)*(-(y(18)*T(24)*T(25)*T(28)*y(4)*getPowerDeriv(y(15),params(7)*(1-params(1)),1)))/(T(29)*T(29))-T(25)*T(32)*T(28)*y(4)*getPowerDeriv(y(15),1+params(7)*(1-params(1)),1))/(T(35)*T(35));
g1(11,2)=(-((T(35)*T(25)*T(24)*y(18)*(1-params(1))*(-params(7))*y(16)*y(18)*params(4)*(-(y(18)*T(24)*T(25)*T(27)*T(43)))/(T(29)*T(29))-T(25)*T(32)*T(34)*T(43))/(T(35)*T(35))));
g1(11,16)=T(23)*T(44)-T(25)*(T(31)*T(44)+T(24)*y(18)*(1-params(1))*(-params(7))*(y(18)*params(4)*(y(18)*T(24)*T(25)/T(29)-1)+y(16)*y(18)*params(4)*T(25)*y(18)*T(44)/T(29)))/T(35);
g1(11,4)=(-((T(35)*T(25)*T(24)*y(18)*(1-params(1))*(-params(7))*y(16)*y(18)*params(4)*(-(y(18)*T(24)*T(25)*T(26)*T(28)))/(T(29)*T(29))-T(25)*T(32)*T(28)*T(33))/(T(35)*T(35))));
g1(11,18)=T(24)*(1-params(7))*(1-params(1))*T(22)-T(25)*T(24)*(T(30)+y(18)*(1-params(1))*(-params(7))*y(16)*(params(4)*(y(18)*T(24)*T(25)/T(29)-1)+y(18)*params(4)*T(24)*T(25)/T(29)))/T(35);
g1(11,20)=(-1);
g1(12,15)=y(18)*getPowerDeriv(y(15),1-params(1),1)-y(20);
g1(12,18)=T(36);
g1(12,20)=(-y(15));
g1(12,21)=(-1);
g1(13,21)=(-1);
g1(13,25)=params(10);
g1(13,26)=1-params(10);
g1(14,21)=(-1);
g1(14,25)=1;
g1(15,10)=(-(1-params(10)));
g1(15,11)=(-params(10));
g1(15,12)=(-1);
g1(15,16)=1;
g1(16,7)=(-(1-params(10)));
g1(16,8)=(-params(10));
g1(16,9)=(-1);
g1(16,17)=1;
g1(17,13)=1-params(10);
g1(17,14)=params(10);
g1(17,15)=(-1);
g1(18,22)=params(10);
g1(18,23)=1;
g1(19,3)=params(8);
g1(19,17)=(-1);
g1(19,32)=(-1);
g1(20,4)=(-1);
g1(20,18)=1;

end
