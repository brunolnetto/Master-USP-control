clear all; close all; clc;

syms PI x;

x2x2 = int((x^4), x, 0, pi);
x2x = int((x^3), x, 0, pi);
xx = int((x^2), x, 0, pi);
x2sinx = int((x^2)*sin(x), x, 0, pi);
xsinx = int((x)*sin(x), x, 0, pi);

A = [x2x2 x2x; x2x, xx];
b = [x2sinx; xsinx];

sol = A\b;
sol = double(subs(sol, PI, pi));

x = 0:0.01:pi;

x2 = x.^2;

y = sin(x);
yapprox = [x2', x']*sol;

figure();
plot(x,y);
hold on;
plot(x,yapprox);
hold off;
