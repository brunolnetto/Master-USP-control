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
syms Lb1 Lb2 Lb3 real;

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
syms alpha(t) x(t) y(t);
syms alphap(t) xp(t) yp(t);
syms alphapp(t) xpp(t) ypp(t);

% First bar orientation, velocity and acceleration [m, m/s, m/s^2]
syms theta1(t) theta2(t) theta3(t);
syms theta1p(t) theta2p(t) theta3p(t);
syms theta1pp(t) theta2pp(t) theta3pp(t);

% First bar orientation, velocity and acceleration [m, m/s, m/s^2]
syms phi1(t) phi2(t) phi3(t);
syms phi1p(t) phi2p(t) phi3p(t);
syms phi1pp(t) phi2pp(t) phi3pp(t);

assume([alpha(t), x(t), y(t), ...
       alphap(t), xp(t), yp(t), ...
       alphapp(t), xpp(t), ypp(t)], 'real');
   
assume([theta1(t), theta2(t), theta3(t), ...
        theta1p(t), theta2p(t), theta3p(t), ...
        theta1pp(t), theta2pp(t), theta3pp(t)], 'real');
   
assume([phi1(t), phi2(t), phi3(t), ...
        phi1p(t), phi2p(t), phi3p(t), ...
        phi1pp(t), phi2pp(t), phi3pp(t)], 'real');

% Cinematica direta e inversa
diff2p = {diff(phi1(t), t), diff(phi2(t), t), diff(phi3(t), t), ...
          diff(theta1(t), t), diff(theta2(t), t), diff(theta3(t), t), ...
          diff(x(t), t), diff(y(t), t), diff(alpha(t), t)};

diff2pp = {diff(phi1p(t), t), diff(phi2p(t), t), diff(phi3p(t), t), ...
           diff(theta1p(t), t), diff(theta2p(t), t), diff(theta3p(t), t), ...
           diff(xp(t), t), diff(yp(t), t), diff(alphap(t), t)};
       
varp = {phi1p, phi2p, phi3p, ...
        theta1p, theta2p, theta3p, ...
        xp, yp, alphap};

varpp = {phi1pp(t), phi2pp(t), phi3pp(t), ...
         theta1pp(t), theta2pp(t), theta3pp(t), ...
         xpp(t), ypp(t), alphapp(t)};    

d = [x; y];
     
[xecg, yecg] = pol2cart(delta_e_cg, Le_cg);
de_cg = [xecg; yecg];

T0e = T2d(alpha, d);

T001 = T2d(beta1, [0, 0].')*T2d(0, [L01, 0].');
T002 = T2d(beta2, [0, 0].')*T2d(0, [L02, 0].');
T003 = T2d(beta3, [0, 0].')*T2d(0, [L03, 0].');

