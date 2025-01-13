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
    T = rafafp.static_g1_tt(T, y, x, params);
end
g1 = zeros(10, 10);
g1(1,1)=T(11);
g1(1,3)=(-(params(4)*getPowerDeriv(y(3),T(1),1)/y(8)));
g1(1,8)=(-((-T(3))/(y(8)*y(8))));
g1(2,2)=(1-params(4))*getPowerDeriv(y(2),T(1),1);
g1(2,4)=(-(params(4)*getPowerDeriv(y(4),T(1),1)/y(8)));
g1(2,8)=(-((-T(4))/(y(8)*y(8))));
g1(3,1)=(-((1-y(5))*y(9)*(T(6)*T(11)-T(2)*(1-params(4))*getPowerDeriv(y(1),T(5),1))/(T(6)*T(6))));
g1(3,3)=(-((1-y(5))*y(9)*(-(T(2)*params(4)*getPowerDeriv(y(3),T(5),1)))/(T(6)*T(6))));
g1(3,5)=T(2)/T(6)*y(9);
g1(3,9)=(-(T(2)/T(6)*(1-y(5))));
g1(4,1)=1;
g1(4,3)=y(8);
g1(4,5)=(-y(9));
g1(4,8)=y(3);
g1(4,9)=(-y(5));
g1(4,10)=(-1);
g1(5,2)=1;
g1(5,4)=y(8);
g1(5,7)=(-1);
g1(5,8)=y(4);
g1(6,5)=T(9)*y(8)*(1-params(5))*(1-params(1))*getPowerDeriv(y(5),(1-params(5))*(1-params(1))-1,1);
g1(6,6)=T(8)*getPowerDeriv(y(6),params(5),1);
g1(6,8)=T(9)*(1-params(5))*(1-params(1))*T(7);
g1(6,9)=(-1);
g1(7,5)=y(8)*getPowerDeriv(y(5),1-params(1),1)-y(9);
g1(7,8)=T(10);
g1(7,9)=(-y(5));
g1(7,10)=(-1);
g1(8,3)=(-1);
g1(8,4)=(-1);
g1(8,6)=1;
g1(9,1)=(-1);
g1(9,2)=(-1);
g1(9,7)=1;
g1(10,7)=params(6)-1;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
