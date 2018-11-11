% @Author: Bruno Peixoto
% @Date: 08/11
clear all;
close all;
clc;

% Plant parameters
sys = double_pendulum();

% State space form of non-linear system
sys = state_space(sys);

% Working point
WP = [0; pi; pi; 0; 0; 0; 0];

% Linearized pendulum
sys = lin_pendulum(sys, WP);

