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
WP = [x_WP; u_WP];

% Linearized system
sys.lin_sys = sys.linearize(WP);



