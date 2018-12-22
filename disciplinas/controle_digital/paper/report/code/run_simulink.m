% LQR Q and R matrices
Q = diag([1/(0.1)^2; ...
          1/1^2; ...
          1/deg2rad(10)^2; ...
          1/5^2; ...
          1/deg2rad(10)^2; ...
          1/5^2]);
R = 1;

% Kalman filter main parameters
rho = 1;
Psi = [zeros(3); eye(3)];

dsys = sys.lin_sys.discrete.systems{1}.ss;
[K, L] = run_design(dsys, Q, R, Psi, rho);

% Simulink main params
[~, params] = load_params();

params.K = K;
params.L = L;

params.Phi = dsys.a;
params.Gamma = dsys.b;
params.C = dsys.c;

params.ts = dsys.ts;

params.x0 = x_WP;
params.u0 = u_WP;
params.y0 = double(subs(sys.g, [sys.states; sys.u], [x_WP; u_WP]));

simOut = sim('sim_double_pendulum');
plot_simulink