% @Author: Bruno Peixoto
% Área de intersecção entre circunferências

clear all; close all; clc;

syms x y;
syms a b c d r1_2 r2_2

eq1 = (x - a)^2 + (y-b)^2 == r1_2;
eq2 = (x - c)^2 + (y-d)^2 == r2_2;

deq = eq1 - eq2;
deq = simplify(expand(deq));

xsubs = solve(deq, x);

paramsp1 = [a, b, r1_2];
paramsp2 = [c, d, r2_2];
paramsp = [paramsp1, paramsp2];

syms x01 y01 xb1 yb1 L11 L21;
syms x02 y02 xb2 yb2 L12 L22;
syms x03 y03 xb3 yb3 L13 L23;
syms alpha;

C1 = [x01;  y01] - rot2d(alpha)*[xb1; yb1];
C2 = [x02;  y02] - rot2d(alpha)*[xb2; yb2];
C3 = [x03;  y03] - rot2d(alpha)*[xb3; yb3];

params1 = [C1(1) C1(2) (L21.^2 - L11.^2)];
params2 = [C2(1) C2(2) (L22.^2 - L12.^2)];
params3 = [C3(1) C3(2) (L23.^2 - L13.^2)];

params12 = [params1 params2];
params13 = [params1 params3];
params23 = [params2 params3];

deq12 = subs2a2pontos(deq, paramsp, params12);
deq13 = subs2a2pontos(deq, paramsp, params13);
deq23 = subs2a2pontos(deq, paramsp, params23);

% Em funcao de x
x12 = solve(deq12, x);
x13 = solve(deq13, x);
x23 = solve(deq23, x);

% Solucao para y
y12 = solve(x12 == x13, y);
y13 = solve(x12 == x23, y);
y23 = solve(x13 == x23, y);

% Solucao para x
x12 = subs(x12, y, y12);
x13 = subs(x13, y, y13);
x23 = subs(x23, y, y23);

% Intersecção das circunferencias
P1 = [x12, y12].';
P2 = [x13, y13].';
P3 = [x23, y23].';

Apol = norm(cross([P3; 0] - [P2; 0], [P3; 0] - [P1; 0]))/2;

R1 = params1(3);
R2 = params1(3);
R3 = params1(3);

phi12 = acos(dot(P1 - C1, P2 - C1)/params1(3));
phi13 = acos(dot(P1 - C1, P3 - C1)/params2(3));
phi23 = acos(dot(P2 - C1, P3 - C1)/params3(3));

Asec12 = (phi12*R1^2 - norm(cross([P1; 0] - [C1; 0], [P2; 0] - [C1; 0])))/2;
Asec13 = (phi13*R2^2 - norm(cross([P1; 0] - [C2; 0], [P3; 0] - [C2; 0])))/2;
Asec23 = (phi23*R3^2 - norm(cross([P2; 0] - [C3; 0], [P3; 0] - [C3; 0])))/2;

A = Apol + Asec12 + Asec13 + Asec23;

% Pontos 0 de projeto [m]
L0 = 0.5; 
[x01new, y01new] = pol2cart(0, L0);
[x02new, y02new] = pol2cart(2*pi/3, L0); 
[x03new, y03new] = pol2cart(4*pi/3, L0);

% Pontos B de projeto [m]
Lb = 0; 
[xb1new, yb1new] = pol2cart(0, Lb);
[xb2new, yb2new] = pol2cart(2*pi/3, Lb); 
[xb3new, yb3new] = pol2cart(4*pi/3, Lb);

x0s = [x01 y01 x02 y02 x03 y03];
x0news = [x01new y01new x02new y02new x03new y03new];
xbs = [xb1 yb1 xb2 yb2 xb3 yb3];
xbnews = [xb1new yb1new xb2new yb2new xb3new yb3new];

% A = subs2a2pontos(A, [x0s xbs], [x0news, xbnews]);

