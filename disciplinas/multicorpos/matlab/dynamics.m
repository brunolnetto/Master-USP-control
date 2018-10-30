% @Author: Bruno Peixoto
% @Date: 24/10

clear all; 
close all; 
clc;

% Subs auxiliary variables
syms dummy1 dummy2 dummy3 real;
syms dummy4 dummy5 dummy6 real;

% Member Lengths [m]
syms L01 L02 L03 real;
syms L11 L12 L13 real;
syms L21 L22 L23 real;
syms Le1 Le2 Le3 real;

% Mass center distances and orientation [m, rad]
syms L11_cg L12_cg L13_cg real;
syms L21_cg L22_cg L23_cg real;
syms Le_cg delta_e_cg real;

% Masses [Kg]
syms m11 m12 m13 real; 
syms m21 m22 m23 real;
syms me real;

% Inertial moments [Kg*m^2]
syms J11 J12 J13 real;
syms J21 J22 J23 real;
syms Je real;

% Orientation for motors and platform member joints [rad]
syms beta1 beta2 beta3 real;
syms gamma1 gamma2 gamma3 real;

% Platform orientation, velocity and acceleration [m, m/s, m/s^2]
syms alpha(t)   x(t)   y(t);
syms alphap(t)  xp(t)  yp(t);
syms alphapp(t) xpp(t) ypp(t);

% First bar orientation, velocity and acceleration [m, m/s, m/s^2]
syms th11(t)   th12(t)   th13(t);
syms th11p(t)  th12p(t)  th13p(t);
syms th11pp(t) th12pp(t) th13pp(t);

% First bar orientation, velocity and acceleration [m, m/s, m/s^2]
syms th21(t)   th22(t)   th23(t);
syms th21p(t)  th22p(t)  th23p(t);
syms th21pp(t) th22pp(t) th23pp(t);

% End-effector Efforts
syms Fx Fy Tau real;

% Motor efforts
syms Tau1 Tau2 Tau3 real;

assume([alpha(t),  x(t),   y(t), ...
       alphap(t),  xp(t),  yp(t), ...
       alphapp(t), xpp(t), ypp(t)], 'real');
   
assume([th11(t),   th12(t),   th13(t), ...
        th11p(t),  th12p(t),  th13p(t), ...
        th11pp(t), th12pp(t), th13pp(t)], 'real');
   
assume([th21(t),   th22(t),   th23(t), ...
        th21p(t),  th22p(t),  th23p(t), ...
        th21pp(t), th22pp(t), th23pp(t)], 'real');

% Subs variables
diff2p = {diff(th11(t), t), diff(th12(t), t), diff(th13(t), t), ...
          diff(th21(t), t), diff(th22(t), t), diff(th23(t), t), ...
          diff(x(t), t), diff(y(t), t), diff(alpha(t), t)};

diff2pp = {diff(th11p(t), t), diff(th12p(t), t), diff(th13p(t), t), ...
           diff(th21p(t), t), diff(th22p(t), t), diff(th23p(t), t), ...
           diff(xp(t), t), diff(yp(t), t), diff(alphap(t), t)};
       
varp = {th11p, th12p, th13p, ...
        th21p, th22p, th23p, ...
        xp, yp, alphap};

varpp = {th11pp(t), th12pp(t), th13pp(t), ...
         th21pp(t), th22pp(t), th23pp(t), ...
         xpp(t), ypp(t), alphapp(t)};    

d = [x; y];

di = @(L) [L; 0];

% Centro de massa da plataforma
[xecg, yecg] = pol2cart(delta_e_cg, Le_cg);
de_cg = [xecg; yecg];

T0e = T2d(alpha, d);
T0ep = diff(T0e, t);
T0ep = subs(T0ep, diff2p, varp);

Tseq = @(angle, L) T2d(angle, di(0))*T2d(0, di(L)); 

T011 = Tseq(beta1, L01);
T012 = Tseq(beta2, L02);
T013 = Tseq(beta3, L03);

T021 = T011*T2d(th11, di(0));
T022 = T012*T2d(th12, di(0));
T023 = T013*T2d(th13, di(0));

T031 = T021*T2d(0, di(L11))*T2d(th21, di(0));
T032 = T022*T2d(0, di(L12))*T2d(th22, di(0));
T033 = T023*T2d(0, di(L13))*T2d(th23, di(0));

T111p = T0ip(T011, diff2p, varp);
T112p = T0ip(T012, diff2p, varp);
T113p = T0ip(T013, diff2p, varp);

T011p = T0ip(T011, diff2p, varp);
T012p = T0ip(T012, diff2p, varp);
T013p = T0ip(T013, diff2p, varp);

