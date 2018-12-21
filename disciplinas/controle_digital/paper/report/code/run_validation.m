% Initial conditions
x0 = [0; deg2rad(180); deg2rad(180 + 5); 0; 0; 0];
u0 = 0;

% Time vector
t = 0:0.01:5;

% System validation
plotfun = @(sol) plot_states(sol);
validate_model(sys, t, x0, u0, plotfun);