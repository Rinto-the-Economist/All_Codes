
%----------------------------------------------------------------
%
% Title: International Macro-Finance Problem Set 4, main file
% Author: ---
% Date: 10/01/2024
% Description: Main file for the final problem set
%
%----------------------------------------------------------------


%----------------------------------------------------------------
% 0. Housekeeping (close all graphic windows)
%----------------------------------------------------------------

close all;
clear all;


%----------------------------------------------------------------
% 1. Load parameters
%----------------------------------------------------------------

parameters;
save parameters par;


%----------------------------------------------------------------
% 1. Run models
%----------------------------------------------------------------

dynare rafafp;
dynare ranbfp;
dynare tanbfp;
dynare tanbnr_fer;
dynare tanbnr_pit;
dynare tanbfpnh;


%----------------------------------------------------------------
% 2. Load results
%----------------------------------------------------------------


rafafp_results = load("rafafp_results.mat");

RAFAFP.c_aoss = rafafp_results.oo_.steady_state(1);
RAFAFP.c_boss = rafafp_results.oo_.steady_state(2);
RAFAFP.c_atss = rafafp_results.oo_.steady_state(3);
RAFAFP.c_btss = rafafp_results.oo_.steady_state(4);
RAFAFP.lss = rafafp_results.oo_.steady_state(5);
RAFAFP.y_tss = rafafp_results.oo_.steady_state(6);
RAFAFP.y_oss = rafafp_results.oo_.steady_state(7);
RAFAFP.p_tss = rafafp_results.oo_.steady_state(8);
RAFAFP.wss = rafafp_results.oo_.steady_state(9);
RAFAFP.piss = rafafp_results.oo_.steady_state(10);

RAFAFP.c_ao = rafafp_results.oo_.irfs.c_ao_err_yo;
RAFAFP.c_at = rafafp_results.oo_.irfs.c_at_err_yo;
RAFAFP.c_bo = rafafp_results.oo_.irfs.c_bo_err_yo;
RAFAFP.c_bt = rafafp_results.oo_.irfs.c_bt_err_yo;
RAFAFP.l    = rafafp_results.oo_.irfs.l_err_yo;
RAFAFP.p_t  = rafafp_results.oo_.irfs.p_t_err_yo;
RAFAFP.pi   = rafafp_results.oo_.irfs.pi_err_yo;
RAFAFP.w    = rafafp_results.oo_.irfs.w_err_yo;
RAFAFP.y_o  = rafafp_results.oo_.irfs.y_o_err_yo;
RAFAFP.y_t  = rafafp_results.oo_.irfs.y_t_err_yo;

psi = rafafp_results.M_.params(2);
RAFAFP.eta = rafafp_results.M_.params(3);
RAFAFP.s_t = rafafp_results.M_.params(4);


ranbfp_results = load("ranbfp_results.mat");

RANBFP.c_aoss = ranbfp_results.oo_.steady_state(1);
RANBFP.c_boss = ranbfp_results.oo_.steady_state(2);
RANBFP.c_atss = ranbfp_results.oo_.steady_state(3);
RANBFP.c_btss = ranbfp_results.oo_.steady_state(4);
RANBFP.lss = ranbfp_results.oo_.steady_state(5);
RANBFP.y_tss = ranbfp_results.oo_.steady_state(6);
RANBFP.y_oss = ranbfp_results.oo_.steady_state(7);
RANBFP.p_tss = ranbfp_results.oo_.steady_state(8);
RANBFP.wss = ranbfp_results.oo_.steady_state(9);
RANBFP.piss = ranbfp_results.oo_.steady_state(10);
RANBFP.n_ass = ranbfp_results.oo_.steady_state(11);
RANBFP.n_bss = ranbfp_results.oo_.steady_state(12);
RANBFP.r_starss = ranbfp_results.oo_.steady_state(13);

RANBFP.c_ao = ranbfp_results.oo_.irfs.c_ao_err_yo;
RANBFP.c_at = ranbfp_results.oo_.irfs.c_at_err_yo;
RANBFP.c_bo = ranbfp_results.oo_.irfs.c_bo_err_yo;
RANBFP.c_bt = ranbfp_results.oo_.irfs.c_bt_err_yo;
RANBFP.l    = ranbfp_results.oo_.irfs.l_err_yo;
RANBFP.p_t  = ranbfp_results.oo_.irfs.p_t_err_yo;
RANBFP.pi   = ranbfp_results.oo_.irfs.pi_err_yo;
RANBFP.w    = ranbfp_results.oo_.irfs.w_err_yo;
RANBFP.y_o  = ranbfp_results.oo_.irfs.y_o_err_yo;
RANBFP.y_t  = ranbfp_results.oo_.irfs.y_t_err_yo;

beta = ranbfp_results.M_.params(2);
RANBFP.eta = ranbfp_results.M_.params(4);
RANBFP.s_t = ranbfp_results.M_.params(5);


tanbfp_results = load("tanbfp_results.mat");

