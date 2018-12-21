% @Author: Bruno Peixoto
% @Date: 08/11
clear all;
close all;
clc;

% Plant parameters
sys = double_pendulum();

% Working point
x0 = [0; pi; 0; 0; 0; 0];
u0 = 0;
WP = [x0; u0];

% Linearized system
sys.lin_sys = sys.linearize(WP);