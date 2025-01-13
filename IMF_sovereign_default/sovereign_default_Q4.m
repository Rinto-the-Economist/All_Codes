

%----------------------------------------------------------------
%
% Title: International Macro-Finance Problem Set 2, Q4
% Author: Rinto Fujimoto
% Date: 25/11/2023
% Description: Sovereign default model with T periods
%
%----------------------------------------------------------------


%----------------------------------------------------------------
% 0. Housekeeping
%----------------------------------------------------------------

close all;
clear all;


%----------------------------------------------------------------
% 1. Defining functions
%----------------------------------------------------------------

function u = util(c, gamma)
% this is the utility function (CRRA)
	u = c.^(1 - gamma) / (1 - gamma);
end



function [value, default, debt_price, b_vec] = model(time, gamma, sigma, phi_hat)
  % This function performs value function iteration for different
  % parameters.
  % Inputs: time horizon, borrower's risk aversion, lender's risk aversion, cost of default
  % Outputs: value function, default policy function, debt price, grid for b
  % Note: sigma appears in the debt pricing equation

  
  par.gamma = gamma; 
  par.beta = .97; 
  par.pi = .5; 
  
  cons.phi_hat = phi_hat; 
  cons.yh = 1.1; 
  cons.yl = .9; 
  cons.rf = par.beta^(-1) - 1;
  
  t = time; 
  
  maxit_q = 1000;
  maxit_v = 1000;
  err_tol_q = 1e-10;
  err_tol_v = 1e-10;
  lambda_v = .5; 
  lambda_q = .5; 
  
  Pr = [par.pi, 1 - par.pi; 
        par.pi, 1 - par.pi];
  
  qrf = (1 + repmat(cons.rf, [2, 1])).^-(1/4); 
  
  n = 50; 
  
  b_min = -.02;
  b_max = 1.2;
  
  b_vec = linspace(b_min, b_max, n);
  y_vec = [cons.yh cons.yl].'; 
  
  [~,i_b_zero] = min(abs(b_vec));
  b_vec(i_b_zero) = 0;
  
  grid.b_state3 = repmat(b_vec, [2, 1, n]);
  grid.b_choice2 = repmat(b_vec, [2, 1]); 
  grid.y_state3 = repmat(y_vec, [1, n, n]); 
  
  grid.borr_choice2 = zeros(2, n, t);
  grid.borr_choice3 = zeros(2, n, n, t);
  
  guess.v = zeros(2, n, t);
  guess.v_new = zeros(2, n, t);
  
  guess.i_b = zeros(2, n, t);
  
  guess.q = qrf(1, 1) * ones(2, n, t); 
  guess.def = zeros(2, n, t);
  
  store.v = zeros(2, n, t);
  store.i_b = zeros(2, n, t);
  store.q = qrf(1, 1) * ones(2, n, t);
  store.def = zeros(2, n, t);
  
  policy.b = zeros(2, n, t);
  policy.def = zeros(2, n, t);
  
  con_choice = zeros(2, n, n, t);
  util_choice = zeros(2, n, n, t);
  borr_maximand = zeros(2, n, n, t);
  e_def = zeros(2, n, t);
  e_v = zeros(2, n);
  e_v3 = zeros(2, n, n);
  e_v_def = zeros(2, n);
  
  discount = zeros(1, t); 
  for i = 1:t
    discount(:, i) = par.beta * ((1 - par.beta^(i)) / (1 - par.beta)); 
  end
  discount = flip(discount, 2);
  
  con_def = [cons.yh - cons.phi_hat, cons.yl].'; 
  con_def3 = repmat(con_def, [1, n, n]);
  
  e_v_def =  discount.' * Pr(1, :) * util(con_def, par.gamma); 
      
  v_def = repmat(util(con_def, par.gamma), [1, n, t]) + permute(repmat(e_v_def, [1, n, 2]), [3, 2, 1]); 
  
  err_q = 7;
  err_v = 7;
  iter_q = 1;
  iter_v = 1;
  
  
  
  while err_q > err_tol_q && iter_q < maxit_q
  
    while err_v > err_tol_v && iter_v < maxit_v
  
      for i = 1:t
        
        e_v = Pr * guess.v(:, :, i);
        e_v3 = permute(repmat(e_v(:, :), [1, 1, n]), [1, 3, 2]); 
        e_v_def = Pr * v_def(:, :, i);
        
        optimal_choice = max(e_v3(:, :, i), e_v_def);
    
        grid.borr_choice2(:, :, i) = guess.q(:, :, i) .* grid.b_choice2; 
        grid.borr_choice3(:, :, :, i) = repmat(grid.borr_choice2(:, :, i), [1, 1, n]); 
        grid.borr_choice3(:, :, :, i) = permute(grid.borr_choice3(:, :, :, i), [1, 3, 2]); 
    
        if i < t
          con_choice(:, :, :, i) = grid.y_state3 - grid.b_state3 + grid.borr_choice3(:, :, :, i); 
        else
          con_choice(:, :, :, i) = max(grid.y_state3 - grid.b_state3, con_def3);
        end
        
        con_choice(con_choice < eps) = eps; 
        
        util_choice(:, :, :, i) = util(con_choice(:, :, :, i), par.gamma); 
        
        borr_maximand(:, :, :, i) = util_choice(:, :, :, i) + par.beta * e_v3(:, :, :); 
    
        store.i_b(:, :, i) = guess.i_b(:, :, i); 
    
        [guess.v_new(:, :, i), guess.i_b(:, :, i)] = max(borr_maximand(:, :, :, i), [], 3); % 2 x n and 2 x n
        
        guess.i_b(:, :, i) = guess.def(:, :, i) .* ones(2, n) * i_b_zero + (1 - guess.def(:, :, i)) .* guess.i_b(:, :, i);
        
      end
      
      store.def = guess.def;
      
      guess.def = v_def > guess.v_new;
      
      guess.v_new = max(v_def, guess.v_new);
      
      store.v = guess.v;
      
      guess.v = lambda_v * guess.v_new + (1 - lambda_v) * store.v;
      
      err_v = max(abs(guess.v(:) - store.v(:)));
      
      iter_v
      err_v
      
      iter_v = iter_v + 1;
  
  end
  
    for i = 1:t
      e_def(:, :, i) = Pr * guess.def(:, :, i);
    end 
    
    store.q = guess.q;
  
    % sigma is the lender's risk aversion
    guess.q = qrf(1, 1) * (1 - e_def).^sigma;
    
    err_q = max(abs(guess.q(:) - store.q(:)));
  
    guess.q = lambda_q * guess.q + (1 - lambda_q) * store.q;
  
    iter_q
    err_q
  
    iter_q = iter_q + 1;
    
    err_v = 7;
    iter_v = 1;
    
  end
  
  
  policy.b = repmat(grid.b_choice2, [1, 1, t]);
  policy.b = policy.b(store.i_b);
  policy.def = store.def;
  
  default = policy.def;
  debt_price = store.q;
  value = store.v;

