
%----------------------------------------------------------------
%
% Title: International Macro-Finance Final Assignment, model file
% Author: ---
% Date: 25/12/2023
% Description: Representative agent, financial autarky, flexible prices
%
%----------------------------------------------------------------


%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------

close all;

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var c_ao c_bo c_at c_bt l y_t y_o p_t w pi;

varexo err_yo;


%----------------------------------------------------------------
% 2. Calibration
%----------------------------------------------------------------

parameters alpha psi eta s_t theta rho gamma;

alpha = .3; % income share of capital 
psi = 3; % elasticity of labour supply, normally between 1 and 2 (see Blundell et al. 2000) 
eta = 1.5; % elasticity of substitution between the tradeable good and oil
s_t = .9; % share of tradeable in the consumption basket
theta = .5; % elasticity of substitution between goods in the tradeable sector
rho = .9; % persistence of shock
gamma = .5; % mean oil endowment of country b (y_bbar = gamma / (1 - rho))



%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------


model;

% consumption allocation between oil and tradeable in country a
(1 - s_t) * c_ao^(-1 / eta) - s_t * c_at^(-1 / eta) / p_t;

% consumption allocation between oil and tradeable in country b
(1 - s_t) * c_bo^(-1 / eta) - s_t * c_bt^(-1 / eta) / p_t;

% HH's labour supply decision in country a
psi - (1 - s_t) * c_ao^(-1 / eta) / (s_t * c_at^(1 - 1 / eta) + 
                      (1 - s_t) * c_ao^(1 - 1 / eta))^(eta / (eta - 1)) 
                                * w * (1 - l);

% HH's budget constraint in country a
p_t * c_at + c_ao - w * l - pi;

% HH's budget constraint in country b
c_bo + p_t * c_bt  - y_o;

% firm's FOC
(1 - theta) * (1 - alpha) * p_t * 
          l^((1 - theta) * (1 - alpha) - 1) * y_t^theta - w;
          
% firm's profit
p_t * y_t - w * l - pi;
          
% tradeable goods market-clearing condition
y_t - c_at - c_bt;

% oil market-clearing condition
y_o - c_ao - c_bo;

% oil endowment, stochastic process
gamma + rho * y_o(-1) + err_yo - y_o;

end;


%----------------------------------------------------------------
% 4. Steady state
%----------------------------------------------------------------


initval;

y_t = 16.75; % EU GDP in tn USD
c_at = 10;
c_bt = y_t - c_at;
y_o = gamma / (1 - rho);
c_ao = 1;
c_bo = y_o - c_ao;
l = .22; % average work hours in the EU (37.5 / (24 * 7))
p_t = s_t * c_at^(-1 / eta) / ((1 - s_t) * c_ao^(-1 / eta));
w = (1 - theta) * (1 - alpha) * p_t * 
          l^((1 - theta) * (1 - alpha) - 1) * y_t^theta;
pi = p_t * y_t - w * l;


end;

steady(maxit = 1000); 








