[~, params] = load_params();

% Initial conditions
x0 = [params.q0; params.qp0];
u0 = params.u0;

% Time vector
t = 0:0.1:20;

sys_ = sys.subsystems{1};

% System validation
plotstates = @(sol) plot_states(sol);

sol = validate_model(sys_, t, x0, u0, plotstates);

time = sol.x;
states = sol.y.';
plot_energies(sys_, time, states);