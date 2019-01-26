% System and control load
load_single_sys
load_single_lqg

% System matrices
dsys = sys.lin_sys.discrete.systems{1}.ss;
Phi = dsys.a;
Gamma = dsys.b;
Q = eye(size(Phi));

% Controlled linearized system
Atilde = Phi - Gamma*K;

% Ljapunov matrix
P = dlyap(Atilde, Q);

% Discrete nonlinear system
f = subs(sys.f, sys.syms, sys.model_params);
f = vpa(f);
Ts = dsys.ts;
xk = sys.states;
ftilde = subs(f, sys.u, -K*xk);
ftilde = vpa(ftilde);
fhat = xk + Ts*ftilde;

% Working point
[~, params_str] = load_single_params();
x_WP = params_str.x_WP;

% Ljapunov time derivative
Vdot = ((fhat - x_WP).'*P*(fhat - x_WP) - (xk - x_WP).'*P*(xk - x_WP))/2;

% Optimization functions
% Best solution sofar: -0.1295 2.7631 0.0193 1.2773
fopt = @(x) double(norm(x - x_WP));
r = 0.4;
nleq = @(x) nlcond(x, x_WP, r, sys.states, Vdot);

% Optimization solution
options = optimoptions('fmincon', ...
                       'Algorithm', 'interior-point', ...
                       'MaxFunEvals', 5000);
x0 = fmincon(fopt, x_WP, [], [], [], [], [], [], nleq, options);
