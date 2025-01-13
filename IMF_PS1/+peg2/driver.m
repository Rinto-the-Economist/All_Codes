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
M_.fname = 'peg2';
M_.dynare_version = '4.6.0';
oo_.dynare_version = '4.6.0';
options_.dynare_version = '4.6.0';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('peg2.log');
M_.exo_names = cell(4,1);
M_.exo_names_tex = cell(4,1);
M_.exo_names_long = cell(4,1);
M_.exo_names(1) = {'err_r'};
M_.exo_names_tex(1) = {'err\_r'};
M_.exo_names_long(1) = {'err_r'};
M_.exo_names(2) = {'err_u'};
M_.exo_names_tex(2) = {'err\_u'};
M_.exo_names_long(2) = {'err_u'};
M_.exo_names(3) = {'err_z'};
M_.exo_names_tex(3) = {'err\_z'};
M_.exo_names_long(3) = {'err_z'};
M_.exo_names(4) = {'err_istar'};
M_.exo_names_tex(4) = {'err\_istar'};
M_.exo_names_long(4) = {'err_istar'};
M_.endo_names = cell(13,1);
M_.endo_names_tex = cell(13,1);
M_.endo_names_long = cell(13,1);
M_.endo_names(1) = {'x'};
M_.endo_names_tex(1) = {'x'};
M_.endo_names_long(1) = {'x'};
M_.endo_names(2) = {'tau'};
M_.endo_names_tex(2) = {'tau'};
M_.endo_names_long(2) = {'tau'};
M_.endo_names(3) = {'pi'};
M_.endo_names_tex(3) = {'pi'};
M_.endo_names_long(3) = {'pi'};
M_.endo_names(4) = {'pih'};
M_.endo_names_tex(4) = {'pih'};
M_.endo_names_long(4) = {'pih'};
M_.endo_names(5) = {'i'};
M_.endo_names_tex(5) = {'i'};
M_.endo_names_long(5) = {'i'};
M_.endo_names(6) = {'istar'};
M_.endo_names_tex(6) = {'istar'};
M_.endo_names_long(6) = {'istar'};
M_.endo_names(7) = {'r'};
M_.endo_names_tex(7) = {'r'};
M_.endo_names_long(7) = {'r'};
M_.endo_names(8) = {'u'};
M_.endo_names_tex(8) = {'u'};
M_.endo_names_long(8) = {'u'};
M_.endo_names(9) = {'z'};
M_.endo_names_tex(9) = {'z'};
M_.endo_names_long(9) = {'z'};
M_.endo_names(10) = {'delta_e'};
M_.endo_names_tex(10) = {'delta\_e'};
M_.endo_names_long(10) = {'delta_e'};
M_.endo_names(11) = {'pistar'};
M_.endo_names_tex(11) = {'pistar'};
M_.endo_names_long(11) = {'pistar'};
M_.endo_names(12) = {'y'};
M_.endo_names_tex(12) = {'y'};
M_.endo_names_long(12) = {'y'};
M_.endo_names(13) = {'yn'};
M_.endo_names_tex(13) = {'yn'};
M_.endo_names_long(13) = {'yn'};
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
M_.param_names(3) = {'epsilon'};
M_.param_names_tex(3) = {'epsilon'};
M_.param_names_long(3) = {'epsilon'};
M_.param_names(4) = {'theta'};
M_.param_names_tex(4) = {'theta'};
M_.param_names_long(4) = {'theta'};
M_.param_names(5) = {'phi'};
M_.param_names_tex(5) = {'phi'};
M_.param_names_long(5) = {'phi'};
M_.param_names(6) = {'lambda'};
M_.param_names_tex(6) = {'lambda'};
M_.param_names_long(6) = {'lambda'};
M_.param_names(7) = {'kappa'};
M_.param_names_tex(7) = {'kappa'};
M_.param_names_long(7) = {'kappa'};
M_.param_names(8) = {'ro'};
M_.param_names_tex(8) = {'ro'};
M_.param_names_long(8) = {'ro'};
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 4;
M_.endo_nbr = 13;
M_.param_nbr = 8;
M_.orig_endo_nbr = 13;
M_.aux_vars = [];
M_.Sigma_e = zeros(4, 4);
M_.Correlation_matrix = eye(4, 4);
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
M_.orig_maximum_endo_lead = 1;
M_.orig_maximum_exo_lag = 0;
M_.orig_maximum_exo_lead = 0;
M_.orig_maximum_exo_det_lag = 0;
M_.orig_maximum_exo_det_lead = 0;
M_.orig_maximum_lag = 1;
M_.orig_maximum_lead = 1;
M_.orig_maximum_lag_with_diffs_expanded = 1;
M_.lead_lag_incidence = [
 0 6 19;
 1 7 0;
 0 8 0;
 0 9 20;
 0 10 0;
 2 11 0;
 3 12 0;
 4 13 0;
 5 14 0;
 0 15 0;
 0 16 0;
 0 17 0;
 0 18 0;]';