end



%----------------------------------------------------------------
% 2. Running functions with different parameters
%----------------------------------------------------------------

[value1, ~, ~, b_vec] = model(20, 2, 1.0, .5);
value2 = model(30, 2, 1.0, .5);
value3 = model(40, 2, 1.0, .5);
value4 = model(50, 2, 1.0, .5);

[~, default1] = model(30, -.5, 1.0, .5);
[~, default2] = model(30, 0, 1.0, .5);
[~, default3] = model(30, 2.0, 1.0, .5);

[~, default4, debt_price1] = model(30, 2, .5, .5);
[~, default5, debt_price2] = model(30, 2, 1.0, .5);
[~, default6, debt_price3] = model(30, 2, 2.0, .5);

[~, default7] = model(30, 2, 1.0, .22);
[~, default8] = model(30, 2, 1.0, .45);
[~, default9] = model(30, 2, 1.0, .66);



%----------------------------------------------------------------
% 3.Plot the value function and policy functions
%----------------------------------------------------------------


% Value function at t=1 and t=2 for various time horizons
figure 
  subplot(2, 2, 1);
    hold on;
    plot(b_vec, value1(1, :, 1), 'r-', 'LineWidth', 2.5);
    plot(b_vec, value1(2, :, 1), 'b--', 'LineWidth', 2.5);
    xlabel('State debt'), ylabel('Utility');
    title('Value functions for a model with T = 3');
    legend('t = 1', 't = 2');
    hold off;
  subplot(2, 2, 2);
    hold on;
    plot(b_vec, value2(1, :, 1), 'r-', 'LineWidth', 2.5);
    plot(b_vec, value2(2, :, 1), 'b--', 'LineWidth', 2.5);
    xlabel('State debt'), ylabel('Utility');
    title('Value functions for a model with T = 10');
    legend('t = 1', 't = 2');
    hold off;
  subplot(2, 2, 3);
    hold on;
    plot(b_vec, value3(1, :, 1), 'r-', 'LineWidth', 2.5);
    plot(b_vec, value3(2, :, 1), 'b--', 'LineWidth', 2.5);
    xlabel('State debt'), ylabel('Utility');
    title('Value functions for a model with T = 30');
    legend('t = 1', 't = 2');
    hold off;
  subplot(2, 2, 4);
    hold on;
    plot(b_vec, value4(1, :, 1), 'r-', 'LineWidth', 2.5);
    plot(b_vec, value4(2, :, 1), 'b--', 'LineWidth', 2.5);
    xlabel('State debt'), ylabel('Utility');
    title('Value functions for a model with T = 50');
    legend('t = 1', 't = 2');
    hold off;
    
    saveas(gcf, 'Value_functions_Q3.jpg');  