T011pp = Tpp(T011, [diff2p, diff2pp], [varp, varpp]);
T012pp = Tpp(T012, [diff2p, diff2pp], [varp, varpp]);
T013pp = Tpp(T013, [diff2p, diff2pp], [varp, varpp]);

T021pp = Tpp(T021, [diff2p, diff2pp], [varp, varpp]);
T022pp = Tpp(T022, [diff2p, diff2pp], [varp, varpp]);
T023pp = Tpp(T023, [diff2p, diff2pp], [varp, varpp]);

T031pp = Tpp(T031, [diff2p, diff2pp], [varp, varpp]);
T032pp = Tpp(T032, [diff2p, diff2pp], [varp, varpp]);
T033pp = Tpp(T033, [diff2p, diff2pp], [varp, varpp]);

T0b1 = T0e*T2d(gamma1, di(0));
T0b2 = T0e*T2d(gamma2, di(0));
T0b3 = T0e*T2d(gamma3, di(0));

% Motor joints Oi
O1 = point(T_01, di(0));
O2 = point(T_02, di(0));
O3 = point(T_03, di(0));

% Elbow joint Ai
A1 = point(T011, di(L11));
A2 = point(T012, di(L12));
A3 = point(T013, di(L13));

% Platform joints Bi
B1 = point(T021, di(L21));
B2 = point(T022, di(L22));
B3 = point(T023, di(L23));

% Vectos for th2i solution
diff_A1B1 = A1 - B1;
diff_A1B1 = subs(diff_A1B1, {x(t), y(t), alpha(t)}, ...
                            {dummy1, dummy2, dummy3});      
diff_A1B1 = subs(diff_A1B1, th11(t), dummy4);

diff_A2B2 = A2 - B2;
diff_A2B2 = subs(diff_A2B2, {x(t), y(t), alpha(t)}, ...
                            {dummy1, dummy2, dummy3});
diff_A2B2 = subs(diff_A2B2, th12(t), dummy5);

diff_A3B3 = A3 - B3;
diff_A3B3 = subs(diff_A3B3, {x(t), y(t), alpha(t)}, ...
                            {dummy1, dummy2, dummy3});
diff_A3B3 = subs(diff_A3B3, th13(t), dummy6);

% Conversion between motor angles and platform DoFs
eqn_em = [L11^2 == simplify(norm(diff_A1B1)^2); ...
          L12^2 == simplify(norm(diff_A2B2)^2); ...
          L13^2 == simplify(norm(diff_A3B3)^2)];

eqn_em = subs(eqn_em, {dummy1, dummy2, dummy3}, ...
                      {x(t), y(t), alpha(t)});
eqn_em = subs(eqn_em, {dummy4, dummy5, dummy6}, ...
                      {th11(t), th12(t), th13(t)});

eqn_emp = diff(eqn_em, t);
eqn_emp = subs(eqn_emp, diff2p, varp);

eqn_empp = diff(eqn_emp, t);
eqn_empp = subs(eqn_empp, [diff2pp, diff2p], ...
                          [varpp, varp]);

% Relative angle of elbow th2i
% Arm #1
A1O1 = A1 - O1;
B1A1 = B1 - A1;

B1A1_ = subs(B1A1, {x(t), y(t), alpha(t)}, ...
                   {dummy1, dummy2, dummy3});
B1A1_ = subs(B1A1_, th11(t), dummy4);

A1O1_ = subs(A1O1, {x(t), y(t), alpha(t)}, ...
                   {dummy1, dummy2, dummy3});
A1O1_ = subs(A1O1_, th11(t), dummy4);

% Arm #2
A2O2 = A2 - O2;
B2A2 = B2 - A2;

B2A2_ = subs(B2A2, {x(t), y(t), alpha(t)}, ...
                   {dummy1, dummy2, dummy3});
B2A2_ = subs(B2A2_, th12(t), dummy5);

A2O2_ = subs(A2O2, {x(t), y(t), alpha(t)}, ...
                   {dummy1, dummy2, dummy3});
A2O2_ = subs(A2O2_, th12(t), dummy5);

% Arm #3
A3O3 = A3 - O3;
B3A3 = B3 - A3;

B3A3_ = subs(B3A3, {x(t), y(t), alpha(t)}, {dummy1, dummy2, dummy3});
B3A3_ = subs(B3A3_, th13(t), dummy6);

A3O3_ = subs(A3O3, {x(t), y(t), alpha(t)}, {dummy1, dummy2, dummy3});
A3O3_ = subs(A3O3_, th13(t), dummy6);

eqn_phi = [dot(B1A1_, A1O1_) == L11*L21*cos(th21); ...
           dot(B2A2_, A2O2_) == L12*L22*cos(th22); ...
           dot(B3A3_, A3O3_) == L13*L23*cos(th23)];

eqn_phi = subs(eqn_phi, {dummy1, dummy2, dummy3}, ... 
                        {x(t), y(t), alpha(t)});
