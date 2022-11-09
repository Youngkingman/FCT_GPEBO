function [hat_x_1,hat_x_2,hat_theta_FCT_1_vec,hat_theta_FCT_2_vec] = cal_hat_x_vec(Phi, hat_theta_1, omega_1, hat_theta_2, omega_2 ,t)
    global C_11;
    global A_11;

    hat_x_1 = zeros(length(t), 2);
    hat_x_2 = zeros(length(t), 4);

    hat_theta_FCT_1_vec = zeros(length(t),2);
    hat_theta_FCT_2_vec = zeros(length(t),4);
    
    for i = 1:length(t)
        t(i)
        % calculate hat_x_1
        Psi_1_i = C_11 * expm(A_11 * t(i)); 
        [hat_x_1_i, hat_theta_FCT_1] = cal_hat_x_1(Psi_1_i, hat_theta_1(i,:)', omega_1(i));
        hat_x_1(i,:) = hat_x_1_i';

        hat_theta_FCT_1_vec(i,:) = hat_theta_FCT_1';
        
        % calculate hat_x_2
        Phi_i = reshape(Phi(i,:)',[6,6]);
        [hat_x_2_i, hat_theta_FCT_2] = cal_hat_x_2(Phi_i, hat_theta_2(i,:)',omega_2(i),hat_theta_FCT_1);
        hat_x_2(i,:) = hat_x_2_i';

        hat_theta_FCT_2_vec(i,:) = hat_theta_FCT_2';
    end
end


