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
M_.fname = 'ranbfp_test';
M_.dynare_version = '4.6.0';
oo_.dynare_version = '4.6.0';
options_.dynare_version = '4.6.0';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('ranbfp_test.log');
M_.exo_names = cell(1,1);
M_.exo_names_tex = cell(1,1);
M_.exo_names_long = cell(1,1);
M_.exo_names(1) = {'err_yo'};
M_.exo_names_tex(1) = {'err\_yo'};
M_.exo_names_long(1) = {'err_yo'};
M_.endo_names = cell(13,1);
M_.endo_names_tex = cell(13,1);
M_.endo_names_long = cell(13,1);
M_.endo_names(1) = {'c_ao'};
M_.endo_names_tex(1) = {'c\_ao'};
M_.endo_names_long(1) = {'c_ao'};
M_.endo_names(2) = {'c_bo'};
M_.endo_names_tex(2) = {'c\_bo'};
M_.endo_names_long(2) = {'c_bo'};
M_.endo_names(3) = {'c_at'};
M_.endo_names_tex(3) = {'c\_at'};
M_.endo_names_long(3) = {'c_at'};
M_.endo_names(4) = {'c_bt'};
M_.endo_names_tex(4) = {'c\_bt'};
M_.endo_names_long(4) = {'c_bt'};
M_.endo_names(5) = {'l'};
M_.endo_names_tex(5) = {'l'};
M_.endo_names_long(5) = {'l'};
M_.endo_names(6) = {'y_t'};
M_.endo_names_tex(6) = {'y\_t'};
M_.endo_names_long(6) = {'y_t'};
M_.endo_names(7) = {'y_o'};
M_.endo_names_tex(7) = {'y\_o'};
M_.endo_names_long(7) = {'y_o'};
M_.endo_names(8) = {'p_t'};
M_.endo_names_tex(8) = {'p\_t'};
M_.endo_names_long(8) = {'p_t'};
M_.endo_names(9) = {'w'};
M_.endo_names_tex(9) = {'w'};
M_.endo_names_long(9) = {'w'};
M_.endo_names(10) = {'pi'};
M_.endo_names_tex(10) = {'pi'};
M_.endo_names_long(10) = {'pi'};
M_.endo_names(11) = {'n_a'};
M_.endo_names_tex(11) = {'n\_a'};
M_.endo_names_long(11) = {'n_a'};
M_.endo_names(12) = {'n_b'};
M_.endo_names_tex(12) = {'n\_b'};
M_.endo_names_long(12) = {'n_b'};
M_.endo_names(13) = {'r_star'};
M_.endo_names_tex(13) = {'r\_star'};
M_.endo_names_long(13) = {'r_star'};
M_.endo_partitions = struct();
M_.param_names = cell(8,1);
M_.param_names_tex = cell(8,1);
M_.param_names_long = cell(8,1);
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
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 13;
M_.param_nbr = 8;
M_.orig_endo_nbr = 13;
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
M_.orig_eq_nbr = 13;
M_.eq_nbr = 13;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./+' M_.fname '/set_auxiliary_variables.m'], 'file') == 2;
M_.epilogue_names = {};
M_.epilogue_var_list_ = {};
M_.orig_maximum_endo_lag = 1;
M_.orig_maximum_endo_lead = 0;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 0;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 1 9;
 2 10;
 3 11;
 4 12;
 0 13;
 0 14;
 5 15;
 0 16;
 0 17;
 0 18;
 6 19;
 7 20;
 8 21;]';
M_.nstatic = 5;
M_.nfwrd   = 0;
M_.npred   = 8;
M_.nboth   = 0;
M_.nsfwrd   = 0;
M_.nspred   = 8;
M_.ndynamic   = 8;
M_.dynamic_tmp_nbr = [21; 8; 0; 0; ];
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
};
M_.mapping.c_ao.eqidx = [1 3 5 6 11 ];
M_.mapping.c_bo.eqidx = [2 4 7 11 ];
M_.mapping.c_at.eqidx = [1 3 5 6 10 ];
M_.mapping.c_bt.eqidx = [2 4 7 10 ];
M_.mapping.l.eqidx = [5 6 8 9 ];
M_.mapping.y_t.eqidx = [8 10 ];
M_.mapping.y_o.eqidx = [7 11 13 ];
M_.mapping.p_t.eqidx = [1 2 6 7 8 9 ];
M_.mapping.w.eqidx = [5 6 8 9 ];
M_.mapping.pi.eqidx = [6 9 ];
M_.mapping.n_a.eqidx = [6 12 ];
M_.mapping.n_b.eqidx = [7 12 ];
M_.mapping.r_star.eqidx = [3 4 6 7 ];
M_.mapping.err_yo.eqidx = [13 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [1 2 3 4 7 11 12 13 ];
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 0;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 0;
oo_.steady_state = zeros(13, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(8, 1);
M_.endo_trends = struct('deflator', cell(13, 1), 'log_deflator', cell(13, 1), 'growth_factor', cell(13, 1), 'log_growth_factor', cell(13, 1));
M_.NNZDerivatives = [55; -1; -1; ];
M_.static_tmp_nbr = [15; 8; 0; 0; ];
close all;
M_.params(1) = .3;
alpha = M_.params(1);
M_.params(2) = .99;
beta = M_.params(2);
M_.params(3) = 2;
psi = M_.params(3);
M_.params(4) = .6;
eta = M_.params(4);
M_.params(5) = .90;
s_t = M_.params(5);
M_.params(6) = .85;
theta = M_.params(6);
M_.params(7) = .9;
rho = M_.params(7);
M_.params(8) = .6;
gamma = M_.params(8);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(5) = .22;
oo_.steady_state(1) = .46;
oo_.steady_state(6) = oo_.steady_state(5)^(1-M_.params(1));
oo_.steady_state(8) = 16.75/oo_.steady_state(6);
oo_.steady_state(3) = M_.params(5)^M_.params(4)*oo_.steady_state(1)/(oo_.steady_state(8)^M_.params(4)*(1-M_.params(5))^M_.params(4));
oo_.steady_state(4) = oo_.steady_state(6)-oo_.steady_state(3);
oo_.steady_state(7) = M_.params(8)/(1-M_.params(7));
oo_.steady_state(2) = oo_.steady_state(7)-oo_.steady_state(1);
oo_.steady_state(9) = oo_.steady_state(8)*(1-M_.params(1))*(1-M_.params(6))*oo_.steady_state(5)^((1-M_.params(1))*(1-M_.params(6))-1)*oo_.steady_state(6)^M_.params(6);
oo_.steady_state(10) = oo_.steady_state(5)^(1-M_.params(1))*oo_.steady_state(8)-oo_.steady_state(5)*oo_.steady_state(9);
oo_.steady_state(13) = 1/M_.params(2);
oo_.steady_state(11) = oo_.steady_state(13)/(oo_.steady_state(13)-1)*(oo_.steady_state(1)+oo_.steady_state(8)*oo_.steady_state(3)-oo_.steady_state(5)*oo_.steady_state(9)-oo_.steady_state(10));
oo_.steady_state(12) = (-oo_.steady_state(11));
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
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
var_list_ = {'c_ao';'c_bo';'c_at';'c_bt';'l';'y_t';'y_o';'p_t';'w';'pi'};
[info, oo_, options_] = stoch_simul(M_, options_, oo_, var_list_);
save('ranbfp_test_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('ranbfp_test_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('ranbfp_test_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('ranbfp_test_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('ranbfp_test_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('ranbfp_test_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('ranbfp_test_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
