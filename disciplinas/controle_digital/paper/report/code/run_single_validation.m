[~, params] = load_single_params();

% Initial conditions
x0 = [0; deg2rad(45); 0; 0];
u0 = [0; 0];

% Time vector
t = 0:0.1:20;

sys_ = sys.subsystems{1};

% System validation
plotstates = @(hfig, sol) plot_single_states(sol);

sol = validate_model(sys_, t, x0, u0);

hfig = figure('units','normalized','outerposition',[0 0 1 1]);
plot_single_states(sol);

time = sol.x;
states = sol.y.';
[Kv, Pv, Fv, Tv] = plot_energies(sys_, time, states);
