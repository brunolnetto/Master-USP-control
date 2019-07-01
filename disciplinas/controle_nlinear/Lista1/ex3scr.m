% Author: Bruno Peixoto
% Date: 22/06/19
% Exercicio 3 - Lista 1

r0 = 0.01;
tf = 40;
sim('ex3');

y0 = y;

p0 = 100;

hfig = figure(1);
plot(y0.time(p0:end), y0.signals.values(p0:end))
title('Oscilador', 'Interpreter', 'latex');
xlabel('$t [s]$', 'Interpreter', 'latex')
ylabel('$y$', 'Interpreter', 'latex')

print(hfig, '-depsc', 'cycle_limit.eps');
print(hfig, '-dpng', 'cycle_limit.png');
grid

