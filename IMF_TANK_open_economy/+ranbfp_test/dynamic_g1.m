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
    T = ranbfp_test.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(13, 22);
g1(1,9)=(1-params(5))*T(23);
g1(1,11)=(-(params(5)*getPowerDeriv(y(11),T(1),1)/y(16)));
g1(1,16)=(-((-T(3))/(y(16)*y(16))));
g1(2,10)=(1-params(5))*T(27);
g1(2,12)=(-(params(5)*getPowerDeriv(y(12),T(1),1)/y(16)));
g1(2,16)=(-((-T(5))/(y(16)*y(16))));
g1(3,1)=(T(10)*getPowerDeriv(y(1),T(1),1)-T(6)*(1-params(5))*getPowerDeriv(y(1),T(7),1)*T(22))/(T(10)*T(10));
g1(3,9)=(-((T(12)*params(2)*y(8)*T(23)-T(2)*params(2)*y(8)*T(25))/(T(12)*T(12))));
g1(3,3)=(-(T(6)*T(22)*params(5)*getPowerDeriv(y(3),T(7),1)))/(T(10)*T(10));
g1(3,11)=(-((-(T(2)*params(2)*y(8)*T(29)))/(T(12)*T(12))));
g1(3,8)=(-(T(2)*params(2)/T(12)));
g1(4,2)=(T(15)*getPowerDeriv(y(2),T(1),1)-T(13)*(1-params(5))*getPowerDeriv(y(2),T(7),1)*T(26))/(T(15)*T(15));
g1(4,10)=(-((T(17)*params(2)*y(8)*T(27)-T(4)*params(2)*y(8)*(1-params(5))*getPowerDeriv(y(10),T(7),1)*T(28))/(T(17)*T(17))));
g1(4,4)=(-(T(13)*T(26)*params(5)*getPowerDeriv(y(4),T(7),1)))/(T(15)*T(15));
g1(4,12)=(-((-(T(4)*params(2)*y(8)*T(28)*params(5)*getPowerDeriv(y(12),T(7),1)))/(T(17)*T(17))));
g1(4,8)=(-(T(4)*params(2)/T(17)));
g1(5,9)=(-((1-y(13))*y(17)*(T(12)*(1-params(5))*T(23)-(1-params(5))*T(2)*T(25))/(T(12)*T(12))));
g1(5,11)=(-((1-y(13))*y(17)*(-((1-params(5))*T(2)*T(29)))/(T(12)*T(12))));
g1(5,13)=(1-params(5))*T(2)/T(12)*y(17);
g1(5,17)=(-((1-params(5))*T(2)/T(12)*(1-y(13))));
g1(6,9)=1;
g1(6,11)=y(16);
g1(6,13)=(-y(17));
g1(6,16)=y(11);
g1(6,17)=(-y(13));
g1(6,18)=(-1);
g1(6,6)=(-1);
g1(6,19)=1/y(21);
g1(6,21)=(-y(19))/(y(21)*y(21));
g1(7,10)=1;
g1(7,12)=y(16);
g1(7,15)=(-1);
g1(7,16)=y(12);
g1(7,7)=(-1);
g1(7,20)=1/y(21);
g1(7,21)=(-y(20))/(y(21)*y(21));
g1(8,13)=T(20)*y(16)*(1-params(6))*(1-params(1))*getPowerDeriv(y(13),(1-params(6))*(1-params(1))-1,1);
g1(8,14)=T(19)*getPowerDeriv(y(14),params(6),1);
g1(8,16)=T(20)*(1-params(6))*(1-params(1))*T(18);
g1(8,17)=(-1);
g1(9,13)=y(16)*getPowerDeriv(y(13),1-params(1),1)-y(17);
g1(9,16)=T(21);
g1(9,17)=(-y(13));
g1(9,18)=(-1);
g1(10,11)=(-1);
g1(10,12)=(-1);
g1(10,14)=1;
g1(11,9)=(-1);
g1(11,10)=(-1);
g1(11,15)=1;
g1(12,19)=1;
g1(12,20)=1;
g1(13,5)=params(7);
g1(13,15)=(-1);
g1(13,22)=(-1);

end