M_.nstatic = 6;
M_.nfwrd   = 2;
M_.npred   = 5;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 5;
M_.ndynamic   = 7;
M_.dynamic_tmp_nbr = [0; 0; 0; 0; ];
M_.equations_tags = {
  1 , 'name' , 'x' ;
  2 , 'name' , 'pih' ;
  3 , 'name' , 'pi' ;
  4 , 'name' , '4' ;
  5 , 'name' , '5' ;
  6 , 'name' , 'i' ;
  7 , 'name' , 'tau' ;
  8 , 'name' , 'delta_e' ;
  9 , 'name' , 'pistar' ;
  10 , 'name' , 'r' ;
  11 , 'name' , 'u' ;
  12 , 'name' , 'z' ;
  13 , 'name' , 'istar' ;
};
M_.mapping.x.eqidx = [1 2 4 5 ];
M_.mapping.tau.eqidx = [3 5 7 ];
M_.mapping.pi.eqidx = [3 ];
M_.mapping.pih.eqidx = [2 3 4 7 ];
M_.mapping.i.eqidx = [4 6 ];
M_.mapping.istar.eqidx = [6 13 ];
M_.mapping.r.eqidx = [4 10 ];
M_.mapping.u.eqidx = [2 11 ];
M_.mapping.z.eqidx = [5 12 ];
M_.mapping.delta_e.eqidx = [8 ];
M_.mapping.pistar.eqidx = [9 ];
M_.mapping.y.eqidx = [1 ];
M_.mapping.yn.eqidx = [1 ];
M_.mapping.err_r.eqidx = [10 ];
M_.mapping.err_u.eqidx = [11 ];
M_.mapping.err_z.eqidx = [12 ];
M_.mapping.err_istar.eqidx = [13 ];
M_.static_and_dynamic_models_differ = false;
M_.has_external_function = false;
M_.state_var = [2 6 7 8 9 ];
M_.exo_names_orig_ord = [1:4];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(13, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(4, 1);
M_.params = NaN(8, 1);
M_.endo_trends = struct('deflator', cell(13, 1), 'log_deflator', cell(13, 1), 'growth_factor', cell(13, 1), 'log_growth_factor', cell(13, 1));
M_.NNZDerivatives = [38; -1; -1; ];
M_.static_tmp_nbr = [0; 0; 0; 0; ];
close all;
M_.params(1) = 0.4;
alpha = M_.params(1);
M_.params(2) = 0.99;
beta = M_.params(2);
M_.params(3) = 6;
epsilon = M_.params(3);
M_.params(4) = 0.75;
theta = M_.params(4);
M_.params(5) = 3;
phi = M_.params(5);
lamba = ((1 - theta) * (1 - beta * theta)) / theta;
M_.params(7) = lamba*(1+M_.params(5));
kappa = M_.params(7);
M_.params(8) = 0.9;
ro = M_.params(8);
%
% INITVAL instructions
%
options_.initval_file = false;
oo_.steady_state(1) = 0;
oo_.steady_state(2) = 0;
oo_.steady_state(3) = 0;
oo_.steady_state(4) = 0;
oo_.steady_state(5) = 0;
oo_.steady_state(6) = 0;
oo_.steady_state(10) = 0;
oo_.steady_state(7) = 0;
oo_.steady_state(8) = 0;
oo_.steady_state(9) = 0;
if M_.exo_nbr > 0
	oo_.exo_simul = ones(M_.maximum_lag,1)*oo_.exo_steady_state';
end
if M_.exo_det_nbr > 0
	oo_.exo_det_simul = ones(M_.maximum_lag,1)*oo_.exo_det_steady_state';
end
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = (1)^2;
M_.Sigma_e(2, 2) = (1)^2;
M_.Sigma_e(3, 3) = (1)^2;
M_.Sigma_e(4, 4) = (1)^2;
options_.impulse_responses.plot_threshold = 0;
options_.irf = 100;
options_.order = 1;
var_list_ = {'pih';'x';'pi';'tau';'i';'delta_e'};
[info, oo_, options_] = stoch_simul(M_, options_, oo_, var_list_);
save('peg2_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('peg2_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('peg2_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('peg2_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('peg2_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('peg2_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('peg2_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
