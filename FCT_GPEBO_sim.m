 sim_time = 10;
 time_step = 0.1;
 tspan = (0:time_step:sim_time);
[t,y]=ode45(@FCT_GPEBO_func,tspan,x0);