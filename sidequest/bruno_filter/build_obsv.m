A_obsv = A;
B_obsv = B;
C_obsv = C;

T_x = diag([1/1, 1/1]);
T_u = 1;
T_y = 1/1;

% System normalization
A_obsv = T_x\A_obsv*T_x;
B_obsv = T_x\B_obsv*T_u;
C_obsv = T_y\C_obsv*T_x;

%A_obsv = A;
%B_obsv = B;
%C_obsv = C;

run('noise_');

% Discretized system
[Phi_obsv, Gamma_obsv] = c2d(A_obsv, B_obsv, Ta);

T_x = blkdiag(T_x, T_ww);

%run('delays_ctrb');

n_obsv = length(Phi_obsv);
[~, m_obsv] = size(Gamma_obsv);
[p_obsv, ~] = size(C_obsv);

Rv = 1e-3;
Rw = 1e-3;

Psi = zeros(n_obsv, 1);
Psi(1) = 1;

xhat0 = zeros(n_obsv, 1);

% Kalman filter
L = dlqe(Phi_obsv, Psi, C_obsv, Rw, Rv);

n = length(A);
Psi = zeros(n, 1);