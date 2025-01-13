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
    T = ranbfp_test.static_g1_tt(T, y, x, params);
end
g1 = zeros(13, 13);
g1(1,1)=(1-params(5))*T(16);
g1(1,3)=(-(params(5)*getPowerDeriv(y(3),T(1),1)/y(8)));
g1(1,8)=(-((-T(3))/(y(8)*y(8))));
g1(2,2)=(1-params(5))*T(19);
g1(2,4)=(-(params(5)*getPowerDeriv(y(4),T(1),1)/y(8)));
g1(2,8)=(-((-T(5))/(y(8)*y(8))));
g1(3,1)=(T(9)*T(16)-T(2)*T(18))/(T(9)*T(9))-(T(9)*params(2)*y(13)*T(16)-T(2)*params(2)*y(13)*T(18))/(T(9)*T(9));
g1(3,3)=(-(T(2)*T(22)))/(T(9)*T(9))-(-(T(2)*params(2)*y(13)*T(22)))/(T(9)*T(9));
g1(3,13)=(-(T(2)*params(2)/T(9)));
g1(4,2)=(T(11)*T(19)-T(4)*T(21))/(T(11)*T(11))-(T(11)*params(2)*y(13)*T(19)-T(4)*params(2)*y(13)*T(21))/(T(11)*T(11));
g1(4,4)=(-(T(4)*T(23)))/(T(11)*T(11))-(-(T(4)*params(2)*y(13)*T(23)))/(T(11)*T(11));
g1(4,13)=(-(T(4)*params(2)/T(11)));
g1(5,1)=(-((1-y(5))*y(9)*(T(9)*(1-params(5))*T(16)-(1-params(5))*T(2)*T(18))/(T(9)*T(9))));
g1(5,3)=(-((1-y(5))*y(9)*(-((1-params(5))*T(2)*T(22)))/(T(9)*T(9))));
g1(5,5)=(1-params(5))*T(2)/T(9)*y(9);
g1(5,9)=(-((1-params(5))*T(2)/T(9)*(1-y(5))));
g1(6,1)=1;
g1(6,3)=y(8);
g1(6,5)=(-y(9));
g1(6,8)=y(3);
g1(6,9)=(-y(5));
g1(6,10)=(-1);
g1(6,11)=(-(1-1/y(13)));
g1(6,13)=(-y(11))/(y(13)*y(13));
g1(7,2)=1;
g1(7,4)=y(8);
g1(7,7)=(-1);
g1(7,8)=y(4);
g1(7,12)=(-(1-1/y(13)));
g1(7,13)=(-y(12))/(y(13)*y(13));
g1(8,5)=T(14)*y(8)*(1-params(6))*(1-params(1))*getPowerDeriv(y(5),(1-params(6))*(1-params(1))-1,1);
g1(8,6)=T(13)*getPowerDeriv(y(6),params(6),1);
g1(8,8)=T(14)*(1-params(6))*(1-params(1))*T(12);
g1(8,9)=(-1);
g1(9,5)=y(8)*getPowerDeriv(y(5),1-params(1),1)-y(9);
g1(9,8)=T(15);
g1(9,9)=(-y(5));
g1(9,10)=(-1);
g1(10,3)=(-1);
g1(10,4)=(-1);
g1(10,6)=1;
g1(11,1)=(-1);
g1(11,2)=(-1);
g1(11,7)=1;
g1(12,11)=1;
g1(12,12)=1;
g1(13,7)=params(7)-1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
