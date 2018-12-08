
clear all; 
close all; 
clc;

t0 = tic;

% Closed chain
mechanism = load_mechanism('num');

% Implicit attributes for 
mechanism.eqdyn = orsino_eqdyn(mechanism);

toc(t0)

% Simulation
traj = trajectory();

sims = calculate_sims(mechanism, trajectory);

% hfig = figure();
% simulate(sims, mechanism);

