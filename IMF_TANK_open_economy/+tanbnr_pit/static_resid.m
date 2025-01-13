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
    T = tanbnr_pit.static_resid_tt(T, y, x, params);
end
residual = zeros(20, 1);
residual(1) = T(2)/y(13)-T(3)/y(12);
residual(2) = (1-params(6))*T(4)/y(13)-T(5)/y(12);
residual(3) = (1-params(6))*T(6)-T(7)/T(8);
residual(4) = T(4)/T(11)-T(4)*params(2)*y(18)/T(11);
residual(5) = T(6)/T(12)-T(6)*params(2)*y(18)/T(12);
residual(6) = params(3)-T(2)/T(14)*y(14)*(1-y(7));
residual(7) = params(3)-y(14)*(1-params(6))*T(4)/T(11)*(1-y(8));
residual(8) = y(4)*y(12)+y(1)*y(13)-y(14)*y(7)-y(20);
residual(9) = y(12)*y(5)+y(13)*y(2)-y(14)*y(8)-y(19)-y(13)*(y(16)-y(16)/y(18));
residual(10) = y(3)+y(6)*T(8)-y(11)-(y(17)-y(17)/y(18));
residual(11) = T(16)*T(17)-y(14)-T(18)*T(21)/T(24);
residual(12) = y(12)*T(25)-y(14)*y(9)-y(15);
residual(13) = y(19)*params(10)+y(20)*(1-params(10))-y(15);
residual(14) = y(19)-y(15);
residual(15) = y(10)-y(4)*(1-params(10))-y(5)*params(10)-y(6);
residual(16) = y(11)-y(1)*(1-params(10))-y(2)*params(10)-y(3);
residual(17) = y(8)*params(10)+y(7)*(1-params(10))-y(9);
residual(18) = y(17)+y(16)*params(10);
residual(19) = params(9)+y(11)*params(8)-x(1)-y(11);
residual(20) = 0;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
