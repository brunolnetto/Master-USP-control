clear all; 
close all; 
clc;

t0 = tic;

% Closed chain
mechanism = load_mechanism('num');

% Implicit attributes for 
mechanism.eqdyn = orsino_eqdyn(mechanism);

toc(t0)

traj = trajectory();

t0 = tic;

[~, n] = size(traj.q);
m = length(mechanism.eqdyn.q_circ);

q_circs = zeros(m, n);

obj_vals = [];
for i = 1:n
    [q_circ_, obj_val] = q_circ(mechanism, zeros(1, 6), traj.q(:, i).')
    
    obj_vals = [obj_vals; obj_val];
    q_circs(:, i) = q_circ_.';
end
toc(t0)