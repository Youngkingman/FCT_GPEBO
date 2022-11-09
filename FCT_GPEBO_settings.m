global A;
global C;
global mathcal_T; 

global lambda_1;
global lambda_2;
global gamma_1;
global gamma_2;
global mu_1;
global mu_2;

global A_11;
global A_21;
global A_22;
global C_11;
global C_21;
global C_22;



hat_theta_1_0;
hat_theta_2_0;

global init_conds;
global tspan;


% the global state matrices
A = [   -1,        0,    0,    0,   0, 0;
         0,       -1,    0,    0,   0, 0;
         0,   -1.4142,  -1,   -2,   1, 1;
      0.7071,  0.7071,   1,    1,   0, 0;
      6.3640,  4.9497,  -1,    1,  -2, 0;
      -2.8284, -2.8284, 0.5, -0.5, 0, -4];

C = [-2.1213  0.7071 0 0 0 0;
     -2.1213 -0.7071 0 0 0 0;
     -1.4142 -1.4142 5 0 0 3;];

mathcal_T = [-0.7071 -0.7071 0 0 0 0;
                0       0    0 1 0 0;
                0       0    1 0 0 0;
             -0.7071 0.7071  0 0 0 0;
                0       0    0 0 1 0;
                0       0    0 0 0 1];

A_11 = A(1:2,1:2);
A_21 = A(3:6,1:2);
A_22 = A(3:6,3:6);

C_11 = C(1:2,1:2);
C_21 = C(3:3,1:2);
C_22 = C(3:3,3:6);

% the tunning parameters
lambda_1 = 1;
gamma_1  = 5;
mu_1 = 0.05;

lambda_2 = 0.8;
gamma_2 = 20;
mu_2 = 0.1;

% the initial values
n1 = 2; n2 = 4;

% the state inital condition
bar_x_0 = [1 3 -2 -3 -1 2]'; 
x_0 = inv(mathcal_T)*bar_x_0 ;
% x_0 = bar_x_0;

% agent1
    Y_1_0 = zeros(n1,1);
    Omega_1_0 = zeros(n1, n1);
    omega_1_0 = 1;
    hat_theta_1_0 = zeros(n1, 1);

% agent2
    Phi_2_0 = eye(n1 + n2);
    Y_2_0 = zeros(n2, 1);
    Omega_2_0 = zeros(n2, n2);
    omega_2_0 = 1;
    hat_theta_2_0 = zeros(n2, 1);

% set the intial values of agent 1
init_conds = zeros(76,1);
init_conds(1:2) = x_0(1:2);
init_conds(3:4) = Y_1_0;
init_conds(5:8) = reshape(Omega_1_0,[4,1]);
init_conds(9) = omega_1_0; 
init_conds(10:11) = hat_theta_1_0;

% set the intial values of agent 2
init_conds(12:47) = reshape(Phi_2_0,[36,1]);
init_conds(48:51) = x_0(3:6);
init_conds(52:55) = Y_2_0;
init_conds(56:71) = reshape(Omega_2_0,[16,1]);
init_conds(72) = omega_2_0;
init_conds(73:76) = hat_theta_2_0;

% simulation settings
sim_time = 10;
time_step = 0.01;
tspan = (0:time_step:sim_time);
