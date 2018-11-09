% @Author: Bruno Peixoto
% @Date: 08/11
clear all;
close all;
clc;

% Plant parameters

% Inertial parameters
syms m0 m1 m2;
syms L1_cg L2_cg; 

% Gravity
syms g;

% Force applied to system
syms F;

% Viscuous friction
syms b0 b1 b2;

% Generalized variables
syms x(t) th1(t) th2(t);
syms xp(t)  th1p(t)  th2p(t);
syms xpp(t) th1pp(t) th2pp(t);

gravity = [0; -g; 0];

I0 = zeros(3, 3);
I1 = sym('I1_%d%d', [3, 3]);
I2 = sym('I2_%d%d', [3, 3]);

% Length parameters
L = sym('L%d', [1, 2]);
L0cg = [0; 0; 0];
L1cg = [L1_cg; 0; 0];
L2cg = [L2_cg; 0; 0];

% Bodies
% Car
Ts_car = {T3d(0, [0, 0, 1].', [x; 0; 0])};

car = build_body(m0, I0, b0, Ts_car, L0cg, x, xp, xpp, true);

% Bar 1
Ts_bar1 = {car.T, T3d(th1, [0, 0, 1].', [0; 0; 0])};

bar1 = build_body(m1, I1, b1, Ts_bar1, L1cg, th1, th1p, th1p, false);

% Bar 2
Ts_bar2 = {bar1.T, T3d(0, [0, 0, 1].', [L(1); 0; 0]), ...
           T3d(th2, [0, 0, 1].', [0; 0; 0])};
     
bar2 = build_body(m2, I2, b2, Ts_bar2, L2cg, th2, th2p, th2pp, false);

% System
% Variables used to substitute by diff's
sys.varq = [xp, th1p, th2p, xpp, th1pp, th2pp];
sys.diffq = [diff(x, t), diff(th1, t), diff(th2, t), ...
            diff(xp, t), diff(th1p, t), diff(th2p, t)];
    
sys.bodies = {car, bar1, bar2};
sys.gravity = gravity;
sys.g = g;

sys.q = {x; th1; th2};
sys.qp = {xp; th1p; th2p};
sys.qpp = {xpp; th1pp; th2pp};
sys.Fq = {F; 0; 0};

% Movement formalism
sys = kinematic_model(sys);
sys = dynamic_model(sys);

% State space form of non-linear system
sys = state_space(sys);

% Linearization on working point
states = [x, th1, th2, xp, th1p, th2p];
action = 0;

[~, n] = size(formula(states));
WP = zeros(n+1, 1);

u = sym('u', [n+1, 1]);
uq = u(1:6);
uf = u(7);

f_u = subs(sys.f, [states, F].', u);
f_WP = subs(f_u, u, WP);

A = simplify(subs(jacobian(f_u, u(1:6)), u, WP));
B = simplify(subs(jacobian(f_u, u(7)), u, WP));
