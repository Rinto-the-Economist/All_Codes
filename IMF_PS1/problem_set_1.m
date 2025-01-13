
pkg load dataframe

%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------

clear all;
close all;


%----------------------------------------------------------------
% 1. Run Models
%----------------------------------------------------------------

dynare optimal;
dynare ditr;
dynare citr;
dynare peg1;
dynare peg2;

%----------------------------------------------------------------
% 2. Load Models
%----------------------------------------------------------------

optimal_results = load("optimal_results.mat");
ditr_results = load("ditr_results.mat");
citr_results = load ("citr_results.mat");
peg1_results = load ("peg1_results.mat");
peg2_results = load("peg2_results.mat");


%----------------------------------------------------------------
% 3. Define Functions
%----------------------------------------------------------------

% Function to setup axes for subplots
function setup_subplot_axes()
    xlims = xlim; % Get the current x-axis limits
    line(xlims, [0 0], 'Color', 'r', 'LineWidth',0.5); % Draw grey line at y=0 with 50% opacity
    max_ylim = max(abs(ylim)); % Get max absolute value from y-axis
    ylim([-max_ylim max_ylim]); % Set symmetric y limits around 0
    xlabel('Quarters since shock');
endfunction 

function loss0 = calculate_welfare_loss(x, pih)
  alpha = .4;
  beta = .99;
  epsilon = 6;
  theta = .75;
  phi = 3;
  lambda = (1 - theta) * (1 - beta * theta) / theta;
  omega = (1 - alpha) * (1 + phi);
  lambda_pi = epsilon / (lambda * (1 + phi));
  loss = zeros(1, length(x));
  
  for t = 1:length(x)
    loss(t) = - omega / 2 * beta ^ t * (x(t)^2 + lambda_pi * pih(t) ^ 2);
    
  endfor
  
  loss0 = sum(loss);
  
endfunction
%----------------------------------------------------------------
% 3. Plot the Results
%----------------------------------------------------------------


% annualise inflation and convert to percentage points
optimal_pih_err_u = (exp(optimal_results.oo_.irfs.pih_err_u(1:20)) - 1) * 4;
ditr_pih_err_u = (exp(ditr_results.oo_.irfs.pih_err_u(1:20)) - 1) * 4;
citr_pih_err_u = (exp(citr_results.oo_.irfs.pih_err_u(1:20)) - 1) * 4;
peg2_pih_err_u = (exp(peg2_results.oo_.irfs.pih_err_u(1:20)) - 1) * 4;

optimal_pi_err_u = (exp(optimal_results.oo_.irfs.pi_err_u(1:20)) - 1) * 4;
ditr_pi_err_u = (exp(ditr_results.oo_.irfs.pi_err_u(1:20)) - 1) * 4;
citr_pi_err_u = (exp(citr_results.oo_.irfs.pi_err_u(1:20)) - 1) * 4;
peg2_pi_err_u = (exp(peg2_results.oo_.irfs.pi_err_u(1:20)) - 1) * 4;

optimal_i_err_u = (exp(optimal_results.oo_.irfs.i_err_u(1:20)) - 1) * 4;
ditr_i_err_u = (exp(ditr_results.oo_.irfs.i_err_u(1:20)) - 1) * 4;
citr_i_err_u = (exp(citr_results.oo_.irfs.i_err_u(1:20)) - 1) * 4;
peg2_i_err_u = (exp(peg2_results.oo_.irfs.i_err_u(1:20)) - 1) * 4;

