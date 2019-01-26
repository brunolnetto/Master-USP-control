% % Discrete system
% dsys = sys.lin_sys.discrete.systems{1}.ss;
% 
% % Kalman filter main parameters
% Q = diag([rad2deg(10), 1, 10, 10].^2);
% R = eye(2);
% rho = 1;
% Psi = [zeros(3); eye(3)];
% 
% Ts = dsys.ts;
% t_settling = 3;
% 
% % alpha = 100^(Ts/t_settling);
% alpha = 1;
% 
% % Kalman filter main parameters
% rho = 1;
% Psi = [zeros(2); eye(2)];
% 
% [K, L] = run_design(dsys, Q, R, Psi, rho, alpha);

% Discrete system
dsys = sys.lin_sys.discrete.systems{1}.ss;

Ts = dsys.ts;

c_s_poles = 30*[-1, -0.9, -0.8, -0.7];
o_s_poles = 5*c_s_poles;

c_z_poles = exp(Ts*c_s_poles);
o_z_poles = exp(Ts*o_s_poles);

%1 Simulink main params
[~, params] = load_single_params();

% Plant matrices
params.Phi = dsys.a;
params.Gamma = dsys.b;
% params.C = dsys.c;
% params.D_ = dsys.d;
params.C = dsys.c;
params.D_ = dsys.d;

n = length(params.x_WP);
m = length(params.u_WP);
p = length(params.y_WP);

K = place(params.Phi, params.Gamma, c_z_poles);
L = place(params.Phi.', params.C.', o_z_poles).';

% Control and observer
params.K = K;
params.L = L;

params.ts = dsys.ts;
