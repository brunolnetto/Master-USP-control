clear all; close all; clc
Ts = 0.1;

sim('ex3sim');

hfig = figure();
set(0, 'defaulttextinterpreter', 'latex');

plot(x.time, x.signals.values, 'k');
hold on;
plot(y.time, y.signals.values);
hold on;
plot(y_red.time, y_red.signals.values, 'o');
hold off;
legend('Entrada', 'Diagrama fornecido', 'Diagrama reduzido');
title('Compara\c{c}\~ao do diagrama fornecido e redu\c{c}\~ao de fun\c{c}\~ao de transfer\^encia');
xlabel('Tempo [s]');
ylabel('Amplitude');

axis([0, 1, -3, 3]);

saveas(hfig, '../../report/images/ex31.png');
saveas(hfig, '../../report/images/ex31.eps');
