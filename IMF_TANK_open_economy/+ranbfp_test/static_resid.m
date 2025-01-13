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
    T = ranbfp_test.static_resid_tt(T, y, x, params);
end
residual = zeros(13, 1);
residual(1) = (1-params(5))*T(2)-T(3)/y(8);
residual(2) = (1-params(5))*T(4)-T(5)/y(8);
residual(3) = T(2)/T(9)-T(2)*params(2)*y(13)/T(9);
residual(4) = T(4)/T(11)-T(4)*params(2)*y(13)/T(11);
residual(5) = params(3)-(1-params(5))*T(2)/T(9)*y(9)*(1-y(5));
residual(6) = y(1)+y(3)*y(8)-y(9)*y(5)-y(10)-(y(11)-y(11)/y(13));
residual(7) = y(2)+y(8)*y(4)-y(7)-(y(12)-y(12)/y(13));
residual(8) = T(13)*T(14)-y(9);
residual(9) = y(8)*T(15)-y(9)*y(5)-y(10);
residual(10) = y(6)-y(3)-y(4);
residual(11) = y(7)-y(1)-y(2);
residual(12) = y(11)+y(12);
residual(13) = params(8)+y(7)*params(7)-x(1)-y(7);
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
