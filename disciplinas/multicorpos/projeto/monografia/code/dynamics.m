% Auxiliary variable for jacobian
u = sym('u', size(qp));

% Jacobian matrix of V to qp
VOmega_qp2u = subs(V, qp, u);
jac_qp_V_ = jacobian(formula(VOmega_qp2u), u);
jac_qp_V = subs(jac_qp_V_, u, qp);

% Jacobian matrix of V to qp
VOmega_q2u = subs(V, q, u);
jac_q_V_ = jacobian(formula(VOmega_q2u), u);
jac_q_V = subs(jac_q_V_, u, qp);

% Auxiliary ddefinition variables
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

% TAKE NOTE: 'formula' allows to turn 'varfun' into symvar and proceed
% symbolic manipulation
Rbq1 = blkdiag(formula(rot2d(beta1 + th11)), ...
               formula(rot2d(beta2 + th12)), ...
               formula(rot2d(beta3 + th13)));
           
Rbq1q2 = blkdiag(formula(rot2d(beta1 + th11 + th21)), ...
                 formula(rot2d(beta2 + th12 + th22)), ...
                 formula(rot2d(beta3 + th13 + th23)));

% Acceleration
a = jac_qp_V*qpp + jac_q_V*qp;
coriolis = simplify(jac_q_V*qp);

% Generalized forces for the mechanical system
T1 = sym('Tau', [3, 1]);

D1 = blkdiag(di(L11), di(L12), di(L13));
L1 = diag([L11, L12, L13]);
L2 = diag([L21, L22, L23]);

% Velocity jacobian matrix
Lambda = simplify(A.'*C);
Delta = simplify(D1.'*Rbq1.'*C);
Gamma = simplify(Lambda - Delta);
Sigma = A.'*S*Rbq1*D1;
Xi = L1*L2*sin(diag(q2));

Sigmainv = Sigma\eye(3);
Gammainv = Gamma\eye(3);
Xiinv = Xi\eye(3);

% Jacobian matrix of system constraints
jac_const = [Sigma, zeros(3, 3), -Gamma;...
             Sigma,         Xi,  Delta];

% Complementar space of Jacobian matrix
jac_const_perp = [Sigmainv*Gamma; -Xiinv*Lambda; eye(3)];

% Auxiliary dynamic variables
jac_qp_V = simplify(jac_qp_V);

jac_const_perp = simplify(jac_const_perp);

J = simplify(jac_qp_V*jac_const_perp);

jac_const_perp_p = diff(jac_const_perp, t);
jac_const_perp_p = subs(jac_const_perp_p, [diff2pp, diff2p], [varp, varpp]);

L = jac_qp_V*jac_const_perp_p + jac_q_V*jac_const_perp;
L = simplify(L);

% Inertial decoupling matrix
M_ = J.'*M*J;

% Coriolis matrix
Lqp = simplify(L*qp(1:3));
MLqp = simplify(M*Lqp);
J_MLqp = simplify(J.'*MLqp);
upsilon = J_MLqp;

% Output coupling matrix
U = [zeros(14, 3); eye(3); zeros(4, 3)];
U_ = J.'*U;
U_ = simplify(U_);

% Dynamic equations of the system
eqdyn = M_*qpp(1:3) + upsilon == U_*T1;
