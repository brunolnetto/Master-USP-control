disc_ss = sys.lin_sys.discrete.systems{1}.ss;
Ts = disc_ss.ts;

n = length(disc_ss.a);

Q = diag([1/(0.05)^2; ...
          1/1^2; ...
          1/deg2rad(5)^2; ...
          1/5^2; ...
          1/deg2rad(5)^2; ...
          1/5^2]);
R = 1;

[p, ~] = size(disc_ss.c);

ts = 3;

rho = 1;

Rw = Psi'*Psi;
Rv = rho*eye(p);

alpha = 100^(ts/Ts);

Psi = [zeros(3, 3); eye(3)];
A = disc_ss.a;
B = disc_ss.b;
C = disc_ss.c;

K = dlqr(alpha*A, alpha*B, Q, R);
L = dlqe(alpha*A, Psi, alpha*C, Rw, Rv);

[Ac,Bc,Cc,Dc] = dreg(disc_ss.a, disc_ss.b, disc_ss.c, disc_ss.d, K, L);