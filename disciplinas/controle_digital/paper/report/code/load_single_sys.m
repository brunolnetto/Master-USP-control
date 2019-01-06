% @Author: Bruno Peixoto
% @Date: 26/12
clear all;
close all;
clc;

<<<<<<< HEAD
% Time delays for the system
ndelay = 1;

% Sample time for the system
Ts = 1/100;

% Plant parameters
sys = single_pendulum(Ts, ndelay);
=======
robaddress = '/opt/github/Robotics4fun';

addpath(robaddress);
addpath(genpath(robaddress));
savepath

% Plant parameters
sys = single_pendulum();

>>>>>>> 33c21a20d19f9c2798e100a7efb3efdc3d19ea25
