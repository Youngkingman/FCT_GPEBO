 
%% set the simulation time
close all;
clear

 FCT_GPEBO_settings;
 global tspan;
 global init_conds;
 global mathcal_T;

 %% run simulation
[t,y]=ode45(@FCT_GPEBO_func, tspan, init_conds);

%% show results, 由于ode45是变步长没法函数里直接添加结果，所以结果还得算一遍hat_x
Phi = y(:, 12:47);
hat_theta_1 = y(:,10:11);
omega_1 = y(:,9);
hat_theta_2 = y(:,73:76);
omega_2 = y(:,72);

[hat_x_1,hat_x_2] = cal_hat_x_vec(Phi, hat_theta_1, omega_1, hat_theta_2, omega_2 ,t);
x_1 = y(:, 1:2);
x_2 = y(:,48:51);

%% 出图

% fig1
figure();
plot(t,hat_x_1 - x_1);
figure();
plot(t,hat_x_2 - x_2);

% fig2
figure();
plot(t, (mathcal_T * [x_1, x_2]')');
figure();
plot(t, (mathcal_T * [hat_x_1, hat_x_2]')');