function [dot_Phi_2, dot_Y_2, dot_Omega_2, dot_omega_2, dot_hat_theta_2] = ... 
FCT_GPEBO_agent2_func(Phi_2, y_2, Y_2, Omega_2, Psi_2, Delta_2, omega_2, Gamma_2, hat_theta_2)
%{
    inputs: Phi_2, 23a
            Y_2, 23b
            y_2, 23b
            Omega_2, 23c
            Psi_2 
            
%}
global lambda_2;
global gamma_2;
global A; %  动力学本身要求全局信息了
 
dot_Phi_2 = A * Phi_2;
dot_Y_2 = -lambda_2 * Y_2 + lambda_2 * Psi_2' * y_2;
dot_Omega_2 = -lambda_2 * Omega_2 + lambda_2 * (Psi_2' * Psi_2);
dot_omega_2 = -gamma_2 * (Delta_2^2) * omega_2;
dot_hat_theta_2 = gamma_2 * Delta_2 * (Gamma_2 - Delta_2 * hat_theta_2);

end