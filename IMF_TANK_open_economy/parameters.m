
%----------------------------------------------------------------
%
% Title: International Macro-Finance Problem Set 4, parameter file
% Author: ---
% Date: 10/01/2024
% Description: Parameter file for the final problem set
%
%----------------------------------------------------------------


%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------

close all;
clear all;

%----------------------------------------------------------------
% 1. Defining parameters
%----------------------------------------------------------------


% key moments to target:
% y_o	= 12.1 * 365 * 90 * 10^(-6) = .4 Saudi oil production in 2022, tn euro 
% c_ao	= .46 EU import of oil from Saudi Arabia in 2022, tn euro
% l	= .22; average weekly work hours in the EU (37.5 / (24 * 7))
% y_t * p_t	= 16.75 EU GDP in 2022, tn USD

% this implies:
% y_t	= l^(1 - alpha) = .35 with alpha = .3
% p_t	= 16.75 / .35 = 47.86


par.alpha	= .3; % income share of capital 
par.beta	= .99;
par.psi	= 1.5; % elasticity of labour supply, normally between 1 and 2 (see Blundell et al. 2000) 
par.phi	= 10; % strength of the nominal rigidity
par.eta	= .4; % elasticity of substitution between the tradeable good and oil
par.s_t	= .75; % home bias towards tradeable in both countries
par.s_art	= .78; %  home bias towards tradeable for ricardians
par.s_aht	= .9; % home bias towards tradeable for htms
par.s_bt	= .8; % home bias towards tradeable in country b
par.theta	= .4; % elasticity of substitution between goods in the tradeable sector
par.rho	= .9; % persistence of shock
par.gamma	= .1; % mean oil endowment of country b (y_bbar = gamma / (1 - rho))
par.chi	= .8; % proportion of ricardian HHs in country a