TANBFP.c_ahoss = ranbfp_results.oo_.steady_state(1);
TANBFP.c_aross = tanbfp_results.oo_.steady_state(2);
TANBFP.c_boss = tanbfp_results.oo_.steady_state(3);
TANBFP.c_ahtss = tanbfp_results.oo_.steady_state(4);
TANBFP.c_artss = tanbfp_results.oo_.steady_state(5);
TANBFP.c_btss = tanbfp_results.oo_.steady_state(6);
TANBFP.l_hss = tanbfp_results.oo_.steady_state(7);
TANBFP.l_rss = tanbfp_results.oo_.steady_state(8);
TANBFP.lss = tanbfp_results.oo_.steady_state(9);
TANBFP.y_tss = tanbfp_results.oo_.steady_state(10);
TANBFP.y_oss = tanbfp_results.oo_.steady_state(11);
TANBFP.p_tss = tanbfp_results.oo_.steady_state(12);
TANBFP.wss = tanbfp_results.oo_.steady_state(13);
TANBFP.piss = tanbfp_results.oo_.steady_state(14);
TANBFP.n_ass = tanbfp_results.oo_.steady_state(15);
TANBFP.n_bss = tanbfp_results.oo_.steady_state(16);
TANBFP.rstarss = tanbfp_results.oo_.steady_state(17);
TANBFP.pirss = tanbfp_results.oo_.steady_state(18);
TANBFP.pihss = tanbfp_results.oo_.steady_state(19);

TANBFP.c_aro = tanbfp_results.oo_.irfs.c_aro_err_yo;
TANBFP.c_art = tanbfp_results.oo_.irfs.c_art_err_yo;
TANBFP.c_aho = tanbfp_results.oo_.irfs.c_aho_err_yo;
TANBFP.c_aht = tanbfp_results.oo_.irfs.c_aht_err_yo;
TANBFP.c_bo  = tanbfp_results.oo_.irfs.c_bo_err_yo;
TANBFP.c_bt  = tanbfp_results.oo_.irfs.c_bt_err_yo;
TANBFP.l_r   = tanbfp_results.oo_.irfs.l_r_err_yo;
TANBFP.l_h   = tanbfp_results.oo_.irfs.l_h_err_yo;
TANBFP.l   = tanbfp_results.oo_.irfs.l_err_yo;
TANBFP.p_t   = tanbfp_results.oo_.irfs.p_t_err_yo;
TANBFP.pi    = tanbfp_results.oo_.irfs.pi_err_yo;
TANBFP.w     = tanbfp_results.oo_.irfs.w_err_yo;
TANBFP.y_o   = tanbfp_results.oo_.irfs.y_o_err_yo;
TANBFP.y_t   = tanbfp_results.oo_.irfs.y_t_err_yo;

TANBFP.eta = tanbfp_results.M_.params(4);
TANBFP.s_t = tanbfp_results.M_.params(5);
chi = tanbfp_results.M_.params(9);


tanbnr_fer_results = load("tanbnr_fer_results.mat");

TANBNR_FER.c_ahoss = tanbnr_fer_results.oo_.steady_state(1);
TANBNR_FER.c_aross = tanbnr_fer_results.oo_.steady_state(2);
TANBNR_FER.c_boss = tanbnr_fer_results.oo_.steady_state(3);
TANBNR_FER.c_ahtss = tanbnr_fer_results.oo_.steady_state(4);
TANBNR_FER.c_artss = tanbnr_fer_results.oo_.steady_state(5);
TANBNR_FER.c_btss = tanbnr_fer_results.oo_.steady_state(6);
TANBNR_FER.l_hss = tanbnr_fer_results.oo_.steady_state(7);
TANBNR_FER.l_rss = tanbnr_fer_results.oo_.steady_state(8);
TANBNR_FER.lss = tanbnr_fer_results.oo_.steady_state(9);
TANBNR_FER.y_tss = tanbnr_fer_results.oo_.steady_state(10);
TANBNR_FER.y_oss = tanbnr_fer_results.oo_.steady_state(11);
TANBNR_FER.p_tss = tanbnr_fer_results.oo_.steady_state(12);
TANBNR_FER.wss = tanbnr_fer_results.oo_.steady_state(13);
TANBNR_FER.piss = tanbnr_fer_results.oo_.steady_state(14);
TANBNR_FER.n_ass = tanbnr_fer_results.oo_.steady_state(15);
TANBNR_FER.n_bss = tanbnr_fer_results.oo_.steady_state(16);
TANBNR_FER.r_starss = tanbnr_fer_results.oo_.steady_state(17);
TANBNR_FER.pirss = tanbnr_fer_results.oo_.steady_state(18);
TANBNR_FER.pihss = tanbnr_fer_results.oo_.steady_state(19);

TANBNR_FER.c_aro = tanbnr_fer_results.oo_.irfs.c_aro_err_yo;
TANBNR_FER.c_art = tanbnr_fer_results.oo_.irfs.c_art_err_yo;
TANBNR_FER.c_aho = tanbnr_fer_results.oo_.irfs.c_aho_err_yo;
TANBNR_FER.c_aht = tanbnr_fer_results.oo_.irfs.c_aht_err_yo;
TANBNR_FER.c_bo  = tanbnr_fer_results.oo_.irfs.c_bo_err_yo;
TANBNR_FER.c_bt  = tanbnr_fer_results.oo_.irfs.c_bt_err_yo;
TANBNR_FER.l_r   = tanbnr_fer_results.oo_.irfs.l_r_err_yo;
TANBNR_FER.l_h   = tanbnr_fer_results.oo_.irfs.l_h_err_yo;
TANBNR_FER.l   = tanbnr_fer_results.oo_.irfs.l_err_yo;
TANBNR_FER.p_t   = tanbnr_fer_results.oo_.irfs.p_t_err_yo;
TANBNR_FER.pi    = tanbnr_fer_results.oo_.irfs.pi_err_yo;
TANBNR_FER.w     = tanbnr_fer_results.oo_.irfs.w_err_yo;
TANBNR_FER.y_o   = tanbnr_fer_results.oo_.irfs.y_o_err_yo;
TANBNR_FER.y_t   = tanbnr_fer_results.oo_.irfs.y_t_err_yo;

