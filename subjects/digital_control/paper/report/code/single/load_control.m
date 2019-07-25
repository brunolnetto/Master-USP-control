% LQR controller main parameters
t_settling = 2;
alpha = 100^(Ts/t_settling);

n = length(Phi);

% LQR Q and R matrices
Q = diag([1/0.1^2; ...
          0; ...
          1/(pi*10/180)^2; ...
          0; ...
          0]);
R = 1/1^2;

% Kalman filter main parameters
Psi = [zeros(2, 1); ones(2, 1)];

Phi_aug = [Phi, zeros(length(Phi), 1);...
           -C(1, :), eye(1)];
Gamma_aug = [Gamma; 0];

Rw_ = 1e-5;
Rv_ = 1e-3;

Rw = Rw_;
Rv = diag(Rv_*[1; 1]);

K = dlqr(alpha*Phi_aug, alpha*Gamma_aug, Q, R);
L = dlqe(Phi, Psi, C, Rw, Rv);

[~, params] = load_params();

% System parameters
params.Phi = Phi;
params.Gamma = Gamma;
params.C = C;

sys.fnum = vpa(subs(sys.f, sys.syms, sys.model_params));

% Sample time
params.ts = dsys.ts;

% Noise parameters
params.Rv = Rv_;
params.Rw = Rw_;

% Control and observer
Kp = K(:, 1:n);
Ki = -K(:, n+1:end);

xhat0 = params.xhat0;