% Plotting the cost-push shock Graph
figure('Position', [100, 100, 1500, 800]);
    % pih IRFs
    subplot(2,3,1)
        optimal = plot(optimal_pih_err_u, 'Linewidth', 1, 'Color', 'k');
        hold on
        ditr = plot(ditr_pih_err_u, '--', 'LineWidth',1, 'Color', 'k');
        citr = plot(citr_pih_err_u, '-.', 'LineWidth',1, 'Color', 'k');
        peg2 = plot(peg2_pih_err_u, ':', 'LineWidth',1, 'Color', 'k');
        setup_subplot_axes();
        title('Domestic Inflation');
        ylabel('Annualized percentage points');
    % x IRFs
    subplot(2,3,2)
        plot(optimal_results.oo_.irfs.x_err_u(1:20), 'Linewidth', 1, 'Color', 'k');
        hold on
        plot(ditr_results.oo_.irfs.x_err_u(1:20), '--', 'LineWidth',1, 'Color', 'k');
        plot(citr_results.oo_.irfs.x_err_u(1:20), '-.', 'LineWidth',1, 'Color', 'k');
        plot(peg2_results.oo_.irfs.x_err_u(1:20), ':', 'LineWidth',1, 'Color', 'k');
        setup_subplot_axes();
        title('Output gap');
        ylabel('Percentage deviations from steady state');
    % pi
       subplot(2,3,3)
        plot(optimal_pi_err_u, 'Linewidth', 1, 'Color', 'k');
        hold on
        plot(ditr_pi_err_u, '--', 'LineWidth',1, 'Color', 'k');
        plot(citr_pi_err_u, '-.', 'LineWidth',1, 'Color', 'k');
        plot(peg2_pi_err_u, ':', 'LineWidth',1, 'Color', 'k');
        setup_subplot_axes();
        title('CPI inflation');
        ylabel('Annualized percentage points');
    % tau
    subplot(2,3,4)
        plot(optimal_results.oo_.irfs.tau_err_u(1:20), 'Linewidth', 1, 'Color', 'k');
        hold on
        plot(ditr_results.oo_.irfs.tau_err_u(1:20), '--', 'LineWidth',1, 'Color', 'k');
        plot(citr_results.oo_.irfs.tau_err_u(1:20), '-.', 'LineWidth',1, 'Color', 'k');
        plot(peg2_results.oo_.irfs.tau_err_u(1:20), ':', 'LineWidth',1, 'Color', 'k');
        setup_subplot_axes();
        title('Terms of trade');
        ylabel('Percentage deviations from steady state');
    % i
    subplot(2,3,5)
        plot(optimal_i_err_u, 'Linewidth', 1, 'Color', 'k');
        hold on
        plot(ditr_i_err_u, '--', 'LineWidth',1, 'Color', 'k');
        plot(citr_i_err_u, '-.', 'LineWidth',1, 'Color', 'k');
        plot(peg2_i_err_u, ':', 'LineWidth',1, 'Color', 'k');
        setup_subplot_axes();
        title('Nominal interest rate');
        ylabel('Annualized percentage points');
    % delta_e
    subplot(2,3,6)
        plot(optimal_results.oo_.irfs.delta_e_err_u(1:20), 'Linewidth', 1, 'Color', 'k');
        hold on
        plot(ditr_results.oo_.irfs.delta_e_err_u(1:20), '--', 'LineWidth',1, 'Color', 'k');
        plot(citr_results.oo_.irfs.delta_e_err_u(1:20), '-.', 'LineWidth',1, 'Color', 'k');
        plot(peg2_results.oo_.irfs.delta_e_err_u(1:20), ':', 'LineWidth',1, 'Color', 'k');
        setup_subplot_axes();
        title('Change in nominal exchange rate');
        ylabel('Percentage deviation from steady state');
        %{
    % Add a global legend using the plots from the first subplot
        lgd = legend([optimal, ditr, citr, peg2], {'Optimal policy', 'Domestic inflation targeting', 'CPI inflation targeting', 'Exchange rate peg2'});
        set(lgd, 'location', 'south', 'orientation', 'horizontal', 'fontsize', 12);
    % Manually adjust the position to be at the bottom center of the figure
        legendPosition = [0.25, 0.01, 0.5, 0.05];
        set(lgd, 'Position', legendPosition);
        %}
    % Saving the graph
    saveas(gcf, 'Cost-push shock.jpg');


    
% annualise inflation and convert to percentage points
%{
optimal_pih_err_r = (exp(optimal_results.oo_.irfs.pih_err_r(1:20)) - 1) * 4;
ditr_pih_err_r = (exp(ditr_results.oo_.irfs.pih_err_r(1:20)) - 1) * 4;
citr_pih_err_r = (exp(citr_results.oo_.irfs.pih_err_r(1:20)) - 1) * 4;
peg2_pih_err_r = (exp(peg2_results.oo_.irfs.pih_err_r(1:20)) - 1) * 4;
%}

