clear all; 
close all; 
clc;

% Closed chain Kinematics
run('kinematics');

% Closed chain dynamics
run('dynamics');

% Latex pretty model
run('prettify_model')