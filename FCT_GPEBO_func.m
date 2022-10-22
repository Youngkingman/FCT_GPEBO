function xdot = FCT_GPEBO_func(t,x)
xdot = zeros(300,1);
%% simulation for agent 1
    global C_11;
    global A_11;
    
    n1 = 2;
    x_1_st = 1; % n1 dimension
    Y_1_st = 1 + n1; % n1 dimension
    Omega_1_st = 1 + n1 + n1; % n1 * n1 dimention
    omega_1_st = 1 + n1 + n1 + n1 * n1; % 1 dimension
    hat_theta_1_st = 1 + n1 + n1 + n1 * n1 + 1; % n1 dimension 

    % find the current state variables of equation(9)
    x_1 = x(x_1_st:x_1_st + n1 - 1);
    y_1 = C_11 * x_1;
    Y_1 = x(Y_1_st:Y_1_st + n1 - 1); % n1 dimension
    Omega_1 = reshape(x(Omega_1_st:Omega_1_st + n1 * n1 - 1),[n1,n1]); % n1 * n1 dimension
    omega_1 = x(omega_1_st); % 1 dimension
    hat_theta_1 = x(hat_theta_1_st : hat_theta_1_st + n1 - 1); % n1 dimension
    
    % calculate the middle variables of equation (10)
    Psi_1 = C_11 * expm(A_11*t);
    Gamma_1 = adjoint(Omega_1);
    Delta_1 = det(Omega_1);
    
    % get the derivatives of equation(9)
    [dot_Y_1, dot_Omega_1, dot_omega_1, dot_hat_theta_1] = ...
    FCT_GPEBO_agent1_func(y_1,Y_1, Omega_1,Psi_1,Delta_1,omega_1,Gamma_1,hat_theta_1);
    
    % update the dynamics(9)
    xdot(x_1_st:x_1_st + n1 - 1) = A_11*x(x_1_st:x_1_st + n1 - 1);
    xdot(Y_1_st:Y_1_st + n1 - 1) = dot_Y_1;
    xdot(Omega_1_st:Omega_1_st + n1 * n1 - 1) = reshape(dot_Omega_1,[n1*n1,1]);
    xdot(omega_1_st) = dot_omega_1;
    xdot(hat_theta_1_st : hat_theta_1_st + n1 - 1) = dot_hat_theta_1; 
    
    % the estimation value of agent 1
    hat_x = cal_hat_x_1(Psi_1, hat_theta_1, omega_1);
%% simulation for agent 2
    n2 = 4;
end