optimal_pih_err_r = (exp(optimal_results.oo_.irfs.pih_err_r(1:20)) - 1) * 4;
ditr_pih_err_r = (exp(ditr_results.oo_.irfs.pih_err_r(1:20)) - 1) * 4;
citr_pih_err_r = (exp(citr_results.oo_.irfs.pih_err_r(1:20)) - 1) * 4;
peg2_pih_err_r = (exp(peg2_results.oo_.irfs.pih_err_r(1:20)) - 1) * 4;

optimal_pi_err_r = (exp(optimal_results.oo_.irfs.pi_err_r(1:20)) - 1) * 4;
ditr_pi_err_r = (exp(ditr_results.oo_.irfs.pi_err_r(1:20)) - 1) * 4;
citr_pi_err_r = (exp(citr_results.oo_.irfs.pi_err_r(1:20)) - 1) * 4;
peg2_pi_err_r = (exp(peg2_results.oo_.irfs.pi_err_r(1:20)) - 1) * 4;   

optimal_i_err_r = (exp(optimal_results.oo_.irfs.i_err_r(1:20)) - 1) * 4;
ditr_i_err_r = (exp(ditr_results.oo_.irfs.i_err_r(1:20)) - 1) * 4;
citr_i_err_r = (exp(citr_results.oo_.irfs.i_err_r(1:20)) - 1) * 4;
peg2_i_err_r = (exp(peg2_results.oo_.irfs.i_err_r(1:20)) - 1) * 4;    

% Plotting the technology shock graph
figure('Position', [100, 100, 1200, 800]);
    % pih IRFs
    subplot(2,3,1)
        optimal = plot(optimal_pih_err_r, 'Linewidth', 1, 'Color', 'k');
        hold on
        ditr = plot(ditr_pih_err_r, '--', 'LineWidth',1, 'Color', 'k');
        citr = plot(citr_pih_err_r, '-.', 'LineWidth',1, 'Color', 'k');
        peg2 = plot(peg2_pih_err_r, ':', 'LineWidth',1, 'Color', 'k');
        setup_subplot_axes();
        title('Domestic Inflation');
        ylabel('Annualized percentage points');
    % x IRFs
    subplot(2,3,2)
        plot(optimal_results.oo_.irfs.x_err_r(1:20), 'Linewidth', 1, 'Color', 'k');
        hold on
        plot(ditr_results.oo_.irfs.x_err_r(1:20), '--', 'LineWidth',1, 'Color', 'k');
        plot(citr_results.oo_.irfs.x_err_r(1:20), '-.', 'LineWidth',1, 'Color', 'k');
        plot(peg2_results.oo_.irfs.x_err_r(1:20), ':', 'LineWidth',1, 'Color', 'k');
        setup_subplot_axes();
        title('Output gap');
        ylabel('Percentage deviations from steady state');
    % pi
       subplot(2,3,3)
        plot(optimal_pi_err_r, 'Linewidth', 1, 'Color', 'k');
        hold on
        plot(ditr_pi_err_r, '--', 'LineWidth',1, 'Color', 'k');
        plot(citr_pi_err_r, '-.', 'LineWidth',1, 'Color', 'k');
        plot(peg2_pi_err_r, ':', 'LineWidth',1, 'Color', 'k');
        setup_subplot_axes();
        title('CPI inflation');
        ylabel('Annualized percentage points');
    % tau
    subplot(2,3,4)
        plot(optimal_results.oo_.irfs.tau_err_r(1:20), 'Linewidth', 1, 'Color', 'k');
        hold on
        plot(ditr_results.oo_.irfs.tau_err_r(1:20), '--', 'LineWidth',1, 'Color', 'k');
        plot(citr_results.oo_.irfs.tau_err_r(1:20), '-.', 'LineWidth',1, 'Color', 'k');
        plot(peg2_results.oo_.irfs.tau_err_r(1:20), ':', 'LineWidth',1, 'Color', 'k');
        setup_subplot_axes();
        title('Terms of trade');
        ylabel('Percentage deviations from steady state');
    % i
    subplot(2,3,5)
        plot(optimal_i_err_r, 'Linewidth', 1, 'Color', 'k');
        hold on
        plot(ditr_i_err_r, '--', 'LineWidth',1, 'Color', 'k');
        plot(citr_i_err_r, '-.', 'LineWidth',1, 'Color', 'k');
        plot(peg2_i_err_r, ':', 'LineWidth',1, 'Color', 'k');
        setup_subplot_axes();
        title('Nominal interest rate');
        ylabel('Annualized percentage points');
    % delta_e
    subplot(2,3,6)
        plot(optimal_results.oo_.irfs.delta_e_err_r(1:20), 'Linewidth', 1, 'Color', 'k');
        hold on
        plot(ditr_results.oo_.irfs.delta_e_err_r(1:20), '--', 'LineWidth',1, 'Color', 'k');
        plot(citr_results.oo_.irfs.delta_e_err_r(1:20), '-.', 'LineWidth',1, 'Color', 'k');
        plot(peg2_results.oo_.irfs.delta_e_err_r(1:20), ':', 'LineWidth',1, 'Color', 'k');
        setup_subplot_axes();
        title('Change in nominal exchange rate');
        ylabel('Percentage deviation from steady state');
    %{
    % Add a global legend using the plots from the first subplot
        lgd = legend([optimal, ditr, citr, peg2], {'Optimal policy', 'Domestic inflation targeting', 'CPI inflation targeting', 'Exchange rate peg2'});
        set(lgd, 'location', 'south', 'orientation', 'horizontal', 'fontsize', 12);
    % Manually adjust the position to be at the bottom center of the figure
        legendPosition = [0.25, 0.01, 0.5, 0.05];
        set(lgd, 'Position', legendPosition);
        %}
