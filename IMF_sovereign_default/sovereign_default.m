

%----------------------------------------------------------------
%
% Title: International Macro-Finance Problem Set 2, main file
% Author: Rinto Fujimoto
% Date: 25/11/2023
% Description: Sovereign default model with T periods
%
%----------------------------------------------------------------

%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------

close all;
clear all;

cd '/home/rinto/Desktop/International Macro/PS2'

%----------------------------------------------------------------
% 1. Defining parameters, grid and variables
%----------------------------------------------------------------

% parameters:
par.gamma = 2 % household's RRA preference
par.beta = .97; % subjective discount factor
par.pi = .5; % probability of being in the good state


% constants:
cons.phi_hat = .5; % cost of default in the good state
cons.yh = 1.1; % endowment in good state
cons.yl = .9; % endowment in bad state
cons.rf = par.beta^(-1) - 1; % risk-free rate

% number of time periods:
t = 30; 

% define convergence criterion
maxit_q = 1000; % max iteration to solve for q
maxit_v = 1000; % max iteration to solve for v
err_tol_q = 1e-10; % error tolerance 
err_tol_v = 1e-10; 
lambda_q = .5; % dampening parameter 
lambda_v = .5; 


% transition matrix
Pr = [par.pi, 1 - par.pi; 
      par.pi, 1 - par.pi];

      
% derived values:
qrf = (1 + repmat(cons.rf, [2, 1])).^-(1/4); % quarterly risk-free rate


%----------------------------------------------------------------
% 2. Defining grid 
%----------------------------------------------------------------

n = 50; % grid points for b

b_min = -.02; % min value for b
b_max = 1.2; % max value for b

b_vec = linspace(b_min, b_max, n); % grid for debt, 1 x n vector
y_vec = [cons.yh cons.yl].'; % grid for endowment, 2 x 1 vector

% Ensure presence of 0 on b-vector
[~,i_b_zero] = min(abs(b_vec)); 
% i_b_zero captures the index of the cell containing 0
b_vec(i_b_zero) = 0; 

% grid:
grid.b_state3 = repmat(b_vec, [2, 1, n]); % state debt, 2 x n x n
grid.b_choice2 = repmat(b_vec, [2, 1]); % choice debt, 2 x n
grid.y_state3 = repmat(y_vec, [1, n, n]); % state output, 2 x n x n

grid.borr_choice2 = zeros(2, n, t); % grid which will contain debt value
grid.borr_choice3 = zeros(2, n, n, t); 
% grid.borr_choice2 augmented by 1 dimension to account for choice debt


      
%----------------------------------------------------------------
% 3. Setting Initial Guesses
%----------------------------------------------------------------

guess.v = zeros(2, n, t); % value function
guess.v_new = zeros(2, n, t); 

guess.i_b = zeros(2, n, t); % debt choice index (to be extracted from the grid)

guess.q = qrf(1, 1) * ones(2, n, t); % price of debt, 2 x n x t matrix
guess.def = zeros(2, n, t); % default choice



%----------------------------------------------------------------
% 4. Other variables 
%----------------------------------------------------------------

% storage value
store.v = zeros(2, n, t);
store.i_b = zeros(2, n, t);
store.q = qrf(1, 1) * ones(2, n, t);
store.def = zeros(2, n, t);

% policy functions
policy.b = zeros(2, n, t);
policy.def = zeros(2, n, t);

% others
con_choice = zeros(2, n, n, t); % consumption choice for non-default
util_choice = zeros(2, n, n, t); % utility choice for non-default
borr_maximand = zeros(2, n, n, t); % to be maximised over choice debt
e_def = zeros(2, n, t); % expected default prob.
e_v = zeros(2, n); % continuation value
e_v3 = zeros(2, n, n); % continuation value, augmented
e_v_def = zeros(2, n); % continuation value after default

% sum of discount factors (i.e. (1 - beta^(T-t)) / (1 - beta))
discount = zeros(1, t); 
for i = 1:t
  discount(:, i) = par.beta * ((1 - par.beta^(i)) / (1 - par.beta)); % scalar
end
discount = flip(discount, 2);

% consumption in default
con_def = [cons.yh - cons.phi_hat, cons.yl].'; % 2 x 1
con_def3 = repmat(con_def, [1, n, n]);

    
% Expected value of exclusion state
e_v_def =  discount.' * Pr(1, :) * util(con_def, par.gamma); % t x 1
    
% evaluate value function in default state
v_def = repmat(util(con_def, par.gamma), [1, n, t]) + permute(repmat(e_v_def, [1, n, 2]), [3, 2, 1]); 
% 2 x n x t



%----------------------------------------------------------------
% 5. Value function iteration
%----------------------------------------------------------------


err_q = 7;
err_v = 7;
iter_q = 1;
iter_v = 1;



