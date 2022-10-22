function [hat_x_1,hat_theta_FCT_1] = cal_hat_x_1(Psi_1, hat_theta_1, omega_1)
% equation(11)&(12)
    global hat_theta_1_0;
    omega_1_c = clipping_func(omega_1,1);
    hat_theta_FCT_1 = (1/(1 - omega_1_c))*(hat_theta_1 - omega_1_c * hat_theta_1_0);
    hat_x_1 = Psi_1 * hat_theta_FCT_1;
end

