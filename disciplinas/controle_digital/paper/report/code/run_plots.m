% States
x = get(simOut, 'x');
fname = 'states';

hfigx = plot_double_states(x, to, fname);
print(hfigx, [to, fname], '-depsc');

% Estimated states
xhat = get(simOut, 'xhat');
fname = 'predicted';

hfigxhat = plot_double_states(xhat, to, fname);
print(hfigxhat, [to, fname], '-depsc');

% Comparison
fname = 'comparison';
w = get(simOut, 'w');
hfigcomp = plot_double_xxhat(w, x, xhat, to, fname);
print(hfigcomp, [to, fname], '-depsc');

% Output
u = get(simOut, 'u');
t = u.time;
fname = 'output';

hfigu = figure('units','normalized','outerposition', [0 0 1 1]);
plot_double_u(hfigu, t, u, to, fname);

print(hfigu, [to, fname], '-depsc');

