clear all;
close all;
clc;

syms k x y a lambda;

fxy = k/(x*y^2);
fxytilde = fxy + lambda*(x^2 + y^2 - a^2);

dfxytilde_x = diff(fxytilde, x);
dfxytilde_y = diff(fxytilde, y);
dfxytilde_lambda = diff(fxytilde, lambda);

sol = solve(dfxytilde_x == 0, dfxytilde_y == 0, dfxytilde_lambda == 0, ...
            x, y, lambda, 'ReturnCOnditions', true);

