function [hat_x_2,hat_theta_FCT_2] = cal_hat_x_2(Phi, hat_theta_2, omega_2, hat_theta_FCT_1)
Phi_21 = Phi(3:6,1:2);
Phi_22 = Phi(3:6,3:6);
% equation(25)
    global hat_theta_2_0;
    omega_2_c = clipping_func(omega_2,2);
    hat_theta_FCT_2 = (1/(1 - omega_2_c))*(hat_theta_2 - omega_2_c * hat_theta_2_0);
    hat_x_2 = Phi_21 * hat_theta_FCT_1 + Phi_22 * hat_theta_FCT_2;
end
