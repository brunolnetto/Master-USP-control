load_single_sys;
load_single_lqg;

set_param('sim_single_complete','AlgebraicLoopSolver','LineSearch');
simOut = sim('sim_single_complete');

sol.x = x.time;
sol.y = x.signals.values;
 
n = length(uk.signals.values);
sol.u = reshape(uk.signals.values, [n, 1]);

plot_single_states(sol);
