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
    T = peg2.static_resid_tt(T, y, x, params);
end
residual = zeros(13, 1);
lhs = y(1);
rhs = y(12)-y(13);
residual(1) = lhs - rhs;
lhs = y(4);
rhs = y(1)*params(7)+y(4)*params(2)+y(8);
residual(2) = lhs - rhs;
lhs = y(3);
rhs = y(4);
residual(3) = lhs - rhs;
lhs = y(1);
rhs = y(1)-(y(5)-y(4)-y(7));
residual(4) = lhs - rhs;
lhs = y(1);
rhs = y(2)+y(9);
residual(5) = lhs - rhs;
lhs = y(5);
rhs = y(6);
residual(6) = lhs - rhs;
lhs = y(2);
rhs = y(2)-y(4);
residual(7) = lhs - rhs;
residual(8) = y(10);
residual(9) = y(11);
lhs = y(7);
rhs = y(7)*0.9+x(1);
residual(10) = lhs - rhs;
lhs = y(8);
rhs = y(8)*0.9+x(2);
residual(11) = lhs - rhs;
lhs = y(9);
rhs = y(9)*0.9+x(3);
residual(12) = lhs - rhs;
lhs = y(6);
rhs = y(6)*0.9+x(4);
residual(13) = lhs - rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
end
