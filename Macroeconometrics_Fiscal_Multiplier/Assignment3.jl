
#--------------------------------------------------------
# Title: Macroeconometrics Assignment 3
# Author: -----
# Date: 17/03/2024
# Comments:
#
#
#--------------------------------------------------------



#--------------------------------------------------------
# 0. Preamble
#--------------------------------------------------------

using Plots
using HypothesisTests
using DataFrames
using StatsBase
using LinearAlgebra
using Distributions
using Dates
using ForwardDiff
using Optim
include("marketdata_functions.jl")

cd("/home/rinto/Desktop/Macroeconometrics/Assignment 3")

function VAR(y, p)
    T = size(y, 1)
    k = size(y, 2) 
    Y = y[p+1:end, :]
    X = [ones(T-p) [y[p + 1 - i:end - i, :] for i in 1:p]...]
    B̂ = inv(X'X)*X'Y
    ε̂ = Y - X*B̂
    Σ̂ = (ε̂'*ε̂)/(T - p)
    return B̂, Σ̂, ε̂
end

VAR(y::TimeArray, p) = VAR(values(y), p)


function likelihood(pars, y)
    # calculates the log-likelihood for only p = 1 lag
    T = size(y, 1) 
    ψ₀⁺= [pars[1] pars[3]; pars[4] pars[5]] 
    ψ₀⁻= [pars[2] pars[3]; pars[4] pars[5]] 
    c = [pars[6]; pars[7]]
    ψ₁ = [pars[8] pars[9]; pars[10] pars[11]]
    x = y[1:end-1, :]
    y = y[2:end, :]

    try
        L = 0.0
        for t in 1:T-1
            if y[t] > 0
                # need to be computed manually from expression derived in Q3
                L += log(det(ψ₀⁺)) - log(2*π) - 1/2 * (ψ₀⁺*y[t, :] - c - ψ₁*x[t, :])'*(ψ₀⁺*y[t, :] - c - ψ₁*x[t, :])
            else
                L += log(det(ψ₀⁻)) - log(2*π) - 1/2 * (ψ₀⁻*y[t, :] - c - ψ₁*x[t, :])'*(ψ₀⁻*y[t, :] - c - ψ₁*x[t, :])
            end
        end
        return L
    catch
        return -Inf
    end
end

likelihood(pars, y::TimeArray) = likelihood(pars, values(y))


function μΦ(B, k, p)
    μ = B[1, :]
    Φ = hcat([B[((i-1)*k:i*k - 1) .+ 2, :]' for i in 1:p]...)
    return μ, Φ
end;


function F(Φ, k, p)
    F = [Φ; 
         I(k*(p-1)) zeros(k*(p-1), k)]
    return F
end


function Cₛ(B̂, h)
    k = size(B̂, 2)
    p = (size(B̂, 1) - 1) ÷ k
    Φ̂ = μΦ(B̂, k, p)[2]
    FΦ̂ = F(Φ̂, k, p)
    #C = (FΦ̂^h)[1:k, 1:k]
    C = map(i -> (FΦ̂^i)[1:k, 1:k], h)
    return C
end


function SIRF(B̂, Σ̂, h)
    # obtain the h-step ahead reduced form responses
    C = Cₛ(B̂, h)
    # obtain lower triangular Choleski factor
    Θ̂₀ = cholesky(Σ̂).L
    # for each (i, j) collect [Θ̂ₕ]ᵢⱼ
    Θ̂ₕ = cat(map(c -> c*Θ̂₀, C)...; dims = 3)
    return Θ̂ₕ
end


#--------------------------------------------------------
# 1. Data Download
#--------------------------------------------------------

gdp = retrieve_marketdata(source = "fred", identifier = "A191RL1A225NBEA")
MarketData.rename!(gdp, :GDP)

surplus = retrieve_marketdata(source = "fred", identifier = "FYFSGDA188S")
MarketData.rename!(surplus, :SUR)

y = merge(gdp, surplus);


#--------------------------------------------------------
# 2. Test Linearity
#--------------------------------------------------------

B̂, Σ̂, ε̂ = VAR(y, 1);
size(ε̂[1, :]' )
size(ε̂[1, :])

L₀̂  = 0.0;
p = 1;
T = size(y, 1);
for t in 1:T-p
    L₀̂ += -1/2 * (ε̂[t, :]' * inv(Σ̂) * ε̂[t, :]) - log(2*π) - 1/2 * log(det(Σ̂));
end 

L₀̂ 


# Set initial values
a = vec(inv(cholesky(Σ̂)));
init_pars = [a[1]; a[1:end]; rand(6)];

# Minimize function by calling optimize
# pars ordered as [ψ₀₁₁⁺, ψ₀₁₁⁻, ψ₀₁₂, ψ₀₂₁, ψ₀₂₂, c₁, c₂, ψ₁₁₁, ψ₁₁₂, ψ₁₂₁, ψ₁₂₂]
sol = optimize(pars -> -likelihood(pars, y), init_pars, BFGS(); autodiff = :forward)

L̂ = -sol.minimum

LR = 2 * (L̂ - L₀̂)

p = ccdf(Chisq(1), LR)

H = 0:10
Θ̂ = SIRF(B̂, Σ̂, H);

fig = plot(H, vec(eachslice(Θ̂; dims = (1,2))), layout = (2,2), legend = :none, 
title = permutedims([i*" on "*j for i in ["GDP", "Surplus"] for j in ["GDP", "Surplus"]]),
titlefontsize = 6, xticks = 0:6:60, dpi = 300)

# ordered as [ψ₀₁₁⁺, ψ₀₁₁⁻, ψ₀₁₂, ψ₀₂₁, ψ₀₂₂, c₁, c₂, ψ₁₁₁, ψ₁₁₂, ψ₁₂₁, ψ₁₂₂]
ψ̂ = sol.minimizer
ĉ = [ψ[6] ψ[7]]
Ψ₀⁺̂ = [ψ[1] ψ[3]; ψ[4] ψ[5]]
Ψ₀⁻̂ = [ψ[2] ψ[3]; ψ[4] ψ[5]]
Ψ₁̂ = [ψ[8] ψ[9]; ψ[10] ψ[11]]

# compute the SIRFS
B⁺̂ = vcat(ĉ, Ψ₀⁺̂)
B⁻̂ = vcat(ĉ, Ψ₀⁻̂)
Cₕ⁺̂ = Cₛ(B⁺̂ , H)
Θ₀⁺̂ = inv(Ψ₀⁺̂)
Θ₀⁻̂ = inv(Ψ₀⁻̂)
# unit-effect normalisation
Θ₀₁₁⁺̂ = Θ₀⁺̂[1, 1];
Θ₀⁺̂  = Θ₀⁺̂  ./ Θ₀₁₁⁺̂ ;
Θₕ⁺̂ = cat(map(c -> c*Θ₀⁺̂ , Cₕ⁺̂ )...; dims = 3)
Θ₀₂₂⁻̂ = Θ₀⁻̂[2, 2];
Θ₀⁻̂ = Θ₀⁻̂ ./ Θ₀₂₂⁻̂ ;
Θₕ⁻̂ = cat(map(c -> c*Θ₀⁻̂ , Cₕ⁺̂ )...; dims = 3)

Θ̂ₕ = zeros(2, 2, 11)

# for each slice of the SIRF, combine the 1st column of Θₕ⁺̂  with the second column 
# of Θ₀⁻̂ , since a GDP shock will have a positive impact on y₁ₜ while a surplus shock
# will have a negative effect on y₁ₜ
for i in 1:11
    Θ̂ₕ[:, :, i] = hcat(eachslice(Θₕ⁺̂[:, 1, :]; dims = 2)[i], eachslice(Θₕ⁻̂[:, 2, :]; dims = 2)[i])
end 

fig = plot(H, vec(eachslice(Θ̂ₕ; dims = (1,2))), layout = (2,2), legend = :none, 
title = permutedims([i*" on "*j for i in ["GDP", "Surplus"] for j in ["GDP", "Surplus"]]),
titlefontsize = 6, xticks = 0:6:60, dpi = 300)