TANBNR_FER.eta = tanbnr_fer_results.M_.params(5);
TANBNR_FER.s_t = tanbnr_fer_results.M_.params(6);


tanbnr_pit_results = load("tanbnr_pit_results.mat");

TANBNR_PIT.c_ahoss = tanbnr_pit_results.oo_.steady_state(1);
TANBNR_PIT.c_aross = tanbnr_pit_results.oo_.steady_state(2);
TANBNR_PIT.c_boss = tanbnr_pit_results.oo_.steady_state(3);
TANBNR_PIT.c_ahtss = tanbnr_pit_results.oo_.steady_state(4);
TANBNR_PIT.c_artss = tanbnr_pit_results.oo_.steady_state(5);
TANBNR_PIT.c_btss = tanbnr_pit_results.oo_.steady_state(6);
TANBNR_PIT.l_hss = tanbnr_pit_results.oo_.steady_state(7);
TANBNR_PIT.l_rss = tanbnr_pit_results.oo_.steady_state(8);
TANBNR_PIT.lss = tanbnr_pit_results.oo_.steady_state(9);
TANBNR_PIT.y_tss = tanbnr_pit_results.oo_.steady_state(10);
TANBNR_PIT.y_oss = tanbnr_pit_results.oo_.steady_state(11);
TANBNR_PIT.p_tss = tanbnr_pit_results.oo_.steady_state(12);
TANBNR_PIT.ess = tanbnr_pit_results.oo_.steady_state(13);
TANBNR_PIT.wss = tanbnr_pit_results.oo_.steady_state(14);
TANBNR_PIT.piss = tanbnr_pit_results.oo_.steady_state(15);
TANBNR_PIT.n_ass = tanbnr_pit_results.oo_.steady_state(16);
TANBNR_PIT.n_bss = tanbnr_pit_results.oo_.steady_state(17);
TANBNR_PIT.r_starss = tanbnr_pit_results.oo_.steady_state(18);
TANBNR_PIT.pirss = tanbnr_pit_results.oo_.steady_state(19);
TANBNR_PIT.pihss = tanbnr_pit_results.oo_.steady_state(20);

TANBNR_PIT.c_aro = tanbnr_pit_results.oo_.irfs.c_aro_err_yo;
TANBNR_PIT.c_art = tanbnr_pit_results.oo_.irfs.c_art_err_yo;
TANBNR_PIT.c_aho = tanbnr_pit_results.oo_.irfs.c_aho_err_yo;
TANBNR_PIT.c_aht = tanbnr_pit_results.oo_.irfs.c_aht_err_yo;
TANBNR_PIT.c_bo  = tanbnr_pit_results.oo_.irfs.c_bo_err_yo;
TANBNR_PIT.c_bt  = tanbnr_pit_results.oo_.irfs.c_bt_err_yo;
TANBNR_PIT.l_r   = tanbnr_pit_results.oo_.irfs.l_r_err_yo;
TANBNR_PIT.l_h   = tanbnr_pit_results.oo_.irfs.l_h_err_yo;
TANBNR_PIT.l   = tanbnr_pit_results.oo_.irfs.l_err_yo;
TANBNR_PIT.p_t   = tanbnr_pit_results.oo_.irfs.p_t_err_yo;
TANBNR_PIT.e     = tanbnr_pit_results.oo_.irfs.e_err_yo;
TANBNR_PIT.pi    = tanbnr_pit_results.oo_.irfs.pi_err_yo;
TANBNR_PIT.w     = tanbnr_pit_results.oo_.irfs.w_err_yo;
TANBNR_PIT.y_o   = tanbnr_pit_results.oo_.irfs.y_o_err_yo;
TANBNR_PIT.y_t   = tanbnr_pit_results.oo_.irfs.y_t_err_yo;

TANBNR_PIT.eta = tanbnr_pit_results.M_.params(5);
TANBNR_PIT.s_t = tanbnr_pit_results.M_.params(6);


tanbfpnh_results = load("tanbfpnh_results.mat");

TANBFPNH.c_ahoss = tanbfpnh_results.oo_.steady_state(1);
TANBFPNH.c_aross = tanbfpnh_results.oo_.steady_state(2);
TANBFPNH.c_boss = tanbfpnh_results.oo_.steady_state(3);
TANBFPNH.c_ahtss = tanbfpnh_results.oo_.steady_state(4);
TANBFPNH.c_artss = tanbfpnh_results.oo_.steady_state(5);
TANBFPNH.c_btss = tanbfpnh_results.oo_.steady_state(6);
TANBFPNH.l_hss = tanbfpnh_results.oo_.steady_state(7);
TANBFPNH.l_rss = tanbfpnh_results.oo_.steady_state(8);
TANBFPNH.lss = tanbfpnh_results.oo_.steady_state(9);
TANBFPNH.y_tss = tanbfpnh_results.oo_.steady_state(10);
TANBFPNH.y_oss = tanbfpnh_results.oo_.steady_state(11);
TANBFPNH.p_tss = tanbfpnh_results.oo_.steady_state(12);
TANBFPNH.wss = tanbfpnh_results.oo_.steady_state(13);
TANBFPNH.piss = tanbfpnh_results.oo_.steady_state(14);
TANBFPNH.n_ass = tanbfpnh_results.oo_.steady_state(15);
TANBFPNH.n_bss = tanbfpnh_results.oo_.steady_state(16);
TANBFPNH.rstarss = tanbfpnh_results.oo_.steady_state(17);
TANBFPNH.pirss = tanbfpnh_results.oo_.steady_state(18);
TANBFPNH.pihss = tanbfpnh_results.oo_.steady_state(19);

