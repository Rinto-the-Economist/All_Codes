function residual = static_resid(T, y, x, params, T_flag)
% function residual = static_resid(T, y, x, params, T_flag)
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
%   residual
%

if T_flag
    T = tanbfp.static_resid_tt(T, y, x, params);
end
residual = zeros(19, 1);
residual(1) = T(2)-T(3)/y(12);
residual(2) = (1-params(5))*T(4)-T(5)/y(12);
residual(3) = (1-params(5))*T(6)-T(7)/y(12);
residual(4) = T(4)/T(9)-T(4)*params(2)*y(17)/T(9);
residual(5) = T(6)/T(10)-T(6)*params(2)*y(17)/T(10);
residual(6) = params(3)-T(2)/T(11)*y(13)*(1-y(7));
residual(7) = params(3)-y(13)*(1-params(5))*T(4)/T(9)*(1-y(8));
residual(8) = y(1)+y(4)*y(12)-y(13)*y(7)-y(19);
residual(9) = y(2)+y(12)*y(5)-y(13)*y(8)-y(18)-(y(15)-y(15)/y(17));
residual(10) = y(3)+y(12)*y(6)-y(11)-(y(16)-y(16)/y(17));
residual(11) = T(13)*T(14)-y(13);
residual(12) = y(12)*T(15)-y(13)*y(9)-y(14);
residual(13) = y(18)*params(9)+y(19)*(1-params(9))-y(14);
residual(14) = y(18)-y(14);
residual(15) = y(10)-y(4)*(1-params(9))-y(5)*params(9)-y(6);
residual(16) = y(11)-y(1)*(1-params(9))-y(2)*params(9)-y(3);
residual(17) = y(8)*params(9)+y(7)*(1-params(9))-y(9);
residual(18) = y(16)+y(15)*params(9);
residual(19) = params(8)+y(11)*params(7)-x(1)-y(11);
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
