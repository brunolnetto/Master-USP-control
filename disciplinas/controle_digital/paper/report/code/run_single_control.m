clear all
close all
clc

load_single_sys;
load_single_lqg;

set_param('sim_single_complete','AlgebraicLoopSolver','LineSearch');
simOut = sim('sim_single_complete');

sol_x.x = x.time;
sol_x.y = x.signals.values;

% m = length(x_hat.signals.values);
% sol_xhat.x = x_hat.time;
% sol_xhat.y = reshape(x_hat.signals.values, [m, length(sys.states)]);

sol_u.x = uk.time;
n = length(uk.signals.values);
sol_u.u = reshape(uk.signals.values, [n, length(sys.u)]);
plot_u(sol_u, [pwd, '\images\'], 'efforts');

plot_single_states(sol_x, [pwd, '\images\'], 'cstates');
% plot_single_states(sol_xhat, [pwd, '\images\'], 'pstates');
