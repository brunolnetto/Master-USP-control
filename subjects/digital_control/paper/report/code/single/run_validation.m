[~, params] = load_params();

% Initial conditions
x0 = [params.q0; params.qp0];
u0 = params.u0;

% Time vector
t = 0:0.01:20;

% System validation
%plotstates = @(sol) plot_states(sol);

sol = validate_model(sys, t, x0, u0);

time = sol.x;
states = sol.y.';
[Kv, Pv, Fv, Tv] = plot_energies(sys_, time, states);