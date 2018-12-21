% @Author: Bruno Peixoto
% @Date: 08/11
clear all;
close all;
clc;

% Plant parameters
sys = double_pendulum();

% Working point
x0 = [0; pi; pi; 0; 0; 0];
u0 = 0;
WP = [x0; u0];

% Linearized system
sys.lin_sys = sys.linearize(WP);

% LQR Q and R matrices
Q = diag([1/(0.05)^2; ...
          1/1^2; ...
          1/deg2rad(5)^2; ...
          1/5^2; ...
          1/deg2rad(5)^2; ...
          1/5^2]);
R = 1;

% Kalman filter main parameters
rho = 1;
Psi = [zeros(3); eye(3)];

dsys = sys.lin_sys.discrete.systems{1}.ss;
[K, L] = run_design(dsys, Q, R, Psi, rho);