TANBFPNH.c_aro = tanbfpnh_results.oo_.irfs.c_aro_err_yo;
TANBFPNH.c_art = tanbfpnh_results.oo_.irfs.c_art_err_yo;
TANBFPNH.c_aho = tanbfpnh_results.oo_.irfs.c_aho_err_yo;
TANBFPNH.c_aht = tanbfpnh_results.oo_.irfs.c_aht_err_yo;
TANBFPNH.c_bo  = tanbfpnh_results.oo_.irfs.c_bo_err_yo;
TANBFPNH.c_bt  = tanbfpnh_results.oo_.irfs.c_bt_err_yo;
TANBFPNH.l_r   = tanbfpnh_results.oo_.irfs.l_r_err_yo;
TANBFPNH.l_h   = tanbfpnh_results.oo_.irfs.l_h_err_yo;
TANBFPNH.l   = tanbfpnh_results.oo_.irfs.l_err_yo;
TANBFPNH.p_t   = tanbfpnh_results.oo_.irfs.p_t_err_yo;
TANBFPNH.pi    = tanbfpnh_results.oo_.irfs.pi_err_yo;
TANBFPNH.w     = tanbfpnh_results.oo_.irfs.w_err_yo;
TANBFPNH.y_o   = tanbfpnh_results.oo_.irfs.y_o_err_yo;
TANBFPNH.y_t   = tanbfpnh_results.oo_.irfs.y_t_err_yo;

TANBFPNH.eta = tanbfpnh_results.M_.params(4);
TANBFPNH.s_art = tanbfpnh_results.M_.params(5);
TANBFPNH.s_aht = tanbfpnh_results.M_.params(6);
TANBFPNH.s_bt = tanbfpnh_results.M_.params(7);

TANBFPNH.s_t = chi * TANBFPNH.s_art + (1 - chi) * TANBFPNH.s_aht;


%----------------------------------------------------------------
% 4. Function definition
%----------------------------------------------------------------

% CES aggregator:

function cons = ces_agg(c_t, c_o, eta, s_t)
  
  cons = (s_t * c_t.^(1 - 1 / eta) + 
                      (1 - s_t) * c_o.^(1 - 1 / eta)).^(eta / (eta - 1));       
                      
endfunction



%----------------------------------------------------------------
% 3. Create key variables
%----------------------------------------------------------------

% output in country A

RAFAFP.output = RAFAFP.y_t + RAFAFP.y_tss;
RANBFP.output = RANBFP.y_t + RANBFP.y_tss;
TANBFP.output = TANBFP.y_t + TANBFP.y_tss;
TANBNR_FER.output = TANBNR_FER.y_t + TANBNR_FER.y_tss;
TANBNR_PIT.output = TANBNR_PIT.y_t + TANBNR_PIT.y_tss;
TANBFPNH.output = TANBFPNH.y_t + TANBFPNH.y_tss;


% price levels

% re-express eveything as levels
RAFAFP.p_t = RAFAFP.p_t + RAFAFP.p_tss;
RAFAFP.p_o = 1;

% create a price index
RAFAFP.price = ces_agg(RAFAFP.p_t, RAFAFP.p_o, RAFAFP.eta, RAFAFP.s_t);


RANBFP.p_t = RANBFP.p_t + RANBFP.p_tss;
RANBFP.p_o = 1;

RANBFP.price = ces_agg(RANBFP.p_t, RANBFP.p_o, RANBFP.eta, RANBFP.s_t);


TANBFP.p_t = TANBFP.p_t + TANBFP.p_tss;
TANBFP.p_o = 1;

TANBFP.price = ces_agg(TANBFP.p_t, TANBFP.p_o, TANBFP.eta, TANBFP.s_t);


TANBNR_FER.p_t = TANBNR_FER.p_t + TANBNR_FER.p_tss;
TANBNR_FER.p_o = 1;

TANBNR_FER.price = ces_agg(TANBNR_FER.p_t, TANBNR_FER.p_o, TANBNR_FER.eta, TANBNR_FER.s_t);


TANBNR_PIT.p_at = TANBNR_PIT.p_tss;
TANBNR_PIT.p_ao = TANBNR_PIT.e + TANBNR_PIT.ess;

TANBNR_PIT.price_a = ces_agg(TANBNR_PIT.p_at, TANBNR_PIT.p_ao, TANBNR_PIT.eta, TANBNR_PIT.s_t);


TANBNR_PIT.p_bt = TANBNR_PIT.p_tss ./ (TANBNR_PIT.e + TANBNR_PIT.ess);
TANBNR_PIT.p_bo = 1;

TANBNR_PIT.price_b = ces_agg(TANBNR_PIT.p_bt, TANBNR_PIT.p_bo, TANBNR_PIT.eta, TANBNR_PIT.s_t);


TANBFPNH.p_t = TANBFPNH.p_t + TANBFPNH.p_tss;
TANBFPNH.p_o = 1;

TANBFPNH.price = ces_agg(TANBFPNH.p_t, TANBFPNH.p_o, TANBFPNH.eta, TANBFPNH.s_t);



