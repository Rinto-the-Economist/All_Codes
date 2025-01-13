 

%----------------------------------------------------------------
%
% Title: International Macro-Finance Problem Set 3, Q4 model file
% Author: ---
% Date: 10/12/2023
% Description: Open economy heterogeneous agent model
%
%----------------------------------------------------------------


%----------------------------------------------------------------
%% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------

close all;
clear all;

cd '/home/---/Desktop/International Macro/PS3';

%----------------------------------------------------------------
%% 1. Calibration & defining parameters 
%----------------------------------------------------------------


% preferences
par.beta = .99;
par.eta = 3; % standard Frisch elasticity of 3 according to macro literature (Chetty et al. 2011)
par.alphah = .5; % no home bias at home

% fiscal policy
par.tau = .3; % US govt revenue as a share of gdp, 2012-22 average
par.g = 6.61174; % adjust govt spending until I reach a debt to GDP ratio of 120% 


% rest of the world
par.y_star = 75; % world excld. US (RoW) GDP, 2022 in trillion USD (FRED)
par.b_star = 0; % foreign holding of home bonds
par.gamma = .119; % US export to RoW as share of US GDP, 2012-22 average (FRED)
par.omega = .047; % US import from RoW as a share of RoW GDP, 2012-22 average (FRED)

% others
par.kappa = 1;
b_ss = 138; % aggregate net worth in the US in 2022, trillion USD (FRED)
par.b_shareTop01 = .13; % share of net worth held by top .1% in 2022 (SCF)
par.b_shareBot01 = -.0007 * 5; % share of net worth held by bottom .1% in 2022 (SCF)


%----------------------------------------------------------------
%% 2. Defining the exogenous shock process
%----------------------------------------------------------------


% Exogeneous shock
% par.scale = 1;
% grid.s1 = [.5 1.5];  % value 
% grid.s1 = grid.s1 * par.scale ;
% Pr = [.8 .2; 
%       .2 .8]; % Markov chain
% ns = length(grid.s1); % number of states
% pi = ones(1, ns) / ns; 
% dis = 1; % initial distribution of HHs
% tol=1e-20;
% % compute invariant distribution for s             
% while dis>tol
%     pi_2 = pi * Pr; 
%     dis = max(abs(pi_2 - pi)); 
%     pi = pi_2;
% end

