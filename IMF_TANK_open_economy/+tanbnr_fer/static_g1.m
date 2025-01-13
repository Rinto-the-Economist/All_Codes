function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = tanbnr_fer.static_g1_tt(T, y, x, params);
end
g1 = zeros(19, 19);
g1(1,1)=T(23);
g1(1,4)=(-(params(6)*getPowerDeriv(y(4),T(1),1)/y(12)));
g1(1,12)=(-((-T(3))/(y(12)*y(12))));
g1(2,2)=(1-params(6))*T(24);
g1(2,5)=(-(params(6)*getPowerDeriv(y(5),T(1),1)/y(12)));
g1(2,12)=(-((-T(5))/(y(12)*y(12))));
g1(3,3)=(1-params(6))*T(26);
g1(3,6)=(-(params(6)*getPowerDeriv(y(6),T(1),1)/y(12)));
g1(3,12)=(-((-T(7))/(y(12)*y(12))));
g1(4,2)=(T(9)*T(24)-T(4)*T(25))/(T(9)*T(9))-(T(9)*params(2)*y(17)*T(24)-T(4)*params(2)*y(17)*T(25))/(T(9)*T(9));
g1(4,5)=(-(T(4)*T(28)))/(T(9)*T(9))-(-(T(4)*params(2)*y(17)*T(28)))/(T(9)*T(9));
g1(4,17)=(-(T(4)*params(2)/T(9)));
g1(5,3)=(T(10)*T(26)-T(6)*T(27))/(T(10)*T(10))-(T(10)*params(2)*y(17)*T(26)-T(6)*params(2)*y(17)*T(27))/(T(10)*T(10));
g1(5,6)=(-(T(6)*T(29)))/(T(10)*T(10))-(-(T(6)*params(2)*y(17)*T(29)))/(T(10)*T(10));
g1(5,17)=(-(T(6)*params(2)/T(10)));
g1(6,1)=(-((1-y(7))*y(13)*(T(11)*T(23)-T(2)*(1-params(6))*getPowerDeriv(y(1),T(8),1))/(T(11)*T(11))));
g1(6,4)=(-((1-y(7))*y(13)*(-(T(2)*params(6)*getPowerDeriv(y(4),T(8),1)))/(T(11)*T(11))));
g1(6,7)=T(2)/T(11)*y(13);
g1(6,13)=(-(T(2)/T(11)*(1-y(7))));
g1(7,2)=(-((1-y(8))*y(13)*(T(9)*(1-params(6))*T(24)-(1-params(6))*T(4)*T(25))/(T(9)*T(9))));
g1(7,5)=(-((1-y(8))*y(13)*(-((1-params(6))*T(4)*T(28)))/(T(9)*T(9))));
g1(7,8)=y(13)*(1-params(6))*T(4)/T(9);
g1(7,13)=(-((1-params(6))*T(4)/T(9)*(1-y(8))));
g1(8,1)=1;
g1(8,4)=y(12);
g1(8,7)=(-y(13));
g1(8,12)=y(4);
g1(8,13)=(-y(7));
g1(8,19)=(-1);
g1(9,2)=1;
g1(9,5)=y(12);
g1(9,8)=(-y(13));
g1(9,12)=y(5);
g1(9,13)=(-y(8));
g1(9,15)=(-(1-1/y(17)));
g1(9,17)=(-y(15))/(y(17)*y(17));
g1(9,18)=(-1);
g1(10,3)=1;
g1(10,6)=y(12);
g1(10,11)=(-1);
g1(10,12)=y(6);
g1(10,16)=(-(1-1/y(17)));
g1(10,17)=(-y(16))/(y(17)*y(17));
g1(11,9)=T(14)*y(12)*(1-params(7))*(1-params(1))*getPowerDeriv(y(9),(1-params(7))*(1-params(1))-1,1)-(T(21)*(T(18)*T(30)+T(15)*T(14)*y(12)*(1-params(1))*(-params(7))*y(10)*y(12)*params(4)*(T(14)*y(12)*T(15)*y(12)*T(14)*T(30)-T(15)*y(12)*T(14)*T(14)*y(12)*T(30))/(T(14)*y(12)*T(15)*T(14)*y(12)*T(15)))-T(15)*T(18)*T(14)*y(12)*getPowerDeriv(y(9),1+params(7)*(1-params(1)),1))/(T(21)*T(21));
g1(11,10)=T(13)*T(31)-(T(21)*T(15)*(T(17)*T(31)+T(14)*y(12)*(1-params(1))*(-params(7))*(y(12)*params(4)*(T(15)*y(12)*T(14)/(T(14)*y(12)*T(15))-1)+y(10)*y(12)*params(4)*(T(14)*y(12)*T(15)*T(15)*y(12)*T(31)-T(15)*y(12)*T(14)*y(12)*T(15)*T(31))/(T(14)*y(12)*T(15)*T(14)*y(12)*T(15))))-T(15)*T(18)*T(20)*T(31))/(T(21)*T(21));
g1(11,12)=T(14)*(1-params(7))*(1-params(1))*T(12)-(T(21)*T(15)*T(14)*(T(16)+y(12)*(1-params(1))*(-params(7))*y(10)*(params(4)*(T(15)*y(12)*T(14)/(T(14)*y(12)*T(15))-1)+y(12)*params(4)*(T(14)*y(12)*T(15)*T(14)*T(15)-T(15)*y(12)*T(14)*T(14)*T(15))/(T(14)*y(12)*T(15)*T(14)*y(12)*T(15))))-T(15)*T(18)*T(14)*T(19))/(T(21)*T(21));
g1(11,13)=(-1);
g1(12,9)=y(12)*getPowerDeriv(y(9),1-params(1),1)-y(13);
g1(12,12)=T(22);
g1(12,13)=(-y(9));
g1(12,14)=(-1);
g1(13,14)=(-1);
g1(13,18)=params(10);
g1(13,19)=1-params(10);
g1(14,14)=(-1);
g1(14,18)=1;
g1(15,4)=(-(1-params(10)));
g1(15,5)=(-params(10));
g1(15,6)=(-1);
g1(15,10)=1;
g1(16,1)=(-(1-params(10)));
g1(16,2)=(-params(10));
g1(16,3)=(-1);
g1(16,11)=1;
g1(17,7)=1-params(10);
g1(17,8)=params(10);
g1(17,9)=(-1);
g1(18,15)=params(10);
g1(18,16)=1;
g1(19,11)=params(8)-1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
