dsys = sys.lin_sys.discrete.systems{1}.ss;

% LQR Q and R matrices
Q = diag([1/(0.1)^2; ...
          1/2^2; ...
          1/deg2rad(10)^2; ...
          1/5^2; ...
          1/deg2rad(10)^2; ...
          1/5^2]);
R = 1;

% Kalman filter main parameters
rho = 1;
Psi = [zeros(3); eye(3)];

Ts = dsys.ts;

t_settling = 3;
alpha = 100^(Ts/t_settling);

[K, L] = run_design(dsys, Q, R, Psi, rho, alpha);

% Simulink main params
[~, params] = load_params();

% Control and observer
params.K = K;
params.L = L;

% Plant matrices
Phi = dsys.a;
Gamma = dsys.b;
C = dsys.c;

% Sample time
params.ts = dsys.ts;

% Working point
params.x0 = x_WP;
params.u0 = u_WP;
params.y0 = y_WP;
