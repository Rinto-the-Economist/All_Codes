%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'tanbfp2';
M_.dynare_version = '4.6.0';
oo_.dynare_version = '4.6.0';
options_.dynare_version = '4.6.0';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('tanbfp2.log');
M_.exo_names = cell(1,1);
M_.exo_names_tex = cell(1,1);
M_.exo_names_long = cell(1,1);
M_.exo_names(1) = {'err_yo'};
M_.exo_names_tex(1) = {'err\_yo'};
M_.exo_names_long(1) = {'err_yo'};
M_.endo_names = cell(19,1);
M_.endo_names_tex = cell(19,1);
M_.endo_names_long = cell(19,1);
M_.endo_names(1) = {'c_aho'};
M_.endo_names_tex(1) = {'c\_aho'};
M_.endo_names_long(1) = {'c_aho'};
M_.endo_names(2) = {'c_aro'};
M_.endo_names_tex(2) = {'c\_aro'};
M_.endo_names_long(2) = {'c_aro'};
M_.endo_names(3) = {'c_bo'};
M_.endo_names_tex(3) = {'c\_bo'};
M_.endo_names_long(3) = {'c_bo'};
M_.endo_names(4) = {'c_aht'};
M_.endo_names_tex(4) = {'c\_aht'};
M_.endo_names_long(4) = {'c_aht'};
M_.endo_names(5) = {'c_art'};
M_.endo_names_tex(5) = {'c\_art'};
M_.endo_names_long(5) = {'c_art'};
M_.endo_names(6) = {'c_bt'};
M_.endo_names_tex(6) = {'c\_bt'};
M_.endo_names_long(6) = {'c_bt'};
M_.endo_names(7) = {'l_h'};
M_.endo_names_tex(7) = {'l\_h'};
M_.endo_names_long(7) = {'l_h'};
M_.endo_names(8) = {'l_r'};
M_.endo_names_tex(8) = {'l\_r'};
M_.endo_names_long(8) = {'l_r'};
M_.endo_names(9) = {'l'};
M_.endo_names_tex(9) = {'l'};
M_.endo_names_long(9) = {'l'};
M_.endo_names(10) = {'y_t'};
M_.endo_names_tex(10) = {'y\_t'};
M_.endo_names_long(10) = {'y_t'};
M_.endo_names(11) = {'y_o'};
M_.endo_names_tex(11) = {'y\_o'};
M_.endo_names_long(11) = {'y_o'};
M_.endo_names(12) = {'p_t'};
M_.endo_names_tex(12) = {'p\_t'};
M_.endo_names_long(12) = {'p_t'};
M_.endo_names(13) = {'w'};
M_.endo_names_tex(13) = {'w'};
M_.endo_names_long(13) = {'w'};
M_.endo_names(14) = {'pi'};
M_.endo_names_tex(14) = {'pi'};
M_.endo_names_long(14) = {'pi'};
M_.endo_names(15) = {'n_a'};
M_.endo_names_tex(15) = {'n\_a'};
M_.endo_names_long(15) = {'n_a'};
M_.endo_names(16) = {'n_b'};
M_.endo_names_tex(16) = {'n\_b'};
M_.endo_names_long(16) = {'n_b'};
M_.endo_names(17) = {'r_star'};
M_.endo_names_tex(17) = {'r\_star'};
M_.endo_names_long(17) = {'r_star'};
M_.endo_names(18) = {'pi_r'};
M_.endo_names_tex(18) = {'pi\_r'};
M_.endo_names_long(18) = {'pi_r'};
M_.endo_names(19) = {'pi_h'};
M_.endo_names_tex(19) = {'pi\_h'};
M_.endo_names_long(19) = {'pi_h'};
M_.endo_partitions = struct();
M_.param_names = cell(9,1);
M_.param_names_tex = cell(9,1);
M_.param_names_long = cell(9,1);
M_.param_names(1) = {'alpha'};
M_.param_names_tex(1) = {'alpha'};
M_.param_names_long(1) = {'alpha'};
M_.param_names(2) = {'beta'};
M_.param_names_tex(2) = {'beta'};
M_.param_names_long(2) = {'beta'};
M_.param_names(3) = {'psi'};
M_.param_names_tex(3) = {'psi'};
M_.param_names_long(3) = {'psi'};
M_.param_names(4) = {'eta'};
M_.param_names_tex(4) = {'eta'};
M_.param_names_long(4) = {'eta'};
M_.param_names(5) = {'s_t'};
M_.param_names_tex(5) = {'s\_t'};
M_.param_names_long(5) = {'s_t'};
M_.param_names(6) = {'theta'};
M_.param_names_tex(6) = {'theta'};
M_.param_names_long(6) = {'theta'};
M_.param_names(7) = {'rho'};
M_.param_names_tex(7) = {'rho'};
M_.param_names_long(7) = {'rho'};
M_.param_names(8) = {'gamma'};
M_.param_names_tex(8) = {'gamma'};
M_.param_names_long(8) = {'gamma'};
M_.param_names(9) = {'chi'};
M_.param_names_tex(9) = {'chi'};
M_.param_names_long(9) = {'chi'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 19;
M_.param_nbr = 9;
M_.orig_endo_nbr = 19;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = true;
M_.det_shocks = [];
options_.linear = false;
options_.block = false;
options_.bytecode = false;
options_.use_dll = false;
options_.linear_decomposition = false;
M_.orig_eq_nbr = 19;
M_.eq_nbr = 19;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 4 0;
 0 5 23;
 0 6 24;
 0 7 0;
 0 8 25;
 0 9 26;
 0 10 0;
 0 11 0;
 0 12 0;
 0 13 0;
 1 14 0;
 0 15 0;
 0 16 0;
 0 17 0;
 2 18 0;
 3 19 0;
 0 20 0;
 0 21 0;
 0 22 0;]';
