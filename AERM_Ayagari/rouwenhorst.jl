# This file computes a grid and a transition matrix using the Rouwenhorst method

# Inputs:
# ρ: persistence parameter
# N_y: number of grid points
# N_bound: lower/upper bound of the grid

# Outputs:
# Π_new: transition matrix
# logy: grid of log values

function rouwenhorst(ρ, N_bound, N_y)
    # Calculate the probability p
    p = (ρ + 1) / 2
    
    # Calculate the lower/upper bound N_bound
    #N_bound = sqrt(σᵤ² / (1 - ρ^2) * (N_y - 1))

    # Initialize the transition matrix for N_y = 2
    Π_new = [p 1-p; 1-p p]

    # Iteratively build the transition matrix for larger N_y
    for i in 3:N_y
        Π_old = Π_new

        # Create zero matrices for the new transition matrix
        topleft = zeros(i, i)
        topright = zeros(i, i)
        bottomleft = zeros(i, i)
        bottomright = zeros(i, i)

        # Fill the submatrices with the old transition matrix
        topleft[1:i-1, 1:i-1] = Π_old
        topright[1:i-1, 2:i] = Π_old
        bottomleft[2:i, 1:i-1] = Π_old
        bottomright[2:i, 2:i] = Π_old

        # Combine the submatrices to form the new transition matrix
        Π_new = p .* topleft + (1 - p) .* topright + (1 - p) .* bottomleft + p .* bottomright
    end

    # Normalize the rows of the transition matrix
    for i in 1:N_y
        Π_new[i, :] = Π_new[i, :] ./ sum(Π_new[i, :])
    end

    # Create the grid of log values
    logy = collect(range(-N_bound, N_bound, N_y))

    # Return the transition matrix and the grid
    return Π_new, logy
end