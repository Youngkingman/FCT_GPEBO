function [py, Psi_2]= perturbedLRE(Phi,y_2,hat_theta_FCT_1)
global C_21;
global C_22;

Phi_11 = Phi(1:2,1:2);
Phi_21 = Phi(3:6,1:2);
Phi_22 = Phi(3:6,3:6);

% calculate the perturbedLRE for agent 2
    py = y_2 - (C_21 * Phi_11 + C_22 * Phi_21)*hat_theta_FCT_1;
    Psi_2 = C_22 * Phi_22;
end

