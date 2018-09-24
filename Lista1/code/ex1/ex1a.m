close all; clear all; clc;

fs = 1000; % [Hz]
Ts = 1/fs; % [s]

k = 10;
n = 0:10;
t = n*Ts; % [s]
t_rec = 0:Ts/10:(k-1)*Ts;

y = cos(pi*n/4);
pos = find(y == 1);
pos = pos(2);
w = 2*pi/t(pos);
y_rec = cos(w*t_rec);

hfig = figure();
set(0,'defaulttextinterpreter', 'latex');  
set(0, 'defaultAxesTickLabelInterpreter', 'latex');  
set(0, 'defaultLegendInterpreter', 'latex');  

stem(t, y);
hold on;
plot(t_rec, y_rec, 'r');

title('$x[n] = cos(\frac{\pi}{4}n)$, $f_s = 10$ $kHz$');
xlabel('Tempo [s]');
ylabel('Amplitude [ ]');

xlim([0, (k-1)*Ts]);
ylim([-1.5, 1.5]);

saveas(hfig, '../../report/images/ex1a.png');
saveas(hfig, '../../report/images/ex1a.eps');

