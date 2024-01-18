function Newton_solve(f, x0, f_prime, atol, rtol, maxit)
    print("solve newton")
end

function findroot(f, x0, f_prime=nothing; method::Function, atol=1e-3, rtol=1e-3, maxit=100)
    print("Newton")
    method(f, x0, f_prime, atol, rtol, maxit)
end

function RelaxedNewton_solve(f, x0, alpha, f_prime, atol, rtol, maxit)
    print("solve relaxednewton")
end

function findroot(f, x0, alpha, f_prime=nothing; method::typeof(RelaxedNewton_solve), atol=1e-3, rtol=1e-3, maxit=100)
    print("RelaxedNewton")
    method(f, x0, alpha, f_prime, atol, rtol, maxit)
end


findroot(x->sin(x), 1, 0.5; method=RelaxedNewton_solve)


# Structure:
# 1. method_solve(...) function for each newton method, takes all arguments
# 2. findroot(...) function which is dispatched on the type of the keyword argument 'method', calls right solve method
# think about a more DifferentialEquations.jl type way, this seems to include some unnecessary work