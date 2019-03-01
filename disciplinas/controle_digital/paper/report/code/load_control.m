% LQR controller main parameters
t_settling = 2;
alpha = 100^(Ts/t_settling);

n = length(Phi);

% LQR Q and R matrices
Q = diag([1/0.1^2; ...
          0; ...
          1/(pi*10/180)^2; ...
          0; ...
          1/(pi*10/180)^2; ...
          0; ...
          0]);
R = 1/1^2;

% Kalman filter main parameters
Psi = [zeros(3, 1); ones(3, 1)];

Phi_aug = [Phi, zeros(length(Phi), 1);...
           -C(1, :), eye(1)];
Gamma_aug = [Gamma; 0];

Rw = 1e-6;
Rv = diag(1e-4*[1; 1; 1]);

K = dlqr(alpha*Phi_aug, alpha*Gamma_aug, Q, R);
L = dlqe(Phi, Psi, C, Rw, Rv);

% Noise parameters
params.Rv = 1e-6;
params.Rw = 1e-4;

% Control and observer
Kp = K(:, 1:n);
Ki = -K(:, n+1:end);