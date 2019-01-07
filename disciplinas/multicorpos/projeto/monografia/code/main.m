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

% [work_points, sing_points] = workspace_eval(mechanism);

t0 = tic; 
sims = calculate_sims(mechanism, trajectory);
toc(t0)

% Plot animation
hfig = figure();
address = [pwd, '\multibody.avi'];
axs = [-0.5, 0.8, -0.8, 0.8];

dt = traj.dt;

simulate(sims, mechanism, dt, axs, address);

plot_qpu(sims)