ns    = 10;        % Number of points for labour productivity process
par.rhos  = .995;       % Calibrate persistence of AR(1), from FRED time series
par.sigs  = sqrt(.6);       % Calibrate standard deviation of innovation
par.scale = 1e+5;         % scaling factor for GDP
[grid.s1, Pr] = rouwenhorst(ns, 0, par.rhos, par.sigs);
% grid.s1 = rescale(grid.s1', .5 * par.scale, 1.5 * par.scale);
grid.s1 = exp(grid.s1);  % labour productivity process (rule out negatives)

maxIter_pi = 1e+5;
Pr_ergo = Pr^maxIter_pi; % Ergodic distribution of exogenous labour productivity process
pi = Pr_ergo(1,:);    
grid.s1 = (grid.s1 / (pi * grid.s1) + par.scale)'; % Normalize mean to 1 (or to 100)



%----------------------------------------------------------------
%% 3. Setting up the grids
%----------------------------------------------------------------

% Asset grid:
b_con = -par.kappa * par.scale;
b_min = 30 * b_con; % ensures it is significantly below b_con
b_max = par.b_shareTop01 * b_ss * par.scale; % approximately the net worth of the top .1%
nb = 1000;
nb_fine = 1000;
grid.b = linspace(b_min, b_max, nb);
grid.b = [grid.b, b_con]';
grid.b = sort(grid.b);
Ind_b_min = find(grid.b == b_con);
nb = length(grid.b); % update grid point number to account for kappa
grid.b_fine = linspace(b_min, b_max, nb_fine);


% Build some usefull matrices
bg = ones(nb, ns);
grid.b2 = repmat(grid.b, [1 ns]); % nb x ns matrix
grid.s2 = repmat(grid.s1, [nb 1]); % nb x 2 matrix
      

%----------------------------------------------------------------
%% 4. Guesses & policy functions
%----------------------------------------------------------------

% consumption
guess.ci = ones(nb,ns);

% terms of trade
guess.ph_pf = 2;

% interest rate
guess.r0 = 1 / par.beta;
          
% consumption
cf = par.omega * par.y_star; % home consumption of foreign goods (i.e. US import from RoW)

% distribution
G0 = ones(nb_fine, ns) / (nb_fine * ns);

% policy functions
policy.ci = ones(nb_fine, ns);
policy.bi = ones(nb_fine,ns);

% convergence parameters
maxIter_c = 1e+3;
maxIter_r = 1e+3;
maxIter_tot= 1e+3;
lambda =.5;
errtol_c = 1e-5;
errtol_r = 1e-2;
errtol_tot = 1e-5;


%----------------------------------------------------------------
%% 5. Iterations
%----------------------------------------------------------------
 
iter_tot = 1;
err_tot = 1;
 
while err_tot > errtol_tot && iter_tot <= maxIter_tot
  
  w_p0 = par.alphah^par.alphah * (1 - par.alphah)^(1 - par.alphah) * ...
            guess.ph_pf^(1 - par.alphah); % update real wage from the tot

  %% Compute labour supply
  policy.li = ((1 - par.tau) .* w_p0 .* grid.s1).^(1 / par.eta);  
  l0 = pi * policy.li.';

  iter_r = 1;
  err_r = 1;
  %%
  
  while err_r > errtol_r && iter_r <= maxIter_r
    
    %% Solve for consumption
    y = l0;
    
    % Compute constrained consumption given R
    c_constrained = (1 - par.tau) .* guess.ph_pf .* grid.s2 .* policy.li + ...
                    w_p0 .* grid.b2 .* guess.r0 - ...
                    w_p0 .* b_con;
    c_constrained = max(c_constrained, 1e-5); % rule out consumption below 0
    
    iter_c = 1;
    err_c = 1; 

    guess.ci = ones(nb,ns);
    %%
   
    while err_c > errtol_c && iter_c <= maxIter_c
        %%
   
      % expected marginal utility at t+2
      Emup1 = (guess.ci * par.scale - policy.li.^(1 + par.eta) / (1 + par.eta)).^(-1); 
      % expected marginal utility at t+1 (scale up consumption)
      Mup = par.beta * guess.r0 * Emup1 * Pr'; 
      % expected consumption at t+1
      Ec = Mup.^(-1) + policy.li.^(1 + par.eta) / (1 + par.eta); 
      % state debt tomorrow (i.e. choice debt today)
      bi_state = (Ec ./ w_p0 + grid.b2 - (1 - par.tau) .* grid.s2 .* ...
                         policy.li) ./ (guess.r0); 
      
      c_new = ones(nb, ns);

      for j=1:ns
          
          c_new(:,j) =  (grid.b > bi_state(Ind_b_min, j)) .* ... % indicator function on whether borrowing constraint is binding
                        interp1(bi_state(:, j), Ec(:, j), grid.b, 'pchip') + ... % interpolate c_s = f(bi_state) at each grid point
                        (grid.b <= bi_state(Ind_b_min, j)) .* c_constrained(:,j); % if constraint is binding, then c_constrained
          c_new(:,j) =  max(c_new(:,j), 1e-5); % rules out negative values
      end
      
      err_c = max(max(abs(c_new - guess.ci)));

      guess.ci = c_new * lambda + (1 - lambda) * guess.ci;
      
      iter_c
      err_c
      
      iter_c = iter_c + 1;
            %%
    end
    
    % Write the policy function for consumption
    for j=1:ns
      policy.ci(:,j) = interp1(grid.b, guess.ci(:,j), grid.b_fine);
    end

    %% Solve for interest
    
    % Write the policy function for assets
    bi_choice  = (grid.b2 * guess.r0 + (1 - par.tau) * grid.s2 .* policy.li - ...
                guess.ci ./ w_p0); 

    for j=1:ns
        policy.bi(:,j) = interp1(grid.b, bi_choice(:,j), grid.b_fine);
    end
    
    % Compute the endogenous distribution
    trows = zeros(nb_fine * ns * ns * 2, 1);
    tcols = trows;
    tvals = tcols;
    index = 0;
    for j=1:ns
        for bi = 1:nb_fine
            [vals,inds] = basefun(grid.b_fine, nb_fine, policy.bi(bi,j));
            for jp=1:ns
                index = index + 1;
                trows(index) = bi + (j - 1) * nb_fine;
                tcols(index) = inds(1) + (jp - 1)* nb_fine;
                tvals(index) = Pr(j, jp) * vals(1);
                index = index+1;
                trows(index) = bi + (j - 1) * nb_fine;
                tcols(index) = inds(2) + (jp - 1) * nb_fine;
                tvals(index) = Pr(j, jp) * vals(2);
            end
        end
    end
    transMat = sparse(trows, tcols, tvals, nb_fine * ns, nb_fine * ns);
    [EigVec, EigVal] = eigs(transMat.', 1);
    EigVec = EigVec / sum(EigVec);
    EigVec(EigVec < 0) = 0;
    EigVec = EigVec / sum(EigVec);
    G0 = reshape(EigVec / sum(EigVec), [nb_fine ns]); % distr. of HHs across assets & states
   
    % update guess for r
    b = sum(sum(policy.bi .* G0)); % aggregate HH borrowing
    bg = -(b + par.b_star); % solve for govt borrowing from bond market clearing
    r_new = (bg + par.g - par.tau * y) / bg; % update r from govt BC

    err_r = abs(r_new - guess.r0);

    guess.r0 = lambda * r_new + (1 - lambda) * guess.r0;

    iter_r
    err_r
  
    iter_r = iter_r + 1;
    %%
  
  end
  
  %% Solve for terms of trade
  ch_star = par.gamma * y; % US export to the RoW
  ch = y - par.g - ch_star; % consumption of home goods from market clearing
  ph_pf_new = cf / ch; % domestic price of foreign goods from the FOC

  err_tot = max(max(abs(ph_pf_new - guess.ph_pf)));

  guess.ph_pf = lambda * ph_pf_new + (1 - lambda) * guess.ph_pf;
  
  iter_tot
  err_tot
  
  iter_tot = iter_tot + 1;

end


%----------------------------------------------------------------
% 6. Export results
%----------------------------------------------------------------

save("PS3Q4.mat");


%----------------------------------------------------------------
% 7. Defining functions
%----------------------------------------------------------------

function [Z,PI] = rouwenhorst(N,mu,rho,sigma)
    % Code to approximate AR(1) process using the Rouwenhorst method as in 
    % Kopecky & Suen, Review of Economic Dynamics (2010), Vol 13, p 701-714
    %
    %Purpose:    Finds a Markov chain whose sample paths approximate those of
    %            the AR(1) process
    %                z(t+1) = (1-rho)*mu + rho * z(t) + eps(t+1)
    %            where eps are normal with stddev sigma
    %
    %Format:     [Z, PI] = rouwenhorst(N,mu,rho,sigma)
    %
    %Input:      N       scalar, number of nodes for Z
    %            mu      scalar, unconditional mean of process
    %            rho     scalar
    %            sigma   scalar, std. dev. of epsilons
    %
    %Output:     Z       N*1 vector, nodes for Z
    %            PI      N*N matrix, transition probabilities
    %
    % Code and comment by Martin Floden, Stockholm University, August 2010
    %
    % Comment on this method:
    % As opposed to the methods suggested by Tauchen and Tauchen and Hussey 
    % (see M. Floden, Economic Letters, 2008, 99, 516-520), the Rouwenhorst
    % method perfectly matches both the conditional and unconditional variances
    % and autocorrelations of the AR(1) process. The method however tends to 
    % generate errors eps that are further away from the normal distribution
    % than the Tauchen methods (the kurtosis of the simulated eps is too high
    % with the Rouwenhorst method).
    
    sigmaz = sigma / sqrt(1-rho^2);
    
    p  = (1+rho)/2;
    PI = [p 1-p; 1-p p];
    
    for n = 3:N
        PI = p*[PI zeros(n-1,1); zeros(1,n)] + ...
             (1-p)*[zeros(n-1,1) PI; zeros(1,n)] + ...
             (1-p)*[zeros(1,n); PI zeros(n-1,1)] + ...
             p*[zeros(1,n); zeros(n-1,1) PI];
        PI(2:end-1,:) = PI(2:end-1,:)/2;
    end
    
    fi = sqrt(N-1)*sigmaz;
    Z  = linspace(-fi,fi,N)';
    Z  = Z + mu;

end


function [vals, inds]=basefun(grid_x,npx,x)
  %Linear interpolation
  jl=1;
  ju=npx;
  while((ju-jl>1))
    jm=round((ju+jl)/2);
    if(x>=grid_x(jm))
      jl=jm;
    else
      ju=jm;
    end
  end
  
  i=jl+1;
  vals(2)=( x-grid_x(i-1) )/(grid_x(i)-grid_x(i-1));
  vals(2)=max(0.0d0,min(1.0d0,vals(2)));
  vals(1)=1.0d0-vals(2);
  inds(2)=i;
  inds(1)=i-1;
  
end