T011 = T001*T2d(theta1, [0, 0].');
T012 = T002*T2d(theta2, [0, 0].');
T013 = T003*T2d(theta3, [0, 0].');

T011p = diff(T011, t);
T012p = diff(T012, t);
T013p = diff(T013, t);

T011p = subs(T011p, diff(theta1, t), theta1p);
T012p = subs(T012p, diff(theta2, t), theta2p);
T013p = subs(T013p, diff(theta3, t), theta3p);

T021 = T011*T2d(0, [L11, 0]')*T2d(phi1, [0, 0]');
T022 = T012*T2d(0, [L12, 0]')*T2d(phi2, [0, 0]');
T023 = T013*T2d(0, [L13, 0]')*T2d(phi3, [0, 0]');

T021p = diff(T011, t);
T022p = diff(T022, t);
T023p = diff(T023, t);

T021p = subs(T021p, diff2p, varp);
T022p = subs(T022p, diff2p, varp);
T023p = subs(T023p, diff2p, varp);

T0b1 = T0e*T2d(gamma1, [0, 0]');
T0b2 = T0e*T2d(gamma2, [0, 0]');
T0b3 = T0e*T2d(gamma3, [0, 0]');

% Motor joints Oi
O1 = T001*[0; 0; 1];
O1 = formula(O1);
O1 = simplify(O1(1:2));

O2 = T012*[0; 0; 1];
O2 = formula(O2);
O2 = simplify(O2(1:2));

O3 = T013*[0; 0; 1];
O3 = formula(O3);
O3 = simplify(O3(1:2));

% Elbow joint Ai
A1 = T011*[L11; 0; 1];
A1 = formula(A1);
A1 = simplify(A1(1:2));

A2 = T012*[L12; 0; 1];
A2 = formula(A2);
A2 = simplify(A2(1:2));

A3 = T013*[L13; 0; 1];
A3 = formula(A3);
A3 = simplify(A3(1:2));

% Platform joints Bi
B1 = T0b1*[Lb1; 0; 1];
B1 = formula(B1);
B1 = simplify(B1(1:2));

B2 = T0b2*[Lb2; 0; 1];
B2 = formula(B2);
B2 = simplify(B2(1:2));

B3 = T0b3*[Lb3; 0; 1];
B3 = formula(B3);
B3 = simplify(B3(1:2));

diff_A1B1 = A1 - B1;
diff_A1B1 = subs(diff_A1B1, {x(t), y(t), alpha(t)}, ...
                            {dummy1, dummy2, dummy3});      
diff_A1B1 = subs(diff_A1B1, theta1(t), dummy4);

diff_A2B2 = A2 - B2;
diff_A2B2 = subs(diff_A2B2, {x(t), y(t), alpha(t)}, ...
                            {dummy1, dummy2, dummy3});
diff_A2B2 = subs(diff_A2B2, theta2(t), dummy5);

diff_A3B3 = A3 - B3;
diff_A3B3 = subs(diff_A3B3, {x(t), y(t), alpha(t)}, ...
                            {dummy1, dummy2, dummy3});
diff_A3B3 = subs(diff_A3B3, theta3(t), dummy6);

% Conversion between motor angles and platform DoFs
eqn_em = [L11^2 == simplify(norm(diff_A1B1)^2); ...
          L12^2 == simplify(norm(diff_A2B2)^2); ...
          L13^2 == simplify(norm(diff_A3B3)^2)];

eqn_em = subs(eqn_em, {dummy1, dummy2, dummy3}, ...
                      {x(t), y(t), alpha(t)});
eqn_em = subs(eqn_em, {dummy4, dummy5, dummy6}, ...
                      {theta1(t), theta2(t), theta3(t)});

eqn_emp = diff(eqn_em, t);
eqn_emp = subs(eqn_emp, diff2p, varp);

eqn_empp = diff(eqn_emp, t);
eqn_empp = subs(eqn_empp, [diff2pp, diff2p], [varpp, varp]);

% Relative angle of elbow phi_i

% Arm #1
A1O1 = A1 - O1;
B1A1 = B1 - A1;

B1A1_ = subs(B1A1, {x(t), y(t), alpha(t)}, {dummy1, dummy2, dummy3});
B1A1_ = subs(B1A1_, theta1(t), dummy4);

A1O1_ = subs(A1O1, {x(t), y(t), alpha(t)}, {dummy1, dummy2, dummy3});
A1O1_ = subs(A1O1_, theta1(t), dummy4);

% Arm #2
A2O2 = A2 - O2;
B2A2 = B2 - A2;

B2A2_ = subs(B2A2, {x(t), y(t), alpha(t)}, {dummy1, dummy2, dummy3});
B2A2_ = subs(B2A2_, theta2(t), dummy5);

A2O2_ = subs(A2O2, {x(t), y(t), alpha(t)}, {dummy1, dummy2, dummy3});
A2O2_ = subs(A2O2_, theta2(t), dummy5);

% Arm #3
A3O3 = A3 - O3;
B3A3 = B3 - A3;

B3A3_ = subs(B3A3, {x(t), y(t), alpha(t)}, {dummy1, dummy2, dummy3});
B3A3_ = subs(B3A3_, theta3(t), dummy6);

A3O3_ = subs(A3O3, {x(t), y(t), alpha(t)}, {dummy1, dummy2, dummy3});
A3O3_ = subs(A3O3_, theta3(t), dummy6);

eqn_phi = [dot(B1A1_, A1O1_) == L11*L21*cos(phi1); ...
           dot(B2A2_, A2O2_) == L12*L22*cos(phi2); ...
           dot(B3A3_, A3O3_) == L13*L23*cos(phi3)];

eqn_phi = subs(eqn_phi, {dummy1, dummy2, dummy3}, {x(t), y(t), alpha(t)});
eqn_phi = subs(eqn_phi, {dummy4, dummy5, dummy6}, {theta1(t), theta2(t), theta3(t)});
       
eqn_phip = diff(eqn_phi, t);
eqn_phip = subs(eqn_phip, diff2p, varp);

eqn_phipp = diff(eqn_phip, t);
eqn_phipp = subs(eqn_phipp, [diff2p, diff2pp], [varp, varpp]);

qp = [theta1p; theta2p; theta3p];
phip = [phi1p; phi2p; phi3p];

qpp = [theta1pp; theta2pp; theta3pp];
phipp = [phi1pp; phi2pp; phi3pp];


[Xe_cg, Ye_cg] = pol2cart(delta_e_cg, Le_cg); 
Pe_cg_e = [Xe_cg; Ye_cg; 1];
Pe_cg_0 = T0e*Pe_cg_e;
Pe_cg_0 = formula(Pe_cg_0);
Pe_cg_0 = Pe_cg_0(1:2);

% Center of mass velocities [m/s]
V11_cg = formula(T011p*[L11_cg; 0; 1]);
V11_cg = V11_cg(1:2);
V12_cg = formula(T012p*[L12_cg; 0; 1]);
V12_cg = V12_cg(1:2);
V13_cg = formula(T013p*[L13_cg; 0; 1]);
V13_cg = V13_cg(1:2);
V1_cg = [V11_cg; V12_cg; V13_cg];

V21_cg = formula(T021p*[L21_cg; 0; 1]);
V21_cg = V21_cg(1:2);
V22_cg = formula(T022p*[L22_cg; 0; 1]);
V22_cg = V22_cg(1:2);
V23_cg = formula(T023p*[L23_cg; 0; 1]);
V23_cg = V23_cg(1:2);
V2_cg = [V21_cg; V22_cg; V23_cg];

Ve_cg = subs(diff(Pe_cg_0, t), ...
             {diff(alpha, t), diff(x, t), diff(y, t)}, ...
             {alphap, xp, yp});

% Angular velocities [rad/s]
w1 = qp;
w2 = qp + phip;           
we = alphap;

M1 = blkdiag(m11*eye(2), m12*eye(2), m13*eye(2));
M2 = blkdiag(m21*eye(2), m22*eye(2), m23*eye(2));
Me = me*eye(2);

J1 = diag([J11, J12, J13]);
J2 = diag([J21, J22, J23]);

K1 = kinetic_energy(V1_cg, w1, M1, J1);
K2 = kinetic_energy(V2_cg, w2, M2, J2);
Ke = kinetic_energy(Ve_cg, we, Me, Je);

eqns = [eqn_em; eqn_emp; eqn_phi; eqn_phip];
vars = [phi1, phi2, phi3, x, y, alpha, phi1p, phi2p, phi3p, xp, yp, alphap];

vars_ = sym('a', [1, length(formula(vars))]);
eqns_ = subs(eqns, vars, vars_);

sol = solve(eqns_, vars_, 'ReturnConditions', true);


