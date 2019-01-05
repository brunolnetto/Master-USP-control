% @Author: Bruno Peixoto
% @Date: 08/11
clear all;
close all;
clc;

robaddress = '/opt/github/Robotics4fun';

addpath(robaddress);
addpath(genpath(robaddress));
savepath

% Plant parameters
sys = single_pendulum();