% Saving the graph
saveas(gcf, 'Technology shock.jpg');




% annualise inflation and convert to percentage points
optimal_pih_err_z = (exp(optimal_results.oo_.irfs.pih_err_z(1:20)) - 1) * 4;
ditr_pih_err_z = (exp(ditr_results.oo_.irfs.pih_err_z(1:20)) - 1) * 4;
citr_pih_err_z = (exp(citr_results.oo_.irfs.pih_err_z(1:20)) - 1) * 4;
peg2_pih_err_z = (exp(peg2_results.oo_.irfs.pih_err_z(1:20)) - 1) * 4;

optimal_pi_err_z = (exp(optimal_results.oo_.irfs.pi_err_z(1:20)) - 1) * 4;
ditr_pi_err_z = (exp(ditr_results.oo_.irfs.pi_err_z(1:20)) - 1) * 4;
citr_pi_err_z = (exp(citr_results.oo_.irfs.pi_err_z(1:20)) - 1) * 4;
peg2_pi_err_z = (exp(peg2_results.oo_.irfs.pi_err_z(1:20)) - 1) * 4;  

optimal_i_err_z = (exp(optimal_results.oo_.irfs.i_err_z(1:20)) - 1) * 4;
ditr_i_err_z = (exp(ditr_results.oo_.irfs.i_err_z(1:20)) - 1) * 4;
citr_i_err_z = (exp(citr_results.oo_.irfs.i_err_z(1:20)) - 1) * 4;
peg2_i_err_z = (exp(peg2_results.oo_.irfs.i_err_z(1:20)) - 1) * 4;  

