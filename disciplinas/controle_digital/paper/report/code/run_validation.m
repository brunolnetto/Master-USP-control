% Initial conditions
x0 = [0; deg2rad(45); deg2rad(45); 0; 0; 0];
u0 = 0;

% Time vector
t = 0:0.1:10;

% System validation
plotfun = @(sol) plot_states(sol);
sol = validate_model(sys, t, x0, u0, plotfun);