% Author: Bruno Peixoto
% Date: 17/06/19
clear all
close all
clc

turtlebot = load_turtlebot();

syms v_1 v_2;
syms w_1 w_2;
syms yref_1 yref_2;

syms ki_1 ki_2 ki_3;
syms kp_1 kp_2 kp_3;

Ki = diag([ki_1, ki_2, ki_3]);
Kp = diag([kp_1, kp_2, kp_3]);

% First state conversions
z_1 = sym('z_1%d', [2, 1]);
z_2 = sym('z_2%d', [2, 1]);
z_3 = sym('z_3%d', [3, 1]);

v = [v_1; v_2];
w = [w_1; w_2];

Z = turtlebot.Z;
H = turtlebot.H;
h = turtlebot.h;
y = turtlebot.y;

q = turtlebot.q;
qp = turtlebot.qp;
C = turtlebot.C;

p = turtlebot.p;

P = jacobian(y, q)*C;

u = inv(Z)*(H*v + h);
z1 = y;
z2 = P*p;
z3 = q(1:3);

z13 = [z1; z3];
z_13 = [z_1; z_3];
Q = equationsToMatrix(z13, q);

Pp = dmatdt(P, q, qp);

q_t = Q\z_13;
p_t = inv(P)*z_2;

qp2z = subs(C*p, [q; p], [q_t; p_t]);

zp_1 = subs(P*p, p, p_t);
zp_2 = subs(Pp*p + P*v, p, p_t);
zp_3 = subs(jacobian(z3, q)*qp, qp, qp2z);

v_c = inv(P)*(w - P*p);

w1 = z_1;
w2 = subs(P*p, p, p_t);

[m, n] = size(turtlebot.A);

% y = []
% 
% for i = 1:
%     L_f_g = lie_diff(f, g, x)
% end

