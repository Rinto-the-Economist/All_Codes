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
    T = optimal.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(10, 23);
g1(1,8)=(-params(5));
g1(1,15)=1;
g1(1,19)=(-params(2));
g1(1,17)=(-1);
g1(2,8)=1;
g1(2,18)=(-1);
g1(2,10)=1;
g1(2,12)=(-1);
g1(2,19)=(-1);
g1(3,14)=1;
g1(3,15)=(-1);
g1(3,6)=params(1);
g1(3,16)=(-params(1));
g1(4,8)=1;
g1(4,9)=(-1);
g1(4,16)=(-1);
g1(5,3)=1;
g1(5,4)=(-1);
g1(5,13)=(-1);
g1(6,1)=(-(1/params(3)));
g1(6,8)=(-((-1)/params(3)));
g1(6,15)=1;
g1(7,4)=(-params(8));
g1(7,11)=1;
g1(7,23)=(-1);
g1(8,5)=(-params(8));
g1(8,12)=1;
g1(8,21)=(-1);
g1(9,7)=(-params(8));
g1(9,17)=1;
g1(9,20)=(-1);
g1(10,2)=(-params(8));
g1(10,9)=1;
g1(10,22)=(-1);

end
