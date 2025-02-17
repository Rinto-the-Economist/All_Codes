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
    T = citr.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(10, 22);
g1(1,7)=(-params(5));
g1(1,14)=1;
g1(1,18)=(-params(2));
g1(1,16)=(-1);
g1(2,7)=1;
g1(2,17)=(-1);
g1(2,9)=1;
g1(2,11)=(-1);
g1(2,18)=(-1);
g1(3,13)=1;
g1(3,14)=(-1);
g1(3,5)=params(1);
g1(3,15)=(-params(1));
g1(4,7)=1;
g1(4,8)=(-1);
g1(4,15)=(-1);
g1(5,2)=1;
g1(5,3)=(-1);
g1(5,12)=(-1);
g1(6,9)=1;
g1(6,13)=(-params(8));
g1(7,3)=(-params(9));
g1(7,10)=1;
g1(7,22)=(-1);
g1(8,4)=(-params(9));
g1(8,11)=1;
g1(8,20)=(-1);
g1(9,6)=(-params(9));
g1(9,16)=1;
g1(9,19)=(-1);
g1(10,1)=(-params(9));
g1(10,8)=1;
g1(10,21)=(-1);

end
