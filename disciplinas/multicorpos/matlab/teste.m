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

D1 = blkdiag(di(L11), di(L12), di(L13));

% Velocity jacobian matrix
Gamma = (A - Rbq1*D1).'*C;
Sigma = A.'*S*Rbq1*D1;
Xi = L1*L2*sin(diag(q2));
Lambda = A.'*C_ - Gamma ;

% C matrix
A = [Sigma, zeros(3, 3), -Gamma;...
     Sigma,          Xi, Lambda];
A_perp = [Sigma\Gamma; -Xi\(Gamma + Lambda); eye(3)];

Sigmainv = Sigma\eye(3);
Gammainv = Gamma\eye(3);
Xiinv = Xi\eye(3);

C_cal = [Sigmainv*Gamma; -Xiinv*(Gamma + Lambda); eye(3)];


