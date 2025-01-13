 

%----------------------------------------------------------------
%
% Title: International Macro-Finance Problem Set 3, main file
% Author: ---
% Date: 25/11/2023
% Description: Open economy heterogeneous agent model
%
%----------------------------------------------------------------


%----------------------------------------------------------------
%% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------

close all;
clear all;

cd '/home/rinto/Desktop/International Macro/PS3';

%----------------------------------------------------------------
%% 1. Loading results
%----------------------------------------------------------------

load("PS3Q4.mat");

eta = par.eta;
grid_b = grid.b_fine';

r0Q4 = guess.r0;
ciQ4 = policy.ci;
biQ4 = policy.bi;
G0Q4 = G0;
liQ4 = policy.li;
yQ4 = y;
totQ4 = guess.ph_pf;
tauQ4 = par.tau;
gQ4 = par.g;
bgQ4 = bg;
b_starQ4 = par.b_star;

clearvars -except grid_b eta *Q4


load("PS3Q5.mat");

r0Q5 = guess.r0;
ciQ5 = policy.ci;
biQ5 = policy.bi;
G0Q5 = G0;
liQ5 = policy.li;
yQ5 = y;
totQ5 = guess.ph_pf;
tauQ5 = guess.tau;
gQ5 = par.g;
bgQ5 = par.bg;
b_starQ5 = b_star;

clearvars -except grid_b eta *Q4 *Q5


load("PS3Q6.mat");

r0Q6 = guess.r0;
ciQ6 = policy.ci;
biQ6 = policy.bi;
G0Q6 = G0;
liQ6 = policy.li;
yQ6 = y;
totQ6 = guess.ph_pf;
tauQ6 = par.tau;
gQ6 = g;
bgQ6 = par.bg;
b_starQ6 = b_star;

clearvars -except grid_b eta pi *Q4 *Q5 *Q6

%----------------------------------------------------------------
%% 2. Comparative statics
%----------------------------------------------------------------

G0Q41 = G0Q4 * pi';
G0Q51 = G0Q5 * pi';
G0Q61 = G0Q6 * pi';



figure
    plot(grid_b, G0Q41, '-','LineWidth', 2.5)
    hold on
    plot(grid_b, G0Q51, '--', 'LineWidth', 2.5)
    plot(grid_b, G0Q61, ':', 'LineWidth', 2.5)
    xlabel('state asset')
    ylabel('distribution')
    legend('benchmark', 'endogenous tax', 'endogenous govt spending', 'Location', 'northwest' )
       

saveas(gcf, 'Distribution_Q4.jpg');


utilQ4 = log(ciQ4 - liQ4.^(1 + eta)/ (1 + eta)); 
utilQ41 = utilQ4 * pi';

utilQ5 = log(ciQ5 - liQ5.^(1 + eta)/ (1 + eta)); 
utilQ51 = utilQ5 * pi';

utilQ6 = log(ciQ6 - liQ6.^(1 + eta)/ (1 + eta)); 
utilQ61 = utilQ6 * pi';


figure
    plot(grid_b, utilQ41, '-','LineWidth', 2.5)
    hold on
    plot(grid_b, utilQ51, '--', 'LineWidth', 2.5)
    plot(grid_b, utilQ61, ':', 'LineWidth', 2.5)
    % title('Utility: comparative statics')
    xlabel('state asset')
    ylabel('utility')
    legend('benchmark', 'endogenous tax', 'endogenous govt spending', 'Location', 'southeast' )

saveas(gcf, 'Utility_Q5Q6.jpg');

% %%
% figure
%     plot(grid_b, sum(ciQ4 .* G0Q4, 2), '-','LineWidth', 2.5)
%     hold on
%     plot(grid_b, sum(ciQ5 .* G0Q5, 2), '--', 'LineWidth', 2.5)
%     plot(grid_b, sum(ciQ6 .* G0Q6, 2), ':', 'LineWidth', 2.5)
%     title('Consumption Policy Function')
%     xlabel('state asset')
%     ylabel('consumption')
%     legend('benchmark', 'endogenous tax', 'endogenous govt spending')
% %%



figure
    plot(grid_b, ciQ4(:, 1), '-','LineWidth', 2.5)
    hold on
    plot(grid_b, ciQ5(:, 1), '--', 'LineWidth', 2.5)
    plot(grid_b, ciQ6(:, 1), ':', 'LineWidth', 2.5)
    % title('Consumption Policy Function')
    xlabel('state asset')
    ylabel('consumption')
    legend('benchmark', 'endogenous tax', 'endogenous govt spending', 'Location', 'southeast' )

saveas(gcf, 'Consumption_policy_Q4Q5Q6.jpg');



figure
    plot(grid_b, biQ4(:, 1), '-','LineWidth', 2.5)
    hold on
    plot(grid_b, biQ5(:, 1), '--', 'LineWidth', 2.5)
    plot(grid_b, biQ6(:, 1), ':', 'LineWidth', 2.5)
    % title('Lending Policy Function')
    xlabel('state asset')
    ylabel('savings')
    legend('benchmark', 'endogenous tax', 'endogenous govt spending', 'Location', 'southeast')

saveas(gcf, 'Debt_policy_Q4Q5Q6.jpg');



