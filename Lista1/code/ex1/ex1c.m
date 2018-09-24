close all; clear all; clc;

nf = 10;
n = 0:nf;
Ts = 0.1;
fs = 1/Ts;
ws = 2*pi*fs;
alpha = 0.01;
t = Ts*n;
t_ = 0:alpha*Ts:nf*Ts;


w1 = 5*pi/4;
w2 = w1 + ws;

y = cos(pi*n/8);
y1 = cos(w1*t_);
y2 = cos(w2*t_);

hfig = figure();
set(0, 'defaulttextinterpreter', 'latex');
set(0, 'defaultAxesTickLabelInterpreter', 'latex');  
set(0, 'defaultLegendInterpreter', 'latex');  

stem(t, y, 'k');
hold on;
plot(t_, y1);
hold on;
plot(t_, y2);
hold off;
title('$x_1 = cos(\omega_0 t)$, $x_2 = cos((\omega_0 + \omega_s) t)$');
legend('Sinal amostrado', '$x_1$', '$x_2$');
xlabel('Tempo [s]');
ylabel('Amplitude []');

saveas(hfig, '../../report/images/ex1c.png');
saveas(hfig, '../../report/images/ex1c.eps');
