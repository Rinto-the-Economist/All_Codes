
%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------

close all;

%----------------------------------------------------------------
% 1. Defining variables
%----------------------------------------------------------------

var x z i istar r delta_e pi pih tau u;

varexo err_u err_r err_z err_istar;

parameters alpha beta epsilon theta kappa lambda phi rho;

%----------------------------------------------------------------
% 2. Calibration
%----------------------------------------------------------------

alpha = .4;
beta = .99;
epsilon = 6;
theta = .75;
phi = 3;
rho = .9;
lambda = (1 - theta) * (1 - beta * theta) / theta;
kappa = lambda * (1 + phi);


%----------------------------------------------------------------
% 3. Model
%----------------------------------------------------------------

model;

  pih = kappa * x + beta * pih(+1) + u; % AS function
  x = -(i - pih(+1) - r) + x(+1); % AD function
  pi = pih + alpha * (tau - tau(-1)); % domestic inflation & term of trade
  x = z + tau; % domestic output gap
  i(-1) = istar(-1) + delta_e; % uncovered interest rate parity
  pih = - (x - x(-1)) / epsilon; % optimal policy rule
  
  istar = rho *  istar(-1) + err_istar; % shocks, AR(1)
  r = rho * r(-1) + err_r;
  u = rho * u(-1) + err_u;
  z = rho * z(-1) + err_z;
  
end;


initval;

  x = 0;
  pi = 0;
  pih = 0;
  tau = 0;
  i = 0;
  delta_e = 0;
  
  istar = 0;
  r = 0;
  u = 0;
  z = 0;
  
  
end;


shocks;

  var err_u;
  stderr 1;
  var err_r;
  stderr 1;
  var err_z;
  stderr 1;
  var err_istar;
  stderr 1;
  
  end;

1;


stoch_simul(order=1, irf=100, irf_plot_threshold=0) x pih pi tau i delta_e;


%----------------------------------------------------------------
% 4. Save the Results
%----------------------------------------------------------------

optimal_results = oo_;
save optimal_results;