% Inflation
RAFAFP.infl = diff(RAFAFP.price) ./ RAFAFP.price(1:(end-1)) * 100;
RANBFP.infl = diff(RANBFP.price) ./ RANBFP.price(1:(end-1)) * 100;
TANBFP.infl = diff(TANBFP.price) ./ TANBFP.price(1:(end-1)) * 100;
TANBNR_FER.infl = diff(TANBNR_FER.price) ./ TANBNR_FER.price(1:(end-1)) * 100;
TANBNR_PIT.infl_a = diff(TANBNR_PIT.price_a) ./ TANBNR_PIT.price_a(1:(end-1)) * 100;
TANBNR_PIT.infl_b = diff(TANBNR_PIT.price_b) ./ TANBNR_PIT.price_b(1:(end-1)) * 100;
TANBFPNH.infl = diff(TANBFPNH.price) ./ TANBFPNH.price(1:(end-1)) * 100;


% consumption

% re-express eveything as levels
RAFAFP.c_at = RAFAFP.c_at + RAFAFP.c_atss;
RAFAFP.c_ao = RAFAFP.c_ao + RAFAFP.c_aoss;
RAFAFP.c_bt = RAFAFP.c_bt + RAFAFP.c_btss;
RAFAFP.c_bo = RAFAFP.c_bo + RAFAFP.c_boss;

% rule out negative consumption
RAFAFP.c_at = max(RAFAFP.c_at, eps);
RAFAFP.c_ao = max(RAFAFP.c_ao, eps);
RAFAFP.c_bt = max(RAFAFP.c_bt, eps);
RAFAFP.c_bo = max(RAFAFP.c_bo, eps);

% compute consumption basket
RAFAFP.c_a = ces_agg(RAFAFP.c_at, RAFAFP.c_ao, RAFAFP.eta, RAFAFP.s_t);
RAFAFP.c_b = ces_agg(RAFAFP.c_bt, RAFAFP.c_bo, RAFAFP.eta, RAFAFP.s_t);


RANBFP.c_at = RANBFP.c_at + RANBFP.c_atss;
RANBFP.c_ao = RANBFP.c_ao + RANBFP.c_aoss;
RANBFP.c_bt = RANBFP.c_bt + RANBFP.c_btss;
RANBFP.c_bo = RANBFP.c_bo + RANBFP.c_boss;

RANBFP.c_at = max(RANBFP.c_at, eps);
RANBFP.c_ao = max(RANBFP.c_ao, eps);
RANBFP.c_bt = max(RANBFP.c_bt, eps);
RANBFP.c_bo = max(RANBFP.c_bo, eps);

RANBFP.c_a = ces_agg(RANBFP.c_at, RANBFP.c_ao, RANBFP.eta, RANBFP.s_t);
RANBFP.c_b = ces_agg(RANBFP.c_bt, RANBFP.c_bo, RANBFP.eta, RANBFP.s_t);


TANBFP.c_art = TANBFP.c_art + TANBFP.c_artss;
TANBFP.c_aro = TANBFP.c_aro + TANBFP.c_aross;
TANBFP.c_aht = TANBFP.c_aht + TANBFP.c_ahtss;
TANBFP.c_aho = TANBFP.c_aho + TANBFP.c_ahoss;
TANBFP.c_bt = TANBFP.c_bt + TANBFP.c_btss;
TANBFP.c_bo = TANBFP.c_bo + TANBFP.c_boss;

TANBFP.c_art = max(TANBFP.c_art, eps);
TANBFP.c_aro = max(TANBFP.c_aro, eps);
TANBFP.c_aht = max(TANBFP.c_aht, eps);
TANBFP.c_aho = max(TANBFP.c_aho, eps);
TANBFP.c_bt = max(TANBFP.c_bt, eps);
TANBFP.c_bo = max(TANBFP.c_bo, eps);

TANBFP.c_ar = ces_agg(TANBFP.c_art, TANBFP.c_aro, TANBFP.eta, TANBFP.s_t);
TANBFP.c_ah = ces_agg(TANBFP.c_aht, TANBFP.c_aho, TANBFP.eta, TANBFP.s_t);
TANBFP.c_b = ces_agg(TANBFP.c_bt, TANBFP.c_bo, TANBFP.eta, TANBFP.s_t);


TANBNR_FER.c_art = TANBNR_FER.c_art + TANBNR_FER.c_artss;
TANBNR_FER.c_aro = TANBNR_FER.c_aro + TANBNR_FER.c_aross;
TANBNR_FER.c_aht = TANBNR_FER.c_aht + TANBNR_FER.c_ahtss;
TANBNR_FER.c_aho = TANBNR_FER.c_aho + TANBNR_FER.c_ahoss;
TANBNR_FER.c_bt = TANBNR_FER.c_bt + TANBNR_FER.c_btss;
TANBNR_FER.c_bo = TANBNR_FER.c_bo + TANBNR_FER.c_boss;

TANBNR_FER.c_art = max(TANBNR_FER.c_art, eps);
TANBNR_FER.c_aro = max(TANBNR_FER.c_aro, eps);
TANBNR_FER.c_aht = max(TANBNR_FER.c_aht, eps);
TANBNR_FER.c_aho = max(TANBNR_FER.c_aho, eps);
TANBNR_FER.c_bt = max(TANBNR_FER.c_bt, eps);
TANBNR_FER.c_bo = max(TANBNR_FER.c_bo, eps);

TANBNR_FER.c_ar = ces_agg(TANBNR_FER.c_art, TANBNR_FER.c_aro, TANBNR_FER.eta, TANBNR_FER.s_t);
TANBNR_FER.c_ah = ces_agg(TANBNR_FER.c_aht, TANBNR_FER.c_aho, TANBNR_FER.eta, TANBNR_FER.s_t);
TANBNR_FER.c_b = ces_agg(TANBNR_FER.c_bt, TANBNR_FER.c_bo, TANBNR_FER.eta, TANBNR_FER.s_t);


