% % Kalman filter main parameters
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
% dsys = sys.lin_sys.discrete.systems{1}.ss;
% [K, L] = run_design(dsys, Q, R, Psi, rho, alpha);

dsys = sys.lin_sys.discrete.systems{1}.ss;

Ts = dsys.ts;

c_s_poles = [-5, -4, -3, -2];
o_s_poles = 10*c_s_poles;

c_z_poles = exp(Ts*c_s_poles);
o_z_poles = exp(Ts*o_s_poles);

K = place(dsys.a, dsys.b, c_z_poles);
L = place(dsys.a.', dsys.c.', o_z_poles).';

% Simulink main params
[~, params] = load_single_params();

% Control and observer
params.K = K;
params.L = L;

% Plant matrices
params.Phi = dsys.a;
params.Gamma = dsys.b;
params.C = dsys.c;

params.ts = dsys.ts;
