% @Author: Bruno Peixoto
% @Date: 08/11

% Time delays for the system
ndelay = 1;

% Sample time for the system
Ts = 1/100;

% Plant parameters
sys = double_pendulum(Ts, ndelay);

% Time delays for the system
ndelay = 0;

% Sample time for the system
Ts = 1/100;

% Plant parameters
dsys = sys.lin_sys.discrete.systems{1}.ss;

% Continuous paramters of plant
A = sys.lin_sys.continuous.systems{1}.ss.a;
B = sys.lin_sys.continuous.systems{1}.ss.b;
C = sys.lin_sys.continuous.systems{1}.ss.c;
D = sys.lin_sys.continuous.systems{1}.ss.d;

Ts = dsys.ts;

t_settling = 2;
alpha = 100^(Ts/t_settling);

% Plant matrices
Phi = dsys.a;
Gamma = dsys.b;
C = dsys.c;

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

n = length(Phi);

params.Phi = Phi;
params.Gamma = Gamma;
params.C = C;

% Noise parameters
params.Rv = 1e-6;
params.Rw = 1e-4;

% Control and observer
Kp = K(:, 1:n);
Ki = -K(:, n+1:end);

% Sample time
params.ts = dsys.ts;

params = catstruct(params, sys.params_str);

params.step_amplitude = 0.2;

% Final time
params.tf = 10;

% Initial point
params.x0 = [0; ...
             pi + 0.1; ...
             pi + 0.1; ...
             0; 0; 0];
params.xhat0 = [0; 0; 0; ...
                0; 0; 0];

mdlname = 'sim_double2015';
open_system(mdlname);
set_param(mdlname, 'SaveOutput', 'on');
simOut = sim(mdlname, 'StopTime', num2str(params.tf), ...
                      'SrcWorkspace', 'current', ...
                      'AbsTol', '1e-10', ...
                      'RelTol', '1e-10');
to = [pwd, '/../images/'];                       
                       
% States
x = get(simOut, 'x');
t = x.time;
fname = 'states';

hfigx = plot_double_states(t, x, to, fname);
print(hfigx, [to, fname], '-depsc');

% Estimated states
xhat = get(simOut, 'xhat');
t = xhat.time;
fname = 'predicted';

hfigxhat = plot_double_states(t, xhat, to, fname);
print(hfigxhat, [to, fname], '-depsc');

% Comparison
fname = 'comparison';
w = get(simOut, 'w');
hfigcomp = plot_double_xxhat(w, x, xhat, to, fname);
print(hfigcomp, [to, fname], '-depsc');

% Output
u = get(simOut, 'u');
t = u.time;
fname = 'output';

hfigu = figure('units','normalized','outerposition', [0 0 1 1]);
plot_double_u(hfigu, t, u, to, fname);

print(hfigu, [to, fname], '-depsc');