% Plotting the demand shock graph
figure('Position', [100, 100, 1200, 800]);
    % pih IRFs
    subplot(2,3,1)
        optimal = plot(optimal_pih_err_z, 'Linewidth', 1, 'Color', 'k');
        hold on
        ditr = plot(ditr_pih_err_z, '--', 'LineWidth',1, 'Color', 'k');
        citr = plot(citr_pih_err_z, '-.', 'LineWidth',1, 'Color', 'k');
        peg2 = plot(peg2_pih_err_z, ':', 'LineWidth',1, 'Color', 'k');
        setup_subplot_axes();
        title('Domestic Inflation');
        ylabel('Annualized percentage points');
    % x IRFs
    subplot(2,3,2)
        plot(optimal_results.oo_.irfs.x_err_z(1:20), 'Linewidth', 1, 'Color', 'k');
        hold on
        plot(ditr_results.oo_.irfs.x_err_z(1:20), '--', 'LineWidth',1, 'Color', 'k');
        plot(citr_results.oo_.irfs.x_err_z(1:20), '-.', 'LineWidth',1, 'Color', 'k');
        plot(peg2_results.oo_.irfs.x_err_z(1:20), ':', 'LineWidth',1, 'Color', 'k');
        setup_subplot_axes();
        title('Output gap');
        ylabel('Percentage deviations from steady state');
    % pi
       subplot(2,3,3)
        plot(optimal_pi_err_z, 'Linewidth', 1, 'Color', 'k');
        hold on
        plot(ditr_pi_err_z, '--', 'LineWidth',1, 'Color', 'k');
        plot(citr_pi_err_z, '-.', 'LineWidth',1, 'Color', 'k');
        plot(peg2_pi_err_z, ':', 'LineWidth',1, 'Color', 'k');
        setup_subplot_axes();
        title('CPI inflation');
        ylabel('Annualized percentage points');
    % tau
    subplot(2,3,4)
        plot(optimal_results.oo_.irfs.tau_err_z(1:20), 'Linewidth', 1, 'Color', 'k');
        hold on
        plot(ditr_results.oo_.irfs.tau_err_z(1:20), '--', 'LineWidth',1, 'Color', 'k');
        plot(citr_results.oo_.irfs.tau_err_z(1:20), '-.', 'LineWidth',1, 'Color', 'k');
        plot(peg2_results.oo_.irfs.tau_err_z(1:20), ':', 'LineWidth',1, 'Color', 'k');
        setup_subplot_axes();
        title('Terms of trade');
        ylabel('Percentage deviations from steady state');
    % i
    subplot(2,3,5)
        plot(optimal_i_err_z, 'Linewidth', 1, 'Color', 'k');
        hold on
        plot(ditr_i_err_z, '--', 'LineWidth',1, 'Color', 'k');
        plot(citr_i_err_z, '-.', 'LineWidth',1, 'Color', 'k');
        plot(peg2_i_err_z, ':', 'LineWidth',1, 'Color', 'k');
        setup_subplot_axes();
        title('Nominal interest rate');
        ylabel('Annualized percentage points');
    % delta_e
    subplot(2,3,6)
        plot(optimal_results.oo_.irfs.delta_e_err_z(1:20), 'Linewidth', 1, 'Color', 'k');
        hold on
        plot(ditr_results.oo_.irfs.delta_e_err_z(1:20), '--', 'LineWidth',1, 'Color', 'k');
        plot(citr_results.oo_.irfs.delta_e_err_z(1:20), '-.', 'LineWidth',1, 'Color', 'k');
        plot(peg2_results.oo_.irfs.delta_e_err_z(1:20), ':', 'LineWidth',1, 'Color', 'k');
        setup_subplot_axes();
        title('Change in nominal exchange rate');
        ylabel('Percentage deviation from steady state');
    %{
    % Add a global legend using the plots from the first subplot
        lgd = legend([optimal, ditr, citr, peg2], {'Optimal policy', 'Domestic inflation targeting', 'CPI inflation targeting', 'Exchange rate peg2'});
        set(lgd, 'location', 'south', 'orientation', 'horizontal', 'fontsize', 12);
    % Manually adjust the position to be at the bottom center of the figure
        legendPosition = [0.25, 0.01, 0.5, 0.05];
        set(lgd, 'Position', legendPosition);
        %}
% Saving the graph
saveas(gcf, 'Demand shock.jpg');





% annualise inflation and convert to percentage points
optimal_pih_err_istar = (exp(optimal_results.oo_.irfs.pih_err_istar(1:20)) - 1) * 4;
ditr_pih_err_istar = (exp(ditr_results.oo_.irfs.pih_err_istar(1:20)) - 1) * 4;
citr_pih_err_istar = (exp(citr_results.oo_.irfs.pih_err_istar(1:20)) - 1) * 4;
peg2_pih_err_istar = (exp(peg2_results.oo_.irfs.pih_err_istar(1:20)) - 1) * 4;

optimal_pi_err_istar = (exp(optimal_results.oo_.irfs.pi_err_istar(1:20)) - 1) * 4;
ditr_pi_err_istar = (exp(ditr_results.oo_.irfs.pi_err_istar(1:20)) - 1) * 4;
citr_pi_err_istar = (exp(citr_results.oo_.irfs.pi_err_istar(1:20)) - 1) * 4;
peg2_pi_err_istar = (exp(peg2_results.oo_.irfs.pi_err_istar(1:20)) - 1) * 4; 

optimal_i_err_istar = (exp(optimal_results.oo_.irfs.i_err_istar(1:20)) - 1) * 4;
ditr_i_err_istar = (exp(ditr_results.oo_.irfs.i_err_istar(1:20)) - 1) * 4;
citr_i_err_istar = (exp(citr_results.oo_.irfs.i_err_istar(1:20)) - 1) * 4;
peg2_i_err_istar = (exp(peg2_results.oo_.irfs.i_err_istar(1:20)) - 1) * 4;  