TANBNR_PIT.c_art = TANBNR_PIT.c_art + TANBNR_PIT.c_artss;
TANBNR_PIT.c_aro = TANBNR_PIT.c_aro + TANBNR_PIT.c_aross;
TANBNR_PIT.c_aht = TANBNR_PIT.c_aht + TANBNR_PIT.c_ahtss;
TANBNR_PIT.c_aho = TANBNR_PIT.c_aho + TANBNR_PIT.c_ahoss;
TANBNR_PIT.c_bt = TANBNR_PIT.c_bt + TANBNR_PIT.c_btss;
TANBNR_PIT.c_bo = TANBNR_PIT.c_bo + TANBNR_PIT.c_boss;

TANBNR_PIT.c_art = max(TANBNR_PIT.c_art, eps);
TANBNR_PIT.c_aro = max(TANBNR_PIT.c_aro, eps);
TANBNR_PIT.c_aht = max(TANBNR_PIT.c_aht, eps);
TANBNR_PIT.c_aho = max(TANBNR_PIT.c_aho, eps);
TANBNR_PIT.c_bt = max(TANBNR_PIT.c_bt, eps);
TANBNR_PIT.c_bo = max(TANBNR_PIT.c_bo, eps);

TANBNR_PIT.c_ar = ces_agg(TANBNR_PIT.c_art, TANBNR_PIT.c_aro, TANBNR_PIT.eta, TANBNR_PIT.s_t);
TANBNR_PIT.c_ah = ces_agg(TANBNR_PIT.c_aht, TANBNR_PIT.c_aho, TANBNR_PIT.eta, TANBNR_PIT.s_t);
TANBNR_PIT.c_b = ces_agg(TANBNR_PIT.c_bt, TANBNR_PIT.c_bo, TANBNR_PIT.eta, TANBNR_PIT.s_t);


TANBFPNH.c_art = TANBFPNH.c_art + TANBFPNH.c_artss;
TANBFPNH.c_aro = TANBFPNH.c_aro + TANBFPNH.c_aross;
TANBFPNH.c_aht = TANBFPNH.c_aht + TANBFPNH.c_ahtss;
TANBFPNH.c_aho = TANBFPNH.c_aho + TANBFPNH.c_ahoss;
TANBFPNH.c_bt = TANBFPNH.c_bt + TANBFPNH.c_btss;
TANBFPNH.c_bo = TANBFPNH.c_bo + TANBFPNH.c_boss;

TANBFPNH.c_art = max(TANBFPNH.c_art, eps);
TANBFPNH.c_aro = max(TANBFPNH.c_aro, eps);
TANBFPNH.c_aht = max(TANBFPNH.c_aht, eps);
TANBFPNH.c_aho = max(TANBFPNH.c_aho, eps);
TANBFPNH.c_bt = max(TANBFPNH.c_bt, eps);
TANBFPNH.c_bo = max(TANBFPNH.c_bo, eps);

TANBFPNH.c_ar = ces_agg(TANBFPNH.c_art, TANBFPNH.c_aro, TANBFPNH.eta, TANBFPNH.s_art);
TANBFPNH.c_ah = ces_agg(TANBFPNH.c_aht, TANBFPNH.c_aho, TANBFPNH.eta, TANBFPNH.s_aht);
TANBFPNH.c_b = ces_agg(TANBFPNH.c_bt, TANBFPNH.c_bo, TANBFPNH.eta, TANBFPNH.s_bt);



% labour supply

RAFAFP.l = RAFAFP.l + RAFAFP.lss;

RANBFP.l = RANBFP.l + RANBFP.lss;

TANBFP.l = TANBFP.l + TANBFP.lss;
TANBFP.l_r = TANBFP.l_r + TANBFP.l_rss;
TANBFP.l_h = TANBFP.l_h + TANBFP.l_hss;

TANBNR_FER.l = TANBNR_FER.l + TANBNR_FER.lss;
TANBNR_FER.l_r = TANBNR_FER.l_r + TANBNR_FER.l_rss;
TANBNR_FER.l_h = TANBNR_FER.l_h + TANBNR_FER.l_hss;

TANBNR_PIT.l = TANBNR_PIT.l + TANBNR_PIT.lss;
TANBNR_PIT.l_r = TANBNR_PIT.l_r + TANBNR_PIT.l_rss;
TANBNR_PIT.l_h = TANBNR_PIT.l_h + TANBNR_PIT.l_hss;

TANBFPNH.l = TANBFPNH.l + TANBFPNH.lss;
TANBFPNH.l_r = TANBFPNH.l_r + TANBFPNH.l_rss;
TANBFPNH.l_h = TANBFPNH.l_h + TANBFPNH.l_hss;


% discount vector
betas = zeros(1, 100);

for t = 1:length(betas)
  
  betas(1, t) = beta^(t - 1);
  
endfor



% welfare

RAFAFP.utility_a = log(RAFAFP.c_a) + psi * log(1 - RAFAFP.l);
RAFAFP.welfare_a = betas * RAFAFP.utility_a.';

RAFAFP.utility_b = log(RAFAFP.c_b);
RAFAFP.welfare_b = betas * RAFAFP.utility_b.';


RANBFP.utility_a = log(RANBFP.c_a) + psi * log(1 - RANBFP.l);
RANBFP.welfare_a = betas * RANBFP.utility_a.';

