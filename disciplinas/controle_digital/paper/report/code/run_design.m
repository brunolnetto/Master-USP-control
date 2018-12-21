function [K, L] = run_design(sys, Q, R, Psi, rho)
    % Discretized system
    Ts = sys.ts;

    % Degree of the system
    n = length(sys);

    % Number of inputs
    [p, ~] = size(sys.c);

    Rw = Psi'*Psi;
    Rv = rho*eye(p);

    Phi = disc_ss.a;
    Gamma = disc_ss.b;
    C = disc_ss.c;

    K = dlqr(Phi, Gamma, Q, R);
    L = dlqe(Phi, Psi, alpha*C, Rw, Rv);
end