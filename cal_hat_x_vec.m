function [hat_x_1,hat_x_2] = cal_hat_x_vec(Phi, hat_theta_1, omega_1, hat_theta_2, omega_2 ,t)
    global C_11;
    global A_11;
    global hat_theta_1_0;
    global hat_theta_2_0;

    hat_x_1 = zeros(length(t), 2);
    hat_x_2 = zeros(length(t), 4);
    
    for i=1:length(t)
        % calculate hat_x_1
        Psi_1_i = C_11 * expm(A_11 * t(i)); 
        omega_1_c = clipping_func(omega_1(i),1);
        hat_theta_FCT_1 = (1/(1 - omega_1_c)) * (hat_theta_1(i) - omega_1_c * hat_theta_1_0);
        hat_x_1(i,:) = (Psi_1_i * hat_theta_FCT_1)';
        
        % calculate hat_x_2
        Phi_i = reshape(Phi(i,:)',[6,6]);
        Phi_21 = Phi_i(3:6,1:2);
        Phi_22 = Phi_i(3:6,3:6);
        omega_2_c = clipping_func(omega_2(i),2);
        hat_theta_FCT_2 = (1/(1 - omega_2_c))*(hat_theta_2(i) - omega_2_c * hat_theta_2_0);
        hat_x_2(i,:) = (Phi_21 * hat_theta_FCT_1 + Phi_22 * hat_theta_FCT_2)';
    end
   
end


