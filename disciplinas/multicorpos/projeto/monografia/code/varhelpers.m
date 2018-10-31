% Diff variables
% For quasi-velocity
diff2p = {diff(th11(t), t), diff(th12(t), t), diff(th13(t), t), ...
          diff(th21(t), t), diff(th22(t), t), diff(th23(t), t), ...
          diff(x(t), t), diff(y(t), t), diff(alpha(t), t)};

% For quasi-acceleration
diff2pp = {diff(th11p(t), t), diff(th12p(t), t), diff(th13p(t), t), ...
           diff(th21p(t), t), diff(th22p(t), t), diff(th23p(t), t), ...
           diff(xp(t), t), diff(yp(t), t), diff(alphap(t), t)};

% Subs variables
% For quasi-velocity       
varp = {th11p, th12p, th13p, ...
        th21p, th22p, th23p, ...
        xp, yp, alphap};

% For quasi-acceleration
varpp = {th11pp(t), th12pp(t), th13pp(t), ...
         th21pp(t), th22pp(t), th23pp(t), ...
         xpp(t), ypp(t), alphapp(t)};
     
d = [x; y];

q1   = [th11, th12, th13].';
q1p  = [th11p, th12p, th13p].';
q1pp = [th11pp, th12pp, th13pp].';

q2   = [th21, th22, th23].';
q2p  = [th21p, th22p, th23p].';
q2pp = [th21pp, th22pp, th23pp].';

p   = [x, y, alpha].';
pp  = [xp, yp, alphap].';
ppp = [xpp, ypp, alphapp].';

q   = formula([q1;   q2;   p  ]);
qp  = formula([q1p;  q2p;  pp ]);
qpp = formula([q1pp; q2pp; ppp]);

% Angular velocities [rad/s]
M1 = blkdiag(m11*eye(2), m12*eye(2), m13*eye(2));
M2 = blkdiag(m21*eye(2), m22*eye(2), m23*eye(2));
Me = me*eye(2);

J1 = diag([J11, J12, J13]);
J2 = diag([J21, J22, J23]);

M = blkdiag(M1, M2, Me, J1, J2, Je);