RANBFP.utility_b = log(RANBFP.c_b);
RANBFP.welfare_b = betas * RANBFP.utility_b.';


TANBFP.utility_ar = log(TANBFP.c_ar) + psi * log(1 - TANBFP.l_r);
TANBFP.welfare_ar = betas * TANBFP.utility_ar.';

TANBFP.utility_ah = log(TANBFP.c_ah) + psi * log(1 - TANBFP.l_h);
TANBFP.welfare_ah = betas * TANBFP.utility_ah.';

TANBFP.utility_b = log(TANBFP.c_b);
TANBFP.welfare_b = betas * TANBFP.utility_b.';


TANBNR_FER.utility_ar = log(TANBNR_FER.c_ar) + psi * log(1 - TANBNR_FER.l_r);
TANBNR_FER.welfare_ar = betas * TANBNR_FER.utility_ar.';

TANBNR_FER.utility_ah = log(TANBNR_FER.c_ah) + psi * log(1 - TANBNR_FER.l_h);
TANBNR_FER.welfare_ah = betas * TANBNR_FER.utility_ah.';

TANBNR_FER.utility_b = log(TANBNR_FER.c_b);
TANBNR_FER.welfare_b = betas * TANBNR_FER.utility_b.';


TANBNR_PIT.utility_ar = log(TANBNR_PIT.c_ar) + psi * log(1 - TANBNR_PIT.l_r);
TANBNR_PIT.welfare_ar = betas * TANBNR_PIT.utility_ar.';

TANBNR_PIT.utility_ah = log(TANBNR_PIT.c_ah) + psi * log(1 - TANBNR_PIT.l_h);
TANBNR_PIT.welfare_ah = betas * TANBNR_PIT.utility_ah.';

TANBNR_PIT.utility_b = log(TANBNR_PIT.c_b);
TANBNR_PIT.welfare_b = betas * TANBNR_PIT.utility_b.';


TANBFPNH.utility_ar = log(TANBFPNH.c_ar) + psi * log(1 - TANBFPNH.l_r);
TANBFPNH.welfare_ar = betas * TANBFPNH.utility_ar.';

TANBFPNH.utility_ah = log(TANBFPNH.c_ah) + psi * log(1 - TANBFPNH.l_h);
TANBFPNH.welfare_ah = betas * TANBFPNH.utility_ah.';

TANBFPNH.utility_b = log(TANBFPNH.c_b);
TANBFPNH.welfare_b = betas * TANBFPNH.utility_b.';



% import/export, trade balance in country A:
RAFAFP.import = RAFAFP.c_ao;
RAFAFP.export = RAFAFP.c_bt;
RAFAFP.nex = RAFAFP.export - RAFAFP.import;


RANBFP.import = RANBFP.c_ao;
RANBFP.export = RANBFP.c_bt;
RANBFP.nex = RANBFP.export - RANBFP.import;


TANBFP.import = chi * TANBFP.c_aro + (1 - chi) * TANBFP.c_aho;
TANBFP.export = TANBFP.c_bt;
TANBFP.nex = TANBFP.export - TANBFP.import;


TANBNR_FER.import = chi * TANBNR_FER.c_aro + (1 - chi) * TANBNR_FER.c_aho;
TANBNR_FER.export = TANBNR_FER.c_bt;
TANBNR_FER.nex = TANBNR_FER.export - TANBNR_FER.import;


TANBNR_PIT.import = chi * TANBNR_PIT.c_aro + (1 - chi) * TANBNR_PIT.c_aho;
TANBNR_PIT.export = TANBNR_PIT.c_bt;
TANBNR_PIT.nex = TANBNR_PIT.export - TANBNR_PIT.import;


TANBFPNH.import = chi * TANBFPNH.c_aro + (1 - chi) * TANBFPNH.c_aho;
TANBFPNH.export = TANBFPNH.c_bt;
TANBFPNH.nex = TANBFPNH.export - TANBFPNH.import;


%----------------------------------------------------------------
% 4. Plot IRFs
%----------------------------------------------------------------

% RAFAFP

subplot(3, 3, 1);
plot(1:100, RAFAFP.output, 1:100);
title('Output in country A');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 2);
plot(1:100, RAFAFP.price, 1:100, RAFAFP.p_tss);
title('Price index in country A and B');
xlabel('Quarters');
ylabel('Units of oil consumption');
subplot(3, 3, 3);
plot(1:99, RAFAFP.infl);
title('Inflation in country A and B');
xlabel('Quarters');
ylabel('Percent');
subplot(3, 3, 4);
plot(1:100, RAFAFP.c_a);
title('Consumption in Country A');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 5);
plot(1:100, RAFAFP.c_b);
title('Consumption in Country B');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 6);
plot(1:100, RAFAFP.import);
title('Import in Country A');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 7);
plot(1:100, RAFAFP.export);
title('Export in Country A');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 8);
plot(1:100, RAFAFP.nex);
title('Net export in Country A');
xlabel('Quarters');
ylabel('Units of tradeable cons.');

saveas(gcf, 'rafafp.jpg');


% RANBFP

