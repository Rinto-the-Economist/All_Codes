# This file contains the iterative solver for the stationary distribution. It first transforms the asset policy 
# matrix into a transition matrix. This is a mapping between the current and next period's asset holdings.
# Then, it combines this transition matrix with the income transition matrix to produce a mapping between 
# an income-asset pair in the current period and an income-asset pair in the next period. Finally, 
# it iteratively solves for a stationary distribution μ(b,y).
#
# The inputs are:
# - sol_v: a named tuple containing the solution to the value function
# - x_int: an initial guess for the distribution
# - params: a named tuple containing the model parameters
#
# The outputs are:
# - trans_mat: the transition matrix
# - x_ss: the stationary distribution

function solve_g(;sol_v=sol_v,x_int=x_int,params=params)
    @unpack y_num, tol_KFE, max_iter_KFE = params  # Unpack tolerance and maximum iterations from params
    
    B_next       = sol_v.B_next  # Next period's assets holdings
    B_num_all    = size(B_next)[1]  # Number of assets holdings
    B_grid_large = kron(ones(y_num), sol_v.B_grid)  # Large grid for assets holdings
    pi_mat       = sol_v.pi_mat  # Transition matrix for income
    
    trans_mat = zeros(B_num_all, B_num_all)  # Initialize transition matrix assets
    for i = 1:B_num_all
        for j = 1:B_num_all
            if B_next[i] == B_grid_large[j]  # Check if next period's assets holding matches grid
                trans_mat[i, j] = 1  # Set transition probability to 1
            end
        end
    end

    B_num_small = Int(B_num_all / y_num)  # Define a smaller number of assets holdings
    y_mat       = kron(pi_mat, ones(B_num_small, B_num_small))  # Kronecker product of income transition matrix and ones matrix
    trans_mat   = trans_mat .* y_mat  # Element-wise multiplication of transition matrices

    findmax(sum(trans_mat, dims = 2))  # Find the maximum sum of rows in transition matrix (sanity check, should equal 1)
    findmin(sum(trans_mat, dims = 2))  # Find the minimum sum of rows in transition matrix

    if x_int == 0 
         x_int = ones(size(B_grid_large)[1]) ./ size(B_grid_large)[1]  # Initialize distribution if x_int is zero
    else 
        x_int = x_int  # Use provided initial distribution
    end
 
    x = copy(x_int)  # Copy initial distribution

    # iteratively solve for the stationary distribution
    for k = 1:max_iter_KFE
        x_old = copy(x)  # Copy current distribution
        x = trans_mat' * x  # Update distribution using transition matrix
        if findmax(abs.(x - x_old))[1] < tol_KFE  # Check for convergence
            println("CONV stationary distn. after $k iterations.")  # Print convergence message
            break  # Exit loop if converged
        end
    end

    return (trans_mat = trans_mat, x_ss = x)  # Return transition matrix and stationary distribution
end

