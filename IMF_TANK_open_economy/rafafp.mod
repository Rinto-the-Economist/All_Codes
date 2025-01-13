
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

load parameters;

set_param_value('alpha'   ,par.alpha);
set_param_value('psi'     ,par.psi); 
set_param_value('eta'     ,par.eta);
set_param_value('s_t'     ,par.s_t);
set_param_value('theta'   ,par.theta);
set_param_value('rho'     ,par.rho); 
set_param_value('gamma'   ,par.gamma);


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
                      (1 - s_t) * c_ao^(1 - 1 / eta)) *
                                w * (1 - l);

% HH's budget constraint in country a
p_t * c_at + c_ao - w * l - pi;

% HH's budget constraint in country b
c_bo + p_t * c_bt  - y_o;

% firm's FOC
(1 - theta) * (1 - alpha) * p_t * 
          l^((1 - theta) * (1 - alpha) - 1) * y_t^theta - w;
          
% firm's profit
p_t * l^(1 - alpha) - w * l - pi;
          
% tradeable goods market-clearing condition
y_t - c_at - c_bt;

% oil market-clearing condition
y_o - c_ao - c_bo;

% oil endowment, stochastic process
gamma + rho * y_o(-1) - err_yo - y_o;

end;


%----------------------------------------------------------------
% 4. Steady state
%----------------------------------------------------------------


initval;

l = .22; 
c_ao = .46;
y_t = l^(1 - alpha); 
p_t = 16.75 / y_t;
c_at = s_t^eta * c_ao / (p_t^eta * (1 - s_t)^eta);
c_bt = y_t - c_at;
y_o = gamma / (1 - rho);
c_bo = y_o - c_ao;
w = (1 - theta) * (1 - alpha) * p_t * 
          l^((1 - theta) * (1 - alpha) - 1) * y_t^theta;
pi = p_t * l^(1 - alpha) - w * l;

end;

steady(maxit = 1000, solve_algo = 1); 


%----------------------------------------------------------------
% 5. Impulse response function
%----------------------------------------------------------------


shocks;

var err_yo;
stderr .1;

end;


stoch_simul(order=1, irf=100, irf_plot_threshold=0) c_ao 
                               c_bo c_at c_bt l y_t y_o p_t w pi;






