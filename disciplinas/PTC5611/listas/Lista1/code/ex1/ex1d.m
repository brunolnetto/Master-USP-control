clear all; close all; clc

wm = 1;
A = 1;

% Sinal com distorção
hfig = figure();
set(hfig, 'defaultTextInterpreter', 'latex');

% Sinal original
subplot(3, 1, 1);
w = [-wm, -wm, -wm/2, wm/2, wm, wm];
Xw = [0, A,  0, 0, A, 0];

plot(w, Xw);
title('Espectro de  Fourier do sinal original');
ylabel('$|X(\omega)|$');
axis([-3*wm, 3*wm, 0, 1.5*A]);

% Sinal amostrado
subplot(3, 1, 2);
w = wm*(-2.5:0.5:2.5);
Xw = [0, A, 0, A, 0, A, 0, A, 0, A, 0];
plot(w, Xw);
hold on;
ndots = 10;
plot(wm*ones(ndots), 0:1.5*A/(ndots - 1):1.5*A, 'm--');
hold on;
ndots = 10;
plot(-wm*ones(ndots), 0:1.5*A/(ndots - 1):1.5*A, 'm--');
hold on;
ndots = 10;
plot(2*wm*ones(ndots), 0:1.5*A/(ndots - 1):1.5*A, 'm--');
hold on;
ndots = 10;
plot(-2*wm*ones(ndots), 0:1.5*A/(ndots - 1):1.5*A, 'm--');

hold off;
title('Espectro de  Fourier do sinal amostrado - $\omega_s = \omega_m$');
ylabel('$|X(\omega)|$');
axis([-3*wm, 3*wm, 0, 1.5*A]);

subplot(3, 1, 3);
w = wm*[-1, -1:0.5:1, 1];
Xw = [0, A, 0, A, 0, A, 0];
plot(w, Xw);
title('Espectro de  Fourier do sinal reconstruido - $\omega_f = \omega_M$');
xlabel('$\frac{\omega}{\omega_M}$');
xlabel('$\frac{\omega}{\omega_M}$');
ylabel('$|X(\omega)|$');
axis([-3*wm, 3*wm, 0, 1.5*A]);

saveas(hfig, '../../report/images/ex1d1.png');
saveas(hfig, '../../report/images/ex1d1.eps');

% Sinal sem distorção
hfig = figure();
set(hfig, 'defaultTextInterpreter', 'latex');

subplot(3, 1, 1);
w = [-wm, -wm, -wm/2, wm/2, wm, wm];
Xw = [0, A,  0, 0, A, 0];   

plot(w, Xw);
title('Espectro de  Fourier do sinal original');
ylabel('$|X(\omega)|$');
axis([-4*wm, 4*wm, 0, 1.5*A]);

subplot(3, 1, 2);
w = wm*[-2.5, -2, -2, -1, -1, -0.5, 0.5, 1, 1, 2, 2, 2.5];
Xw = [0, A, 0, 0, A, 0, 0, A, 0, 0, A, 0];
plot(w, Xw);
hold on;
ndots = 10;
plot(3*wm*ones(ndots), 0:1.5*A/(ndots - 1):1.5*A, 'm--');
hold on;
ndots = 10;
plot(-3*wm*ones(ndots), 0:1.5*A/(ndots - 1):1.5*A, 'm--');
hold off
title('Espectro de  Fourier do sinal amostrado - $\omega_s = 3\omega_m$');
ylabel('$|X(\omega)|$');
axis([-4*wm, 4*wm, 0, 1.5*A]);

subplot(3, 1, 3);
w = wm*[-1, -1:0.5:1, 1];
Xw = [0, A, 0, 0, 0, A, 0];
plot(w, Xw);
title('Espectro de  Fourier do sinal reconstruido - $\omega_f = \frac{\omega_s}{2}$');
xlabel('$\frac{\omega}{\omega_M}$');
ylabel('$|X(\omega)|$');
axis([-4*wm, 4*wm, 0, 1.5*A]);

saveas(hfig, '../../report/images/ex1d2.png');
saveas(hfig, '../../report/images/ex1d2.eps');