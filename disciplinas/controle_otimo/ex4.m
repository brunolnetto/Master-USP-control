% @Author: Bruno Peixoto
% Exercicio 4 da lista 1 de exerc�cios 
% Disciplina: PME5205

clear all;
close all;
clc;

syms P1 P2 P3 L lambda;

% Custos nominais
C1 = 1 - P1 + P1^2;
C2 = 0.75 + 0.5*P2 + 0.5*P2^2;
C3 = 1 + 0.5*P3 + P3^2;

% Custo total
C = C1 + C2 + C3;

% Condi��o de igualdade
cond = P1 + P2 + P3 - L;

% Multiplicadores de Lagrange
Ctilde = C + lambda*cond;

diffC_P1 = diff(Ctilde, P1);
diffC_P2 = diff(Ctilde, P2);
diffC_P3 = diff(Ctilde, P3);
diffC_lambda = diff(Ctilde, lambda);

sol = solve(diffC_P1, diffC_P2, ...
            diffC_P3,diffC_lambda, ...
            P1, P2, P3, lambda, 'ReturnConditions', true);