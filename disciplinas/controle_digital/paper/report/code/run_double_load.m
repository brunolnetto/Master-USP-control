% @Author: Bruno Peixoto
% @Date: 08/11
clear all;
close all;
clc;

% Plant parameters
sys = double_pendulum();

% Working point
x_WP = [0; pi; pi; 0; 0; 0];
u_WP = 0;
y_WP = double(subs(sys.g, [sys.states; sys.u], [x_WP; u_WP]));
WP = [x_WP; u_WP];

% Linearized system
sys.lin_sys = sys.linearize(WP);
