global A;
global C;
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

global hat_theta_1_0;

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
