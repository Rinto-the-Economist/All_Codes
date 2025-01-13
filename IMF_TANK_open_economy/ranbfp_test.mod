
%----------------------------------------------------------------
%
% Title: International Macro-Finance Final Assignment, model file
% Author: ---
% Date: 25/12/2023
% Description: Representative agent, nominal bond, flexible prices
%
%----------------------------------------------------------------


%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------

close all;

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var c_ao c_bo c_at c_bt l y_t y_o p_t w pi n_a n_b r_star;

varexo err_yo;


%----------------------------------------------------------------
% 2. Calibration
%----------------------------------------------------------------

parameters alpha beta psi eta s_t theta rho gamma;

%alpha = .3; % income share of capital 
%beta = .99;
%psi = 2; % elasticity of labour supply, normally between 1 and 2 (see Blundell et al. 2000) 
%eta = .6; % elasticity of substitution between the tradeable good and oil
%s_t = .90; % share of tradeable in the consumption basket
%theta = .85; % elasticity of substitution between goods in the tradeable sector
%rho = .9; % persistence of shock
%gamma = .5; % mean oil endowment of country b (y_bbar = gamma / (1 - rho))

alpha = .3; % income share of capital 
beta = .99;
psi = 2; % elasticity of labour supply, normally between 1 and 2 (see Blundell et al. 2000) 
eta = .6; % elasticity of substitution between the tradeable good and oil
s_t = .90; % weight of tradeable in the consumption basket
theta = .85; % elasticity of substitution between goods in the tradeable sector
rho = .9; % persistence of shock
gamma = .06; % mean oil endowment of country b (y_bbar = gamma / (1 - rho))



%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------


model;

% consumption allocation between oil and tradeable in country a
(1 - s_t) * c_ao^(-1 / eta) - s_t * c_at^(-1 / eta) / p_t;

% consumption allocation between oil and tradeable in country b
(1 - s_t) * c_bo^(-1 / eta) - s_t * c_bt^(-1 / eta) / p_t;

% Euler equation in country a
c_ao(-1)^(-1 / eta) / (s_t * c_at(-1)^(1 - 1 / eta) + 
     (1 - s_t) * c_ao(-1)^(1 - 1 / eta))^(eta / (eta - 1)) 
         - beta * r_star(-1) *
                 c_ao^(-1 / eta) / (s_t * c_at^(1 - 1 / eta) + 
                           (1 - s_t) * c_ao^(1 - 1 / eta))^(eta / (eta - 1));
                                
% Euler equation in country b
c_bo(-1)^(-1 / eta) / (s_t * c_bt(-1)^(1 - 1 / eta) + 
     (1 - s_t) * c_bo(-1)^(1 - 1 / eta))^(eta / (eta - 1)) - 
         beta * r_star(-1) *
                 c_bo^(-1 / eta) / (s_t * c_bt^(1 - 1 / eta) + 
                           (1 - s_t) * c_bo^(1 - 1 / eta))^(eta / (eta - 1));

% HH's labour supply decision in country a
psi - (1 - s_t) * c_ao^(-1 / eta) / (s_t * c_at^(1 - 1 / eta) + 
                      (1 - s_t) * c_ao^(1 - 1 / eta))^(eta / (eta - 1)) *
                                w * (1 - l);

% HH's budget constraint in country a
p_t * c_at + c_ao - w * l - pi - (n_a(-1) - n_a / r_star);

% HH's budget constraint in country b
c_bo + p_t * c_bt  - y_o - (n_b(-1) - n_b / r_star);

% firm's FOC
(1 - theta) * (1 - alpha) * p_t * 
          l^((1 - theta) * (1 - alpha) - 1) * y_t^theta - w;
          
% firm's profit
p_t * l^(1 - alpha) - w * l - pi;
          
% tradeable goods market-clearing condition
y_t - c_at - c_bt;

% oil market-clearing condition
y_o - c_ao - c_bo;

% bond market clearing condition
n_a + n_b;

% oil endowment, stochastic process
gamma + rho * y_o(-1) - err_yo - y_o;

end;


%----------------------------------------------------------------
% 4. Steady state
%----------------------------------------------------------------


initval;

l = .22; 
c_ao = .46;
y_t = l^(1 - alpha); % from production function
p_t = 16.75 / y_t; % from target GDP in country a
c_at = s_t^eta * c_ao / (p_t^eta * (1 - s_t)^eta); % from tradeable-oil tradeoff
c_bt = y_t - c_at; % from tradeable MC
y_o = gamma / (1 - rho); % from oil stochastic process
c_bo = y_o - c_ao; % from oil MC
w = (1 - theta) * (1 - alpha) * p_t * 
          l^((1 - theta) * (1 - alpha) - 1) * y_t^theta; % from firm's FOC
pi = p_t * l^(1 - alpha) - w * l; % from firm's profit
r_star = 1 / beta; % from SS Euler
n_a = r_star / (r_star - 1) * (p_t * c_at + c_ao - w * l - pi); % from the BC
n_b = - n_a; % from bond MC

end;

steady(maxit = 1000); 


%----------------------------------------------------------------
% 5. Impulse response function
%----------------------------------------------------------------


shocks;

var err_yo;
stderr 1;

end;


stoch_simul(order=1, irf=100, irf_plot_threshold=0) c_ao 
                               c_bo c_at c_bt l y_t y_o p_t w pi;




