% Author: Bruno Peixoto
% Date: 22/06/19
% Exercicio 3 - Lista 1

tf = 15;
dt = 1e-3;

x0 = -1e-2;
y0 = y;

sim('ex3');

x0 = -2;
y0 = y;

sim('ex3');

y1 = y;

hfig = figure(1);
plot(y0.time, y0.signals.values)
hold on
plot(y1.time, y1.signals.values)
hold off
title('Oscilador', 'Interpreter', 'latex');
xlabel('t $[s]$', 'Interpreter', 'latex')
ylabel('$y$', 'Interpreter', 'latex')
legend({'$x_0 \approx 0$', '$x_0 = 2$'}, 'Interpreter', 'latex')

print(hfig, '-depsc', 'ex3.eps');
print(hfig, '-dpng', 'ex3.png');
grid