subplot(3, 3, 1);
plot(1:100, RANBFP.output);
title('Output in country A');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 2);
plot(1:100, RANBFP.price);
title('Price index in country A and B');
xlabel('Quarters');
ylabel('Units of oil consumption');
subplot(3, 3, 3);
plot(1:99, RANBFP.infl);
title('Inflation in country A and B');
xlabel('Quarters');
ylabel('Percent');
subplot(3, 3, 4);
plot(1:100, RANBFP.c_a);
title('Consumption in Country A');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 5);
plot(1:100, RANBFP.c_b);
title('Consumption in Country B');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 6);
plot(1:100, RANBFP.import);
title('Import in Country A');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 7);
plot(1:100, RANBFP.export);
title('Export in Country A');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 8);
plot(1:100, RANBFP.nex);
title('Net export in Country A');
xlabel('Quarters');
ylabel('Units of tradeable cons.');

saveas(gcf, 'ranbfp.jpg');


% TANBFP

subplot(3, 3, 1);
plot(1:100, TANBFP.output);
title('Output in country A');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 2);
plot(1:100, TANBFP.price);
title('Price index in country A and B');
xlabel('Quarters');
ylabel('Units of oil consumption');
subplot(3, 3, 3);
plot(1:99, TANBFP.infl);
title('Inflation in country A and B');
xlabel('Quarters');
ylabel('Percent');
subplot(3, 3, 4);
plot(1:100, TANBFP.c_ar);
title('Consumption for Ricardians');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 5);
plot(1:100, TANBFP.c_ah);
title('Consumption for HTMs');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 6);
plot(1:100, TANBFP.c_b);
title('Consumption in Country B');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 7);
plot(1:100, TANBFP.import);
title('Import in Country A');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 8);
plot(1:100, TANBFP.export);
title('Export in Country A');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 9);
plot(1:100, TANBFP.nex);
title('Net export in Country A');
xlabel('Quarters');
ylabel('Units of tradeable cons.');

saveas(gcf, 'tanbfp.jpg');





% TANBNR_FER

subplot(3, 3, 1);
plot(1:100, TANBNR_FER.output);
title('Output in country A');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 2);
plot(1:100, TANBNR_FER.price);
title('Price index in country A and B');
xlabel('Quarters');
ylabel('Units of oil consumption');
subplot(3, 3, 3);
plot(1:99, TANBNR_FER.infl);
title('Inflation in country A and B');
xlabel('Quarters');
ylabel('Percent');
subplot(3, 3, 4);
plot(1:100, TANBNR_FER.c_ar);
title('Consumption for Ricardians');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 5);
plot(1:100, TANBNR_FER.c_ah);
title('Consumption for HTMs');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 6);
plot(1:100, TANBNR_FER.c_b);
title('Consumption in Country B');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 7);
plot(1:100, TANBNR_FER.import);
title('Import in Country A');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 8);
plot(1:100, TANBNR_FER.export);
title('Export in Country A');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 9);
plot(1:100, TANBNR_FER.nex);
title('Net export in Country A');
xlabel('Quarters');
ylabel('Units of tradeable cons.');

saveas(gcf, 'tanbnr_fer.jpg');



% TANBNR_PIT

subplot(5, 3, 1);
plot(1:100, TANBNR_PIT.output);
title('Output in country A');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(5, 3, 2);
plot(1:100, TANBNR_PIT.price_a);
title('Price index in country A');
xlabel('Quarters');
ylabel('Units of oil consumption');
subplot(5, 3, 3);
plot(1:100, TANBNR_PIT.price_b);
title('Price index in country B');
xlabel('Quarters');
ylabel('Units of oil consumption');
subplot(5, 3, 4);
plot(1:99, TANBNR_PIT.infl_a);
title('Inflation in country A');
xlabel('Quarters');
ylabel('Percent');
subplot(5, 3, 5);
plot(1:99, TANBNR_PIT.infl_b);
title('Inflation in country B');
xlabel('Quarters');
ylabel('Percent');
subplot(5, 3, 6);
plot(1:100, TANBNR_PIT.c_ar);
title('Consumption for Ricardians');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(5, 3, 7);
plot(1:100, TANBNR_PIT.c_ah);
title('Consumption for HTMs');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(5, 3, 8);
plot(1:100, TANBNR_PIT.c_b);
title('Consumption in Country B');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(5, 3, 9);
plot(1:100, TANBNR_PIT.import);
title('Import in Country A');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(5, 3, 10);
plot(1:100, TANBNR_PIT.export);
title('Export in Country A');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(5, 3, 11);
plot(1:100, TANBNR_PIT.nex);
title('Net export in Country A');
xlabel('Quarters');
ylabel('Units of tradeable cons.');

saveas(gcf, 'tanbnr_pit.jpg');



% TANBFPNH

subplot(3, 3, 1);
plot(1:100, TANBFP.output);
title('Output in country A');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 2);
plot(1:100, TANBFPNH.price);
title('Price index in country A and B');
xlabel('Quarters');
ylabel('Units of oil consumption');
subplot(3, 3, 3);
plot(1:99, TANBFPNH.infl);
title('Inflation in country A and B');
xlabel('Quarters');
ylabel('Percent');
subplot(3, 3, 4);
plot(1:100, TANBFPNH.c_ar);
title('Consumption for Ricardians');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 5);
plot(1:100, TANBFPNH.c_ah);
title('Consumption for HTMs');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 6);
plot(1:100, TANBFPNH.c_b);
title('Consumption in Country B');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 7);
plot(1:100, TANBFPNH.import);
title('Import in Country A');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 8);
plot(1:100, TANBFPNH.export);
title('Export in Country A');
xlabel('Quarters');
ylabel('Units of tradeable cons.');
subplot(3, 3, 9);
plot(1:100, TANBFPNH.nex);
title('Net export in Country A');
xlabel('Quarters');
ylabel('Units of tradeable cons.');

saveas(gcf, 'tanbfpnh.jpg');