eqn_phi = subs(eqn_phi, {dummy4, dummy5, dummy6}, ...
                        {th11(t), th12(t), th13(t)});
       
eqn_phip = diff(eqn_phi, t);
eqn_phip = subs(eqn_phip, diff2p, varp);

eqn_phipp = diff(eqn_phip, t);
eqn_phipp = subs(eqn_phipp, [diff2p, diff2pp], ...
                            [varp, varpp]);

% Angular velocities [rad/s]
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

M1 = blkdiag(m11*eye(2), m12*eye(2), m13*eye(2));
M2 = blkdiag(m21*eye(2), m22*eye(2), m23*eye(2));
Me = me*eye(2);

J1 = diag([J11, J12, J13]);
J2 = diag([J21, J22, J23]);

M = blkdiag(M1, M2, Me, J1, J2, Je);

% Auxiliary variables
ai = @(betai, d0i, dei, gammai) ...
     d - rot2d(betai)*d0i + rot2d(alpha + gammai)*dei;

a1 = ai(beta1, di(L01), di(Le1), gamma1);
a2 = ai(beta2, di(L02), di(Le2), gamma2);
a3 = ai(beta3, di(L03), di(Le3), gamma3);

A = blkdiag(formula(a1), ...
            formula(a2), ...
            formula(a3));

s = [0, -1; 1, 0];
S = blkdiag(s, s, s);

Ci = @(angle, di) ...
    [eye(2, 2), s*rot2d(angle)*di];

C = [Ci(th11 + beta1, di(L11)); ...
     Ci(th12 + beta2, di(L12)); ...
     Ci(th13 + beta3, di(L13))];

D1 = blkdiag(di(L11), di(L12), di(L13));
D2 = blkdiag(di(L21), di(L22), di(L23));
DG1 = blkdiag(di(L11_cg), di(L12_cg), di(L13_cg));
DG2 = blkdiag(di(L21_cg), di(L22_cg), di(L23_cg));

L1 = diag([L11, L12, L13]);
L2 = diag([L21, L22, L23]);

Rbq1 = blkdiag(formula(rot2d(beta1 + th11)), ...
               formula(rot2d(beta2 + th12)), ...
               formula(rot2d(beta3 + th13)));
           
Rbq1q2 = blkdiag(formula(rot2d(beta1 + th11 + th21)), ...
               formula(rot2d(beta2 + th12 + th22)), ...
               formula(rot2d(beta3 + th13 + th23)));

Gamma = (A - Rbq1*D1).'*C;
Sigma = A.'*S*Rbq1*D1;
Xi = -L1*L2*sin(diag(q2));

Sig2 = [Sigma; Sigma];
Psi = [zeros(3, 3), Gamma; Xi, Gamma - A.'*C];

C_cal = [eye(3, 3); Psi\Sig2];

% Center of mass velocities
v11_cg = velocity(T011p, di(L11_cg));
v12_cg = velocity(T012p, di(L12_cg));
v13_cg = velocity(T013p, di(L13_cg));

v21_cg = velocity(T021p, di(L21_cg));
v22_cg = velocity(T022p, di(L22_cg));
v23_cg = velocity(T023p, di(L23_cg));

ve_cg = velocity(T0ep, di(Le_cg));

V1_CG = [v11_cg; v12_cg; v13_cg];
V2_CG = [v21_cg; v22_cg; v23_cg];
Ve_CG = ve_cg;

w1 = q1p;
w2 = q1p + q2p;           
we = alphap;

V = [V1_CG; V2_CG; Ve_CG];
Omega = [w1; w2; we];

u = sym('u', size(qp));
VOmega_ = subs([V; Omega], qp, u);
D_ = jacobian(formula(VOmega_), u).';
D = subs(D_, u, qp);

% Ce = Ci(alpha + delta_e_cg, di(Le_cg));
% 
% D11t = S*Rbq1*DG1;
% D12t = zeros(6, 6);
% D21t = [S*Rbq1*DG2; zeros(2, 3); eye(3); eye(3); zeros(1, 3)];
% D22t = [S*(Rbq1q2*DG2 + Rbq1*D1), zeros(6, 3); ...
%        zeros(2, 3), C; ...
%        zeros(3, 6); ...
%        eye(3), zeros(3, 3); ...
%        zeros(1, 5), 1];
% 
% D = [D11t, D12t; D21t, D22t].';

E = [zeros(12, 3); eye(2), zeros(2,1); zeros(6, 3); 0, 0, 1];
F = [zeros(14, 3); eye(3); zeros(4, 3)];
G = [zeros(17, 3); eye(3); zeros(1, 3)];

f1 = sym('T1', [3, 1]);
f2 = sym('T2', [3, 1]);
fe = [Fx; Fy; T];