M_.nstatic = 12;
M_.nfwrd   = 4;
M_.npred   = 3;
M_.nboth   = 0;
M_.nsfwrd   = 4;
M_.nspred   = 3;
M_.ndynamic   = 7;
M_.dynamic_tmp_nbr = [20; 5; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , '1' ;
  2 , 'name' , '2' ;
  3 , 'name' , '3' ;
  4 , 'name' , '4' ;
  5 , 'name' , '5' ;
  6 , 'name' , '6' ;
  7 , 'name' , '7' ;
  8 , 'name' , '8' ;
  9 , 'name' , '9' ;
  10 , 'name' , '10' ;
  11 , 'name' , '11' ;
  12 , 'name' , '12' ;
  13 , 'name' , '13' ;
  14 , 'name' , '14' ;
  15 , 'name' , '15' ;
  16 , 'name' , '16' ;
  17 , 'name' , '17' ;
  18 , 'name' , '18' ;
  19 , 'name' , '19' ;
};
M_.mapping.c_aho.eqidx = [1 6 8 16 ];
M_.mapping.c_aro.eqidx = [2 4 7 9 16 ];
M_.mapping.c_bo.eqidx = [3 5 10 16 ];
M_.mapping.c_aht.eqidx = [1 6 8 15 ];
M_.mapping.c_art.eqidx = [2 4 7 9 15 ];
M_.mapping.c_bt.eqidx = [3 5 10 15 ];
M_.mapping.l_h.eqidx = [6 8 17 ];
M_.mapping.l_r.eqidx = [7 9 17 ];
M_.mapping.l.eqidx = [11 12 13 17 ];
M_.mapping.y_t.eqidx = [11 12 13 15 ];
M_.mapping.y_o.eqidx = [10 16 19 ];
M_.mapping.p_t.eqidx = [1 2 3 8 9 10 11 12 ];
M_.mapping.w.eqidx = [6 7 8 9 11 12 ];
M_.mapping.pi.eqidx = [12 14 ];
M_.mapping.n_a.eqidx = [9 18 ];
M_.mapping.n_b.eqidx = [10 18 ];
M_.mapping.r_star.eqidx = [4 5 9 10 ];
M_.mapping.pi_r.eqidx = [9 14 ];
M_.mapping.pi_h.eqidx = [8 14 ];
M_.mapping.err_yo.eqidx = [19 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [11 15 16 ];
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(19, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(9, 1);
M_.endo_trends = struct('deflator', cell(19, 1), 'log_deflator', cell(19, 1), 'growth_factor', cell(19, 1), 'log_growth_factor', cell(19, 1));
M_.NNZDerivatives = [79; -1; -1; ];
M_.static_tmp_nbr = [14; 7; 0; 0; ];
close all;
load parameters;
set_param_value('alpha'   ,par.alpha);
set_param_value('beta'    ,par.beta);
set_param_value('psi'     ,par.psi); 
set_param_value('eta'     ,par.eta);
set_param_value('s_t'   ,par.s_t);
set_param_value('theta'   ,par.theta);
set_param_value('rho'     ,par.rho); 
set_param_value('gamma'   ,par.gamma);
set_param_value('chi'     ,par.chi);
M_.params(9) = .7;
chi = M_.params(9);
M_.params(5) = .78;
s_t = M_.params(5);
M_.params(6) = .75;
theta = M_.params(6);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(8) = .22;
oo_.steady_state(7) = .22;
oo_.steady_state(2) = .46;
oo_.steady_state(1) = .46;
oo_.steady_state(9) = M_.params(9)*oo_.steady_state(8)+(1-M_.params(9))*oo_.steady_state(7);
oo_.steady_state(10) = oo_.steady_state(9)^(1-M_.params(1));
oo_.steady_state(12) = 16.75/oo_.steady_state(10);
oo_.steady_state(5) = M_.params(5)^M_.params(4)*oo_.steady_state(2)/(oo_.steady_state(12)^M_.params(4)*(1-M_.params(5))^M_.params(4));
oo_.steady_state(4) = M_.params(5)^M_.params(4)*oo_.steady_state(1)/(oo_.steady_state(12)^M_.params(4)*(1-M_.params(5))^M_.params(4));
oo_.steady_state(6) = oo_.steady_state(10)-M_.params(9)*oo_.steady_state(5)-(1-M_.params(9))*oo_.steady_state(4);
oo_.steady_state(11) = M_.params(8)/(1-M_.params(7));
oo_.steady_state(3) = oo_.steady_state(11)-M_.params(9)*oo_.steady_state(2)-(1-M_.params(9))*oo_.steady_state(1);
oo_.steady_state(13) = oo_.steady_state(12)*(1-M_.params(1))*(1-M_.params(6))*oo_.steady_state(9)^((1-M_.params(1))*(1-M_.params(6))-1)*oo_.steady_state(10)^M_.params(6);
oo_.steady_state(14) = oo_.steady_state(10)*oo_.steady_state(12)-oo_.steady_state(9)*oo_.steady_state(13);
oo_.steady_state(18) = oo_.steady_state(14);
oo_.steady_state(19) = (oo_.steady_state(14)-M_.params(9)*oo_.steady_state(18))/(1-M_.params(9));
oo_.steady_state(17) = 1/M_.params(2);
oo_.steady_state(15) = oo_.steady_state(17)/(oo_.steady_state(17)-1)*(oo_.steady_state(2)+oo_.steady_state(12)*oo_.steady_state(5)-oo_.steady_state(9)*oo_.steady_state(13)-oo_.steady_state(18));
oo_.steady_state(16) = (-M_.params(9))*oo_.steady_state(15);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
option_.qz_zero_threshold = 1e-10;
options_.steady.maxit = 1000;
steady;
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
options_.impulse_responses.plot_threshold = 0;
options_.irf = 100;
options_.order = 1;
var_list_ = {'c_aho';'c_aro';'c_bo';'c_aht';'c_art';'c_bt';'l_h';'l_r';'l';'y_t';'y_o';'p_t';'w';'pi';'n_a';'n_b';'r_star'};
[info, oo_, options_] = stoch_simul(M_, options_, oo_, var_list_);
save('tanbfp2_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('tanbfp2_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('tanbfp2_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('tanbfp2_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('tanbfp2_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('tanbfp2_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('tanbfp2_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
