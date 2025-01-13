# This file contains the value function iteration algorithm.
# The inputs are:
# - params: a named tuple containing the model parameters
# - v_int: an initial guess for the value function
# 
# The outputs are:
# - c_sol: the consumption solution
# - convergence_v: a boolean indicating whether the value function iteration converged
# - v_vec: the value function
# - B_grid: the grid of asset holdings
# - y_grid: the grid of income values
# - pi_mat: the transition matrix
# - B_next: the asset holdings in the next period

function solve_v(;params = params,v_int=v_int)
    @unpack B_num, B_lower, B_upper, y_num, y_upper, ρ, β, r, γ, κ, ϕ, max_iter_HJB, tol_HJB = params

    # Create a grid for B in levels
    B_grid = LinRange(B_lower, B_upper, B_num)
    # Generate transition matrix and log of y grid using rouwenhorst method
    pi_mat, logy_grid = rouwenhorst(ρ, y_upper, y_num)
    # Exponentiate logy_grid to get y_grid
    y_grid = exp.(logy_grid)

    convergence_v = false
    
    # Initialize value function v_0
    if v_int == 0
        v_0 = -ones(y_num*B_num)
    else 
        v_0 = v_int
    end
    v_vec = copy(v_0)
    # Compute expected value function E_v
    E_v = reshape(reshape(v_vec,B_num,y_num)*pi_mat',B_num*y_num)
    policy_function = zeros(B_num*y_num)
    
    # Utility function
    function u(c,b)
        if c>0
            return (c^(1-γ)/(1-γ)) + ϕ*((κ+b)^(1-γ)/(1-γ))
        else
            return -Inf
        end
    end

    # compute the asset holding vector b_vec
    b_vec = kron(ones(y_num), kron(B_grid, ones(B_num)))

    # Compute consumption vector c_vec
    c_vec = (1+r)*b_vec - kron(ones(y_num), kron(ones(B_num),B_grid)) + kron(y_grid,ones(B_num*B_num))

    # compute the asset holding vector b_vec
    #b_vec = kron(ones(y_num), kron(ones(B_num),B_grid))

    # Compute consumption vector c_vec
    #c_vec = (1+r)*kron(ones(y_num), kron(B_grid, ones(B_num))) - b_vec + kron(y_grid,ones(B_num*B_num))

    # compute utility
    u_c_vec = u.(c_vec, b_vec)
    
    # Iterate to solve the HJB equation
    for l = 1:max_iter_HJB
        v_continue=[]
        for i=1:y_num
            v_continue = [v_continue; kron(ones(B_num),E_v[B_num*(i-1)+1:B_num*(i)])]
        end
        
        # Compute the value function for the next iteration
        v_vec_big = u_c_vec + β*v_continue
        v_vec_old = copy(v_vec)
 
        # Update the value function
        for i=1:B_num*y_num
            v_vec[i] = findmax(v_vec_big[1+B_num*(i-1):B_num*i])[1]
        end
        
        # Update the expected value function E_v
        E_v = reshape(reshape(v_vec,B_num,y_num)*pi_mat',B_num*y_num)
        # Check for convergence
        if findmax(abs.(v_vec-v_vec_old))[1]< tol_HJB
            for i=1:B_num*y_num 
                policy_function[i] = Int(findmax(v_vec_big[1+B_num*(i-1):B_num*i])[2])
            end 
            convergence_v = true
            break
        end
    end
    println("convergence_v: ",convergence_v)
    
    # Compute the next period's B values
    B_next = [B_grid[Int(policy_function[i])] for i in 1:(B_num * y_num)]
    # Compute the consumption solution
    c_sol = (1+r)*kron(ones(y_num),B_grid)-B_next + kron(y_grid,ones(B_num))
    c_sol = max.(c_sol, 0)
    
    # Return the results
    return (
        c_sol=c_sol,
        convergence_v=convergence_v,
        v_vec=v_vec,
        B_grid = B_grid,
        y_grid= y_grid,
        pi_mat=pi_mat,
        B_next=B_next
        )
end
