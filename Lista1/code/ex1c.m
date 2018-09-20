close all; clear all; clc;

n = 0:20;
Ts = 0.1;
fs = 1/Ts;
naux = 0:1/100:max(n)-1;

w1 = 5*pi/4;
w2 = w1 + 2*pi*fs;

y = cos(pi*n/8);
y1 = cos(w1*t);
y2 = cos(w2*t);

figure();
set(0, 'defaulttextinterpreter', 'latex');  
set(0, 'defaultAxesTickLabelInterpreter', 'latex');  
set(0, 'defaultLegendInterpreter', 'latex');  

stem(n, y);
hold on;
plot(n, y1);
hold on;
plot(n, y2);
hold off;
title_str = sprintf('$x_1 = cos(%.2f t)$, $x_2 = cos(%.2f t)$', w1, w2);
title(title_str);
legend('Sinal amostrado', '$x_1$', '$x_2$');