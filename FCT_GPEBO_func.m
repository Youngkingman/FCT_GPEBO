function xdot = FCT_GPEBO_func(t,x)
xdot = zeros(76,1);
%% simulation for agent 1
    global C_11;
    global A_11;

    % find the current state variables of equation(9)
    x_1 = x(1:2);
    y_1 = C_11 * x_1;
    Y_1 = x(3:4);
    Omega_1  = reshape(x(5:8),[2,2]);
    omega_1 = x(9);
    hat_theta_1 = x(10:11);
    
    % calculate the middle variables of equation (10)
    Psi_1 = C_11 * expm(A_11 * t);
    Gamma_1 = adjoint(Omega_1) * Y_1;
    Delta_1 = det(Omega_1);
    
    % get the derivatives of equation(9)
    [dot_Y_1, dot_Omega_1, dot_omega_1, dot_hat_theta_1] = ...
    FCT_GPEBO_agent1_func(y_1,Y_1, Omega_1,Psi_1,Delta_1,omega_1,Gamma_1,hat_theta_1);
    
    % update the dynamics(9)
    xdot(1:2) = A_11 * x_1;
    xdot(3:4) = dot_Y_1;
    xdot(5:8) = reshape(dot_Omega_1,[4,1]);
    xdot(9) = dot_omega_1;
    xdot(10:11) = dot_hat_theta_1; 
   
    % the estimation value of agent 1
    [~,theta_FCT_1] = cal_hat_x_1(Psi_1, hat_theta_1, omega_1);

%% simulation for agent 2
    global C_21;
    global C_22;
    global A_21;
    global A_22;

%     n2 = 4;
%     Phi_st = hat_theta_1_st + n1; % (n1+n2)^2 dimension
%     x_2_st = Phi_st + (n1 + n2)^2; % n2 dimension
%     Y_2_st = x_2_st + n2;   % n2 dimension
%     Omega_2_st = Y_2_st + n2;
%     omega_2_st = Omega_2_st + (n2 * n2);
%     hat_theta_2_st = omega_2_st + 1;
     
    
    % find the current state variables of equation(23)
    Phi_2 = reshape(x(12:47),[6,6]); 
    x_2 = x(48:51);
    y_2 = C_21 * x_1 + C_22 * x_2;
    Y_2 = x(52:55);
    Omega_2 = reshape(x(56:71),[4, 4]);
    omega_2 = x(72);
    hat_theta_2 = x(73:76);

    % calculate the middle variables of equation(22 & 24)
    [purturbed_y, Psi_2] = perturbedLRE(Phi_2,y_2,theta_FCT_1);
    Gamma_2 = adjoint(Omega_2) * Y_2;
    Delta_2 = det(Omega_2);
    
    % get the derivative of equation(23)
    [dot_Phi_2, dot_Y_2, dot_Omega_2, dot_omega_2, dot_hat_theta_2] = ... 
    FCT_GPEBO_agent2_func(Phi_2, purturbed_y, Y_2, Omega_2, Psi_2, Delta_2, omega_2, Gamma_2, hat_theta_2);
    
    % update the dynamics(23)
    xdot(12:47) = reshape(dot_Phi_2,[36,1]); 
    xdot(48:51) = A_21 * x_1 + A_22 * x_2;
    xdot(52:55) = dot_Y_2;
    xdot(56:71) = reshape(dot_Omega_2,[16,1]);
    xdot(72) = dot_omega_2;
    xdot(73:76) = dot_hat_theta_2;

    % the estimation value of agent 2
%     [hat_x_2, hat_theta_FCT_2] = cal_hat_x_2(Phi_2,hat_theta_2,omega_2,theta_FCT_1);
end