% Plotting the foreign shock graph
figure('Position', [100, 100, 1200, 800]);
    % pih IRFs
    subplot(2,3,1)
        optimal = plot(optimal_pih_err_istar, 'Linewidth', 1, 'Color', 'k');
        hold on
        ditr = plot(ditr_pih_err_istar, '--', 'LineWidth',1, 'Color', 'k');
        citr = plot(citr_pih_err_istar, '-.', 'LineWidth',1, 'Color', 'k');
        peg2 = plot(peg2_pih_err_istar, ':', 'LineWidth',1, 'Color', 'k');
        setup_subplot_axes();
        title('Domestic Inflation');
        ylabel('Annualized percentage points');
    % x IRFs
    subplot(2,3,2)
        plot(optimal_results.oo_.irfs.x_err_istar(1:20), 'Linewidth', 1, 'Color', 'k');
        hold on
        plot(ditr_results.oo_.irfs.x_err_istar(1:20), '--', 'LineWidth',1, 'Color', 'k');
        plot(citr_results.oo_.irfs.x_err_istar(1:20), '-.', 'LineWidth',1, 'Color', 'k');
        plot(peg2_results.oo_.irfs.x_err_istar(1:20), ':', 'LineWidth',1, 'Color', 'k');
        setup_subplot_axes();
        title('Output gap');
        ylabel('Percentage deviations from steady state');
    % pi
       subplot(2,3,3)
        plot(optimal_pi_err_istar, 'Linewidth', 1, 'Color', 'k');
        hold on
        plot(ditr_pi_err_istar, '--', 'LineWidth',1, 'Color', 'k');
        plot(citr_pi_err_istar, '-.', 'LineWidth',1, 'Color', 'k');
        plot(peg2_pi_err_istar, ':', 'LineWidth',1, 'Color', 'k');
        setup_subplot_axes();
        title('CPI inflation');
        ylabel('Annualized percentage points');
    % tau
    subplot(2,3,4)
        plot(optimal_results.oo_.irfs.tau_err_istar(1:20), 'Linewidth', 1, 'Color', 'k');
        hold on
        plot(ditr_results.oo_.irfs.tau_err_istar(1:20), '--', 'LineWidth',1, 'Color', 'k');
        plot(citr_results.oo_.irfs.tau_err_istar(1:20), '-.', 'LineWidth',1, 'Color', 'k');
        plot(peg2_results.oo_.irfs.tau_err_istar(1:20), ':', 'LineWidth',1, 'Color', 'k');
        setup_subplot_axes();
        title('Terms of trade');
        ylabel('Percentage deviations from steady state');
    % i
    subplot(2,3,5)
        plot(optimal_i_err_istar, 'Linewidth', 1, 'Color', 'k');
        hold on
        plot(ditr_i_err_istar, '--', 'LineWidth',1, 'Color', 'k');
        plot(citr_i_err_istar, '-.', 'LineWidth',1, 'Color', 'k');
        plot(peg2_i_err_istar, ':', 'LineWidth',1, 'Color', 'k');
        setup_subplot_axes();
        title('Nominal interest rate');
        ylabel('Annualized percentage points');
    % delta_e
    subplot(2,3,6)
        plot(optimal_results.oo_.irfs.delta_e_err_istar(1:20), 'Linewidth', 1, 'Color', 'k');
        hold on
        plot(ditr_results.oo_.irfs.delta_e_err_istar(1:20), '--', 'LineWidth',1, 'Color', 'k');
        plot(citr_results.oo_.irfs.delta_e_err_istar(1:20), '-.', 'LineWidth',1, 'Color', 'k');
        plot(peg2_results.oo_.irfs.delta_e_err_istar(1:20), ':', 'LineWidth',1, 'Color', 'k');
        setup_subplot_axes();
        title('Change in nominal exchange rate');
        ylabel('Percentage deviation from steady state');
    %{
    % Add a global legend using the plots from the first subplot
        lgd = legend([optimal, ditr, citr, peg2], {'Optimal policy', 'Domestic inflation targeting', 'CPI inflation targeting', 'Exchange rate peg2'});
        set(lgd, 'location', 'south', 'orientation', 'horizontal', 'fontsize', 12);
    % Manually adjust the position to be at the bottom center of the figure
        legendPosition = [0.25, 0.01, 0.5, 0.05];
        set(lgd, 'Position', legendPosition);
        %}
