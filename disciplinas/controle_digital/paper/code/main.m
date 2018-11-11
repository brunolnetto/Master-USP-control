% @Author: Bruno Peixoto
% @Date: 08/11
clear al l;
close all;
clc;

% Plant parameters
sys = double_pendulum();

% State space form of non-linear system
sys = state_space(sys);

% Working point
WP = [0; pi; pi; 0; 0; 0; 0];

% Linearized pendulum
n = max(size(sys.q)) + max(size(sys.qp));
sys = lin_pendulum(sys, WP);

