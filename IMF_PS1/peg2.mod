%----------------------------------------------------------------
% Close all graphic windows
%----------------------------------------------------------------

close all;

% ----------------------------------------------------------------
% Declaring variables
% ----------------------------------------------------------------

var x tau pi pih i istar r u z delta_e pistar y yn;

varexo err_r err_u err_z err_istar;

parameters alpha beta epsilon theta phi lambda kappa ro;

alpha = 0.4;
beta = 0.99;
epsilon = 6;
theta = 0.75;
phi = 3;
lamba = ((1 - theta) * (1 - beta * theta)) / theta;
kappa = lamba * (1 + phi);
ro = 0.9;

% ------------------------------------------------------------------
%  MODEL 
% ------------------------------------------------------------------

model;

    x = y - yn;                                                               
    pih = kappa * x + beta * pih(+1) + u;
    pi = pih + alpha * (tau - tau(-1));
    x = x(+1) - (i - pih(+1) - r);
    x = z + tau;
    i = istar;
    tau = tau(-1) - pih + pistar;
    
    delta_e = 0;
    pistar = 0;

    r = 0.9 * r(-1) + err_r;
    u = 0.9 * u(-1) + err_u;
    z = 0.9 * z(-1) + err_z;
    istar = 0.9 * istar(-1) + err_istar;

end;

initval;
    x = 0;
    tau = 0;
    pi = 0;
    pih = 0;
    i = 0;
    istar = 0;
    delta_e = 0;
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
 
stoch_simul(order = 1, irf=100, irf_plot_threshold = 0) pih, x, pi, tau, i, delta_e;
  
