% @Author: Bruno Peixoto
% @Date: 08/11
clear all;
close all;
clc;

% Plant parameters
sys = double_pendulum();

% Working point
WP = [0; pi; 0; 0; 0; 0; 0];
sys = sys.linearize(WP);

% Prettify equations and matrices a bit for document
% run('pretty_model');