while err_q > err_tol_q && iter_q < maxit_q

  while err_v > err_tol_v && iter_v < maxit_v

    for i = 1:t
      
      % Expected continuation value
      e_v = Pr * guess.v(:, :, i);
      e_v3 = permute(repmat(e_v(:, :), [1, 1, n]), [1, 3, 2]); % 2 x n x n matrix 
      e_v_def = Pr * v_def(:, :, i);
      
      optimal_choice = max(e_v3(:, :, i), e_v_def);
  
      % Resources from borrowing
      grid.borr_choice2(:, :, i) = guess.q(:, :, i) .* grid.b_choice2; % 2 x n matrix
      grid.borr_choice3(:, :, :, i) = repmat(grid.borr_choice2(:, :, i), [1, 1, n]); % 2 x n x n
      grid.borr_choice3(:, :, :, i) = permute(grid.borr_choice3(:, :, :, i), [1, 3, 2]); 
  
      if i < t
        % Consumption implied by choice and state b and guess q
        con_choice(:, :, :, i) = grid.y_state3 - grid.b_state3 + grid.borr_choice3(:, :, :, i); % 2 x n x n matrix
      else
        % Terminal condition
        con_choice(:, :, :, i) = max(grid.y_state3 - grid.b_state3, con_def3);
      end
      
      con_choice(con_choice < eps) = eps; % rule out negative consumption
      
      % Period-utility implied by state and choice b
      util_choice(:, :, :, i) = util(con_choice(:, :, :, i), par.gamma); % 2 x 100 x 100
      
      % Formulate maximand in borrowing choice
      borr_maximand(:, :, :, i) = util_choice(:, :, :, i) + par.beta * e_v3(:, :, :); % 2 x 100 x 100
  
      % Store old choice for borrowing
      store.i_b(:, :, i) = guess.i_b(:, :, i); % 2 x n
  
      % Maximise over b' and update value function
      [guess.v_new(:, :, i), guess.i_b(:, :, i)] = max(borr_maximand(:, :, :, i), [], 3); % 2 x n and 2 x n
      
      % Ensures that HH cannot borrow once defaulted
      guess.i_b(:, :, i) = guess.def(:, :, i) .* ones(2, n) * i_b_zero + (1 - guess.def(:, :, i)) .* guess.i_b(:, :, i);
      
    end
    
    %Store old default policy function
    store.def = guess.def;
    
    % Evaluate policy function for default (indicator function)
    guess.def = v_def > guess.v_new;
    % compare two 2 x n x t matrices
    
    % Evaluate value function including discrete choice for default
    guess.v_new = max(v_def, guess.v_new);
    
    % Store old value-function guesses
    store.v = guess.v;
    
    % Update value-function guesses
    guess.v = lambda_v * guess.v_new + (1 - lambda_v) * store.v;
    
    % Evaluate change in v and compare to error tolerance
    err_v = max(abs(guess.v(:) - store.v(:)));
    
    iter_v
    err_v
    
    iter_v = iter_v + 1;

end

  % expected probability of default
  for i = 1:t
    e_def(:, :, i) = Pr * guess.def(:, :, i);
  end 
  
  
  % Store old sovereign debt price
  store.q = guess.q;

  guess.q = qrf(1, 1) * (1 - e_def);
  
  % Evaluate change in q_g
  err_q = max(abs(guess.q(:) - store.q(:)));

  % Update sovereign debt price
  guess.q = lambda_q * guess.q + (1 - lambda_q) * store.q;

  iter_q
  err_q

  iter_q = iter_q + 1;

  % Reset counter and diff for inner-v loop
  err_v = 7;
  iter_v = 1;
  
end


policy.b = repmat(grid.b_choice2, [1, 1, t]);
policy.b = policy.b(store.i_b);

policy.def = store.def;

%----------------------------------------------------------------
%% 6.Plot the value function and policy functions
%----------------------------------------------------------------


% Policy functions and debt price at t = 1 
figure 
  subplot(2, 2, 1);
    hold on;
    plot(b_vec, policy.b(1, :, 1), 'r-', 'LineWidth', 2.5);
    plot(b_vec, policy.b(2, :, 1), 'b--', 'LineWidth', 2.5);
    xlim([-.05 1.05]);
    xlabel('State debt'), ylabel('Choice debt');
    title('Debt policy function at t = 1');
    legend('y_{H}', 'y_{L}', 'Location');
    hold off;
  subplot(2, 2, 2);
    hold on;
    plot(b_vec, policy.def(1, :, 1), 'r-', 'LineWidth', 2.5);
    plot(b_vec, policy.def(2, :, 1), 'b--', 'LineWidth', 2.5);
    xlim([-.05 1.05]);
    xlabel('State debt'), ylabel('Default');
    title('Default policy function at t = 1');
    legend('y_{H}', 'y_{L}', 'Location');
    hold off;
  subplot(2, 2, 3);
    hold on;
    plot(b_vec, store.q(1, :, 1), 'r-', 'LineWidth', 2.5);
    plot(b_vec, store.q(2, :, 1), 'b--', 'LineWidth', 2.5);
    xlim([-.05 1.05]);
    xlabel('Choice debt'), ylabel('Debt price');
    title('Debt price at t = 1');
    legend('y_{H}', 'y_{L}', 'Location');
    hold off;

saveas(gcf, 'Policy_functions_Q2.jpg');    


    
figure;
  hold on;
  % Value function for high output at t = 1 (solid red line)
  plot(b_vec, store.v(1, :, 1), 'r', 'LineWidth', 2.5); 
  % Value function for high output at t = 2 (solid blue line)
  plot(b_vec, store.v(1, :, 2), 'Color', 'b', 'LineWidth', 2.5); 
  % Value function for low output at t = 1 (dashed red line)
  plot(b_vec, store.v(2, :, 1), 'Color', 'r', '--', 'LineWidth', 2.5);
  % Value function for low output at t = 2 (dashed blue line)
  plot(b_vec, store.v(2, :, 2), 'Color', 'b', '--', 'LineWidth', 2.5);
  xlabel('Debt levels', 'FontSize', 12);
  ylabel('Value function', 'FontSize', 12);
  title('Value function by time period and endowment levels', 'FontSize', 14);
  % Adding a legend
  legend('High endowment at t=1', 'High endowment at t=2', 'Low endowment at t=1', 'Low endowment at t=2', 'Location', 'best');
  hold off;

saveas(gcf, 'Value_functions_Q2.jpg');    



%----------------------------------------------------------------
% 6. Defining functions
%----------------------------------------------------------------


function u = util(c, gamma)
% this is the utility function (CRRA)
	u = c.^(1 - gamma) / (1 - gamma);
end

