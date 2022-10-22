function omega_1c = clipping_func(omega_1)
% part of equation(12)
    global mu_1;
    if omega_1 < 1 - mu_1
        omega_1c = omega_1;
    else
        omega_1c = 1 - mu_1;
    end
end

