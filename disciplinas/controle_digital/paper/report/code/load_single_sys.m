% @Author: Bruno Peixoto
% @Date: 26/12
clear all;
close all;
clc;

% Time delays for the system
ndelay = 1;

% Sample time for the system
Ts = 1/100;

% Plant parameters
sys = single_pendulum(Ts, ndelay);
