clear all; 
close all; 
clc;

t0 = tic;

% Closed chain
mechanism = load_mechanism('num');

% Implicit attributes for 
mechanism.eqdyn = orsino_eqdyn(mechanism);

toc(t0)

t0 = tic;
traj = trajectory;

[~, n] = size(traj.q);
m = length(mechanism.eqdyn.q_circ);

q_circs = {};
obj_vals = [];
q_ant = zeros(1, 6);

toc(t0)