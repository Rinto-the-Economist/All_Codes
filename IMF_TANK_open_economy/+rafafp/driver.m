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
M_.fname = 'rafafp';
M_.dynare_version = '4.6.0';
oo_.dynare_version = '4.6.0';
options_.dynare_version = '4.6.0';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('rafafp.log');
M_.exo_names = cell(1,1);
M_.exo_names_tex = cell(1,1);
M_.exo_names_long = cell(1,1);
M_.exo_names(1) = {'err_yo'};
M_.exo_names_tex(1) = {'err\_yo'};
M_.exo_names_long(1) = {'err_yo'};
M_.endo_names = cell(10,1);
M_.endo_names_tex = cell(10,1);
M_.endo_names_long = cell(10,1);
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
M_.endo_partitions = struct();
M_.param_names = cell(7,1);
M_.param_names_tex = cell(7,1);
M_.param_names_long = cell(7,1);
M_.param_names(1) = {'alpha'};
M_.param_names_tex(1) = {'alpha'};
M_.param_names_long(1) = {'alpha'};
M_.param_names(2) = {'psi'};
M_.param_names_tex(2) = {'psi'};
M_.param_names_long(2) = {'psi'};
M_.param_names(3) = {'eta'};
M_.param_names_tex(3) = {'eta'};
M_.param_names_long(3) = {'eta'};
M_.param_names(4) = {'s_t'};
M_.param_names_tex(4) = {'s\_t'};
M_.param_names_long(4) = {'s_t'};
M_.param_names(5) = {'theta'};
M_.param_names_tex(5) = {'theta'};
M_.param_names_long(5) = {'theta'};
M_.param_names(6) = {'rho'};
M_.param_names_tex(6) = {'rho'};
M_.param_names_long(6) = {'rho'};
M_.param_names(7) = {'gamma'};
M_.param_names_tex(7) = {'gamma'};
M_.param_names_long(7) = {'gamma'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 10;
M_.param_nbr = 7;
M_.orig_endo_nbr = 10;
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
M_.orig_eq_nbr = 10;
M_.eq_nbr = 10;
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
 0 2;
 0 3;
 0 4;
 0 5;
 0 6;
 0 7;
 1 8;
 0 9;
 0 10;
 0 11;]';
M_.nstatic = 9;
M_.nfwrd   = 0;
M_.npred   = 1;
M_.nboth   = 0;
M_.nsfwrd   = 0;
M_.nspred   = 1;
M_.ndynamic   = 1;
M_.dynamic_tmp_nbr = [10; 1; 0; 0; ];
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
};
M_.mapping.c_ao.eqidx = [1 3 4 9 ];
M_.mapping.c_bo.eqidx = [2 5 9 ];
M_.mapping.c_at.eqidx = [1 3 4 8 ];
M_.mapping.c_bt.eqidx = [2 5 8 ];
M_.mapping.l.eqidx = [3 4 6 7 ];
M_.mapping.y_t.eqidx = [6 8 ];
M_.mapping.y_o.eqidx = [5 9 10 ];
M_.mapping.p_t.eqidx = [1 2 4 5 6 7 ];
M_.mapping.w.eqidx = [3 4 6 7 ];
M_.mapping.pi.eqidx = [4 7 ];
M_.mapping.err_yo.eqidx = [10 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [7 ];
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 0;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 0;
oo_.steady_state = zeros(10, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(7, 1);
M_.endo_trends = struct('deflator', cell(10, 1), 'log_deflator', cell(10, 1), 'growth_factor', cell(10, 1), 'log_growth_factor', cell(10, 1));
M_.NNZDerivatives = [37; -1; -1; ];
M_.static_tmp_nbr = [10; 1; 0; 0; ];
close all;
load parameters;
set_param_value('alpha'   ,par.alpha);
set_param_value('psi'     ,par.psi); 
set_param_value('eta'     ,par.eta);
set_param_value('s_t'     ,par.s_t);
set_param_value('theta'   ,par.theta);
set_param_value('rho'     ,par.rho); 
set_param_value('gamma'   ,par.gamma);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(5) = .22;
oo_.steady_state(1) = .46;
oo_.steady_state(6) = oo_.steady_state(5)^(1-M_.params(1));
oo_.steady_state(8) = 16.75/oo_.steady_state(6);
oo_.steady_state(3) = M_.params(4)^M_.params(3)*oo_.steady_state(1)/(oo_.steady_state(8)^M_.params(3)*(1-M_.params(4))^M_.params(3));
oo_.steady_state(4) = oo_.steady_state(6)-oo_.steady_state(3);
oo_.steady_state(7) = M_.params(7)/(1-M_.params(6));
oo_.steady_state(2) = oo_.steady_state(7)-oo_.steady_state(1);
oo_.steady_state(9) = oo_.steady_state(8)*(1-M_.params(1))*(1-M_.params(5))*oo_.steady_state(5)^((1-M_.params(1))*(1-M_.params(5))-1)*oo_.steady_state(6)^M_.params(5);
oo_.steady_state(10) = oo_.steady_state(5)^(1-M_.params(1))*oo_.steady_state(8)-oo_.steady_state(5)*oo_.steady_state(9);
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
options_.solve_algo = 1;
options_.steady.maxit = 1000;
steady;
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (.1)^2;
options_.impulse_responses.plot_threshold = 0;
options_.irf = 100;
options_.order = 1;
var_list_ = {'c_ao';'c_bo';'c_at';'c_bt';'l';'y_t';'y_o';'p_t';'w';'pi'};
[info, oo_, options_] = stoch_simul(M_, options_, oo_, var_list_);
save('rafafp_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('rafafp_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('rafafp_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('rafafp_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('rafafp_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('rafafp_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('rafafp_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
