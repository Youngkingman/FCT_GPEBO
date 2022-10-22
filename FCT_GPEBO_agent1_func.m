function [dot_Y_1, dot_Omega_1, dot_omega_1, dot_hat_theta_1] = FCT_GPEBO_agent1_func(y_1,Y_1, Omega_1,Psi_1,Delta_1,omega_1,Gamma_1,hat_theta_1)
%{
    inputs: Y_1, 9a
            y_1, 9a
            Omega_1, 9b
            Psi_1, 9a 9b
            Delta_1, 9c 9d
            omega_1 9c
            Gamma_1 9d
            hat_theta_1 9d
%}
global lambda_1;
global gamma_1;

dot_Y_1 = -lambda_1 * Y_1 + lambda_1 * Psi_1' * y_1;
dot_Omega_1 = -lambda_1 * Omega_1 + lambda_1 * (Psi_1' * Psi_1);
dot_omega_1 = -gamma_1 * (Delta_1^2)*omega_1;
dot_hat_theta_1 = gamma_1 * Delta_1 * (Gamma_1 - Delta_1 * hat_theta_1);

end

