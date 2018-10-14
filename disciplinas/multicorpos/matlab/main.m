close all;
clear all;
clc;

mems = membros();

% s = [0, -1; 1, 0];
% 
% a1 = rot2d(alpha)*db1 + d - d01;
% a2 = rot2d(alpha)*db2 + d - d02;
% a3 = rot2d(alpha)*db3 + d - d03;
% 
% A = blkdiag(a1, a2, a3);
% 
% I = eye(2,2);
% 
% C1 = [s.', rot2d(alpha)*db1];
% C2 = [s.', rot2d(alpha)*db2];
% C3 = [s.', rot2d(alpha)*db3];
% 
% C = [C1;C2;C3];
% 
% x1 = [cos(theta1 + beta1); sin(theta1 + beta1)];
% x2 = [cos(theta2 + beta2); sin(theta2 + beta2)];
% x3 = [cos(theta3 + beta3); sin(theta3 + beta3)];
% 
% X = blkdiag(x1, x2, x3);
% 
% S = blkdiag(s, s, s);
% 
% L1 = diag([L11, L12, L13]);
% L2 = diag([L21, L22, L23]);
% 
% Gamma = (L1*X.' - A.')*C;
% Sigma = L1*A.'*S*X;
% 
% pi1 = rot2d(alpha)*db1 + d - rot2d(beta1 + theta1)*da1 - d01;
% pi2 = rot2d(alpha)*db1 + d - rot2d(beta1 + theta1)*da1 - d02;
% pi3 = rot2d(alpha)*db1 + d - rot2d(beta1 + theta1)*da1 - d03;
% 
% Pi = blkdiag(pi1, pi2, pi3);
% 
% Zeta = [C, -X*L1, -Pi; Gamma, -Sigma, zeros(3, 3)];
% 
% p = null(Zeta);
% OmegaB = [zeros(3, 6), eye(3, 3)]*p;