figure;
  hold on;
  % Default policy function for risk-loving borrower (darker red)
  plot(b_vec, default1(1, :, 1), 'Color', [1 0 0], 'LineWidth', 2.5); 
  % Default policy function for risk-neutral borrower
  plot(b_vec, default2(1, :, 1), 'Color', [.75 0 0], '--', 'LineWidth', 2.5); 
  % Default policy function for risk-averse borrower (lighter red)
  plot(b_vec, default3(1, :, 1), 'Color', [.5 0 0], '-.', 'LineWidth', 2.5);
  xlabel('State debt', 'FontSize', 12);
  ylabel('Default', 'FontSize', 12)
  % Adding a legend
  legend('\gamma = -0.5', '\gamma = 0', '\gamma = 2.0', 'Location', 'best');
  hold off;

saveas(gcf, 'Default_risk_borrower_Q4.jpg');   



figure;
  hold on;
  % Default policy function for risk-loving lender (darker green)
  plot(b_vec, default4(1, :, 1), 'Color', [0 1 0], 'LineWidth', 2.5); 
  % Default policy function for risk-neutral lender
  plot(b_vec, default5(1, :, 1), 'Color', [0 .75 0], '--', 'LineWidth', 2.5); 
  % Default policy function for risk-averse lender (lighter green)
  plot(b_vec, default6(1, :, 1), 'Color', [0 .5 0], '-.', 'LineWidth', 2.5);
  xlabel('State debt', 'FontSize', 12);
  ylabel('Default', 'FontSize', 12);
  % Adding a legend
  legend('\sigma = .5', '\sigma = 1.0', '\sigma = 2.0', 'Location', 'best');
  hold off;

saveas(gcf, 'Default_risk_lender_Q4.jpg');   


figure;
  hold on;
  % Debt price for risk-loving lender (darker yellow)
  plot(b_vec, debt_price1(1, :, 1), 'Color', [1 1 0], 'LineWidth', 2.5); 
  % Debt price for risk-neutral lender
  plot(b_vec, debt_price2(1, :, 1), 'Color', [.75 .75 0], '--', 'LineWidth', 2.5); 
  % Debt price for risk-averse lender (lighter yellow)
  plot(b_vec, debt_price3(1, :, 1), 'Color', [.5 .5 0], '-.', 'LineWidth', 2.5);
  xlabel('Choice debt', 'FontSize', 12);
  ylabel('Debt Price', 'FontSize', 12);
  % Adding a legend
  legend('\sigma = .5', '\sigma = 1.0', '\sigma = 2.0', 'Location', 'best');
  hold off;

saveas(gcf, 'Debt_price_risk_lender_Q4.jpg');   



figure;
  hold on;
  % Default policy function for low default cost (darker blue)
  plot(b_vec, default7(1, :, 1), 'Color', [0 0 1], 'LineWidth', 2.5); 
  % Default policy function for medium default cost 
  plot(b_vec, default8(1, :, 1), 'Color', [0 0 .75], '--', 'LineWidth', 2.5); 
  % Default policy function for high default cost (lighter blue)
  plot(b_vec, default9(1, :, 1), 'Color', [0 0 .5], '-.', 'LineWidth', 2.5);
  xlabel('State debt', 'FontSize', 12);
  ylabel('Default', 'FontSize', 12);
  % Adding a legend
  legend('\phi = .22', '\phi = .45', '\phi = .66', 'Location', 'best');
  hold off;

saveas(gcf, 'Default_cost_Q4.jpg');   

 