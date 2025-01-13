# this file contains parameters for the model

params_bl = @with_kw ( 
    B_lower         = 0, # lower bound of asset holdings in levels
    B_upper         = 10, # upper bound of asset holdings in levels
    B_num           = 1000, # number of grid points for asset holdings
    y_lower         = -1, # lower bound of log income
    y_upper         = 1, # upper bound of log income
    y_num           = 3, # number of grid points for income
    β               = .85, # discount factor
    γ               = 1.5, # risk aversion
    r               = .1, # interest rate
    ρ               = .88, # persistence of income process
    κ               = .13, # curvature of utility to asset
    ϕ               = 1.5, # sensitivity of utility to asset holdings
    max_iter_HJB    = 1000, # maximum number of iterations for value function iteration
    tol_HJB         = 1e-5, # tolerance for value function iteration
    max_iter_KFE    = 1000, # maximum number of iterations for stationary distr.
    tol_KFE         = 1e-5, # tolerance for stationary distr. iteration
)