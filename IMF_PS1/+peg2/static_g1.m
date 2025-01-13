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
    T = peg2.static_g1_tt(T, y, x, params);
end
g1 = zeros(13, 13);
g1(1,1)=1;
g1(1,12)=(-1);
g1(1,13)=1;
g1(2,1)=(-params(7));
g1(2,4)=1-params(2);
g1(2,8)=(-1);
g1(3,3)=1;
g1(3,4)=(-1);
g1(4,4)=(-1);
g1(4,5)=1;
g1(4,7)=(-1);
g1(5,1)=1;
g1(5,2)=(-1);
g1(5,9)=(-1);
g1(6,5)=1;
g1(6,6)=(-1);
g1(7,4)=1;
g1(8,10)=1;
g1(9,11)=1;
g1(10,7)=0.09999999999999998;
g1(11,8)=0.09999999999999998;
g1(12,9)=0.09999999999999998;
g1(13,6)=0.09999999999999998;
if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
end
end
