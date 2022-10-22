 
%% set the simulation time
 FCT_GPEBO_settings;
 global tspan;
 global init_conds;

%% set the initial condition
[t,y]=ode45(@FCT_GPEBO_func,tspan,init_conds);

%% show results
