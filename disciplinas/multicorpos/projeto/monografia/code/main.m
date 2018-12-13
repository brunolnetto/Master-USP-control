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
% 
% address = [pwd, '\multibody.avi'];
% axs = [-0.5, 0.8, -0.8, 0.8];
% 
% simulate(sims, mechanism, axs, address);