% Saving the graph
saveas(gcf, 'Foreign shock.jpg');


%----------------------------------------------------------------
% 3. Welfare Loss Calculation
%----------------------------------------------------------------

% cost-push shock
loss_optimal_u = calculate_welfare_loss(optimal_results.oo_.irfs.x_err_u, optimal_results.oo_.irfs.pih_err_u);
loss_ditr_u = calculate_welfare_loss(ditr_results.oo_.irfs.x_err_u, ditr_results.oo_.irfs.pih_err_u);
loss_citr_u = calculate_welfare_loss(citr_results.oo_.irfs.x_err_u, citr_results.oo_.irfs.pih_err_u);
loss_peg1_u = calculate_welfare_loss(peg1_results.oo_.irfs.x_err_u, peg1_results.oo_.irfs.pih_err_u);
loss_peg2_u = calculate_welfare_loss(peg2_results.oo_.irfs.x_err_u, peg2_results.oo_.irfs.pih_err_u);

% shock to r
loss_optimal_r = calculate_welfare_loss(optimal_results.oo_.irfs.x_err_r, optimal_results.oo_.irfs.pih_err_r);
loss_ditr_r = calculate_welfare_loss(ditr_results.oo_.irfs.x_err_r, ditr_results.oo_.irfs.pih_err_r);
loss_citr_r = calculate_welfare_loss(citr_results.oo_.irfs.x_err_r, citr_results.oo_.irfs.pih_err_r);
loss_peg1_r = calculate_welfare_loss(peg1_results.oo_.irfs.x_err_r, peg1_results.oo_.irfs.pih_err_r);
loss_peg2_r = calculate_welfare_loss(peg2_results.oo_.irfs.x_err_r, peg2_results.oo_.irfs.pih_err_r);

% shock to z
loss_optimal_z = calculate_welfare_loss(optimal_results.oo_.irfs.x_err_z, optimal_results.oo_.irfs.pih_err_z);
loss_ditr_z = calculate_welfare_loss(ditr_results.oo_.irfs.x_err_z, ditr_results.oo_.irfs.pih_err_z);
loss_citr_z = calculate_welfare_loss(citr_results.oo_.irfs.x_err_z, citr_results.oo_.irfs.pih_err_z);
loss_peg1_z = calculate_welfare_loss(peg1_results.oo_.irfs.x_err_z, peg1_results.oo_.irfs.pih_err_z);
loss_peg2_z = calculate_welfare_loss(peg2_results.oo_.irfs.x_err_z, peg2_results.oo_.irfs.pih_err_z);

% shock to i
loss_optimal_istar = calculate_welfare_loss(optimal_results.oo_.irfs.x_err_istar, optimal_results.oo_.irfs.pih_err_istar);
loss_ditr_istar = calculate_welfare_loss(ditr_results.oo_.irfs.x_err_istar, ditr_results.oo_.irfs.pih_err_istar);
loss_citr_istar = calculate_welfare_loss(citr_results.oo_.irfs.x_err_istar, citr_results.oo_.irfs.pih_err_istar);
loss_peg1_istar = calculate_welfare_loss(peg1_results.oo_.irfs.x_err_istar, peg1_results.oo_.irfs.pih_err_istar);
loss_peg2_istar = calculate_welfare_loss(peg2_results.oo_.irfs.x_err_istar, peg2_results.oo_.irfs.pih_err_istar);

% create table

loss_table = {"Shocks", "Optimal Policy", "Domestic Inflation Targeting", "CPI Targeting", "Currency peg1", "Currency peg2", 
              "Cost-push shock (u)", loss_optimal_u, loss_ditr_u, loss_citr_u, loss_peg1_u, loss_peg2_u,
              "Technology shock (r^n)", loss_optimal_r, loss_ditr_r, loss_citr_r, loss_peg1_r, loss_peg2_r,
              "Demand shock (z)", loss_optimal_z, loss_ditr_z, loss_citr_z, loss_peg1_z, loss_peg2_z,
              "Foreign shock (i*)", loss_optimal_istar, loss_ditr_istar, loss_citr_istar, loss_peg1_istar, loss_peg2_istar
              };
              
dataframe(loss_table);







