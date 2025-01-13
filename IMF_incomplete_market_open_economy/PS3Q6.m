 

%----------------------------------------------------------------
%
% Title: International Macro-Finance Problem Set 3, model file
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
%% 1. Retrieve parameters from Q4
%----------------------------------------------------------------

load("PS3Q4.mat");


%----------------------------------------------------------------
%% 2. Set government debt as parameter & set foreign lending
%----------------------------------------------------------------

par.bg = bg;
clear bg;


%----------------------------------------------------------------
%% 3. Iterations
%----------------------------------------------------------------
 
iter_tot = 1;
err_tot = 1;


g_tol = 1e-4;         % Tolerance for convergence of par_g
max_iter_g = 1000;    % Maximum iterations for finding par_g

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
    c_constrained = (1 - par.tau) .* w_p0 .* grid.s2 .* policy.li + ...
                    w_p0 .* grid.b2 .* guess.r0 - ...
                    w_p0 .* b_con;
    c_constrained = max(c_constrained, 1e-5); % rule out consumption below 0
    
    iter_c = 1;
    err_c = 1; 

    guess.ci = ones(nb,ns);
    %%
   
    while err_c > errtol_c && iter_c <= maxIter_c
        
   
      Emup1 = (guess.ci * par.scale - policy.li.^(1 + par.eta) / (1 + par.eta)).^(-1); % expected marginal utility at t+2
      Emup = par.beta * guess.r0 * Emup1 * Pr'; % expected marginal utility at t+1
      Ec = Emup.^(-1) + policy.li.^(1 + par.eta) / (1 + par.eta); % consumption tomorrow
      bi_state = (Ec ./ w_p0 + grid.b2 - (1 - par.tau) .* grid.s2 .* ...
                         policy.li) ./ (guess.r0); % state debt tomorrow (i.e. choice debt today)
      
      c_new = ones(nb, ns);

      for j=1:ns
          
          c_new(:,j) =  (grid.b > bi_state(Ind_b_min, j)) .* ... % indicator function on whether borrowing constraint is binding
                        interp1(bi_state(:, j), Ec(:, j), grid.b, 'pchip') + ... % interpolate c_s = f(bi_state) at each grid point
                        (grid.b <= bi_state(Ind_b_min, j)) .* c_constrained(:,j); % if constraint is binding, then c_constrained
          c_new(:,j) =  max(c_new(:,j), 1e-5); % rules out negative values
      end
      
      guess.ci = c_new * lambda + (1 - lambda) * guess.ci;
      
      err_c = max(max(abs(c_new - guess.ci)));
      
      iter_c
      err_c
      
      iter_c = iter_c + 1;
            
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
    c = sum(sum(policy.ci .* G0)); % aggregate HH consumption
    b = sum(sum(policy.bi .* G0));
    b_star = -(b + par.bg); % solve for aggregate borrowing from bond market clearing
    g = par.tau * y + par.bg * (guess.r0 - 1); % solve for govt spending from govt BC
     
    r_new = (par.bg + g - par.tau * y) / par.bg; % update r from govt BC
    % r_new = 1 + c / (b * w_p0) - (1 - par.tau) * l0 / b; % solve for interest from HH BC

    err_r = abs(r_new - guess.r0);

    guess.r0 = lambda * r_new + (1 - lambda) * guess.r0; % update
    
    iter_r
    err_r
  
    iter_r = iter_r + 1;
    %%
  
  end
  
  %% Solve for terms of trade
  ch_star = par.gamma * y;
  ch = y - g - ch_star; % consumption of home goods from market clearing
  ph_pf_new = cf / ch; % domestic price of foreign goods from the FOC

  err_tot = max(max(abs(ph_pf_new - guess.ph_pf)));

  guess.ph_pf = lambda * ph_pf_new + (1 - lambda) * guess.ph_pf; % update
  
  iter_tot
  err_tot
  
  iter_tot = iter_tot + 1;

end


%----------------------------------------------------------------
% 4. Export results
%----------------------------------------------------------------

save("PS3Q6.mat");


%----------------------------------------------------------------
% 5. Defining functions
%----------------------------------------------------------------

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