% Velocity for each member and each center of mass
V1_CG = [v11_cg; v12_cg; v13_cg];
V2_CG = [v21_cg; v22_cg; v23_cg];
Ve_CG = ve_cg;

% Angular velocity for each member and each center of mass
w1 = q1p;
w2 = q1p + q2p;           
we = alphap;

V = [V1_CG; V2_CG; Ve_CG];
Omega = [w1; w2; we];

u = sym('u', size(qp));
VOmega = subs([V; Omega], qp, u);
D_ = jacobian(formula(VOmega), u).';
D = subs(D_, u, qp);

% Auxiliary variables
ai = @(betai, d0i, dei, gammai) ...
     d - rot2d(betai)*d0i + rot2d(alpha + gammai)*dei;

A = blkdiag(formula(ai(beta1, di(L01), di(Le1), gamma1)), ...
            formula(ai(beta2, di(L02), di(Le2), gamma2)), ...
            formula(ai(beta3, di(L03), di(Le3), gamma3)));

s = [0, -1; 1, 0];
S = blkdiag(s, s, s);

Ci = @(angle, di) [eye(2, 2), s*rot2d(angle)*di];

C = [Ci(th11 + beta1, di(L11)); ...
      Ci(th12 + beta2, di(L12)); ...
      Ci(th13 + beta3, di(L13))];

Rbq1 = blkdiag(formula(rot2d(beta1 + th11)), ...
               formula(rot2d(beta2 + th12)), ...
               formula(rot2d(beta3 + th13)));
           
Rbq1q2 = blkdiag(formula(rot2d(beta1 + th11 + th21)), ...
                 formula(rot2d(beta2 + th12 + th22)), ...
                 formula(rot2d(beta3 + th13 + th23)));

% Acceleration
a = diff([V; Omega], t);
a = subs(a, [diff2p, diff2pp], [varp, varpp]);

% Generalized forces for each multibody segment
F = [zeros(14, 3); eye(3); zeros(4, 3)];
f1 = sym('Tau', [3, 1]);
f = F*f1 - M*a;

D1 = blkdiag(di(L11), di(L12), di(L13));
L1 = diag([L11, L12, L13]);
L2 = diag([L21, L22, L23]);

% Velocity jacobian matrix
Gamma = (A - Rbq1*D1).'*C;
Sigma = A.'*S*Rbq1*D1;
Xi = L1*L2*sin(diag(q2));
Lambda = A.'*C_ - Gamma ;

Sigmainv = Sigma\eye(3);
Gammainv = Gamma\eye(3);
Xiinv = Xi\eye(3);

jacConst = [Sigma, zeros(3, 3), -Gamma;...
             Sigma,          Xi, Lambda];
jacConst_perp = [Sigmainv*Gamma; -Xiinv*(Gamma + Lambda); eye(3)];

C_cal = jacConst_perp;

eqdyn = C_cal.'*D*f == 0;