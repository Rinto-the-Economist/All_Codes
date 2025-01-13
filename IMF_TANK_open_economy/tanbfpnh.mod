
%----------------------------------------------------------------
%
% Title: International Macro-Finance Final Assignment, model file
% Author: ---
% Date: 25/12/2023
% Description: Two agent, nominal bond, flexible prices, 
%                                        non-homothetic prefences
%
%----------------------------------------------------------------


%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------

close all;

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var c_aho c_aro c_bo c_aht c_art c_bt l_h l_r l y_t y_o p_t w pi 
          n_a n_b r_star pi_r pi_h;

varexo err_yo;


%----------------------------------------------------------------
% 2. Calibration
%----------------------------------------------------------------

parameters alpha beta psi eta s_art s_aht s_bt theta rho gamma chi;
load parameters;

set_param_value('alpha'   ,par.alpha);
set_param_value('beta'    ,par.beta);
set_param_value('psi'     ,par.psi); 
set_param_value('eta'     ,par.eta);
set_param_value('theta'   ,par.theta);
set_param_value('rho'     ,par.rho); 
set_param_value('gamma'   ,par.gamma);
set_param_value('chi'     ,par.chi);

chi = .7;
s_t = .8;
s_aht	= .75; % home bias towards tradeable for htms
s_art = (s_t - (1 - chi) * s_aht) / chi; %  home bias towards tradeable for ricardians
s_bt	= s_t; % home bias towards tradeable in country b
theta = .68;


%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------


model;

% consumption allocation between oil and tradeable for htm HHs in country a
(1 - s_aht) * c_aho^(-1 / eta) - s_aht * c_aht^(-1 / eta) / p_t;

% consumption allocation between oil and tradeable for ricardian HHs in country a
(1 - s_art) * c_aro^(-1 / eta) - s_art * c_art^(-1 / eta) / p_t;

% consumption allocation between oil and tradeable in country b
(1 - s_bt) * c_bo^(-1 / eta) - s_bt * c_bt^(-1 / eta) / p_t;

% Euler equation for ricardian HHs in country a
c_aro^(-1 / eta) / (s_art * c_art^(1 - 1 / eta) + 
     (1 - s_art) * c_aro^(1 - 1 / eta)) - 
           beta * r_star *
                 c_aro(+1)^(-1 / eta) / (s_art * c_art(+1)^(1 - 1 / eta) + 
                           (1 - s_art) * c_aro(+1)^(1 - 1 / eta));
                                
% Euler equation in country b
c_bo^(-1 / eta) / (s_bt * c_bt^(1 - 1 / eta) + 
     (1 - s_bt) * c_bo^(1 - 1 / eta)) - 
       beta * r_star *
                 c_bo(+1)^(-1 / eta) / (s_bt * c_bt(+1)^(1 - 1 / eta) + 
                           (1 - s_bt) * c_bo(+1)^(1 - 1 / eta));

% labour supply decision for htm HHs in country a
psi - (1 - s_aht) * c_aho^(-1 / eta) / (s_aht * c_aht^(1 - 1 / eta) + 
                      (1 - s_aht) * c_aho^(1 - 1 / eta)) * 
                                w * (1 - l_h);
                      
% labour supply decision for ricardian HHs in country a
psi - (1 - s_art) * c_aro^(-1 / eta) / (s_art * c_art^(1 - 1 / eta) + 
                      (1 - s_art) * c_aro^(1 - 1 / eta)) * 
                                w * (1 - l_r);

% htm's budget constraint in country a
p_t * c_aht + c_aho - w * l_h - pi_h;

% ricardian's budget constraint in country a
p_t * c_art + c_aro - w * l_r - pi_r - (n_a(-1) - n_a / r_star);

% HH's budget constraint in country b
c_bo + p_t * c_bt  - y_o - (n_b(-1) - n_b / r_star);

% firm's FOC
(1 - theta) * (1 - alpha) * p_t * 
          l^((1 - theta) * (1 - alpha) - 1) * y_t^theta - w;
          
% firm's profit
p_t * l^(1 - alpha) - w * l - pi;      

% profit distribution
chi * pi_r + (1 - chi) * pi_h - pi;

% impose profit for ricardians
pi_r - pi;      

% tradeable goods market-clearing condition
y_t - (1 - chi) * c_aht - chi * c_art - c_bt;

% oil market-clearing condition
y_o - (1 - chi) * c_aho - chi * c_aro - c_bo;

% labour market-clearing condition
chi * l_r + (1 - chi) * l_h - l;

% bond market clearing condition
chi * n_a + n_b;

% oil endowment, stochastic process
gamma + rho * y_o(-1) - err_yo - y_o;

end;


%----------------------------------------------------------------
% 4. Steady state
%----------------------------------------------------------------


initval;

l_r = .22; 
l_h = .22;
c_aro = .46;
c_aho = .46;
l = chi * l_r + (1 - chi) * l_h;
y_t = l^(1 - alpha); % from production function
p_t = 16.75 / y_t; % from target GDP in country a
c_art = s_art^eta * c_aro / (p_t^eta * (1 - s_art)^eta); % from tradeable-oil tradeoff
c_aht = s_aht^eta * c_aho / (p_t^eta * (1 - s_aht)^eta); 
c_bt = y_t - chi * c_art - (1 - chi) * c_aht; % from tradeable MC
y_o = gamma / (1 - rho); % from oil stochastic process
c_bo = y_o - chi * c_aro - (1 - chi) * c_aho; % from oil MC
w = (1 - theta) * (1 - alpha) * p_t * 
          l^((1 - theta) * (1 - alpha) - 1) * y_t^theta; % from firm's FOC
pi = p_t * l^(1 - alpha) - w * l; % from firm's profit
pi_r = pi;
pi_h = (pi - chi * pi_r) / (1 - chi);
r_star = 1 / beta; % from SS Euler
n_a = r_star / (r_star - 1) * (p_t * c_art + c_aro - w * l - pi_r); % from the BC
n_b = - n_a; % from bond MC

end;

steady(maxit = 1000, solve_algo = 3); 



%----------------------------------------------------------------
% 5. Impulse response function
%----------------------------------------------------------------


shocks;

var err_yo;
stderr .1;

end;


stoch_simul(order=1, irf=100, irf_plot_threshold=0) 
                      c_aho c_aro c_bo c_aht c_art c_bt l_h 
                             l_r l y_t y_o p_t w pi n_a n_b r_star;


model_diagnostics;



