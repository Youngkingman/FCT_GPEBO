function omega_c = clipping_func(omega,id)
% part of equation(12) or equation(25)
    global mu_1;
    global mu_2;
    
    mu = mu_1;

    if id == 2
        mu = mu_2;
    end
    
    if omega < (1 - mu)
        omega_c = omega;
    else
        omega_c = 1 - mu;
    end
end

