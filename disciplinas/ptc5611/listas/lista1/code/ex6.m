% Exercicio 1 - Lista 1
% Autor: Bruno Peixoto
% Data: 29/09

% Frequencias de amostragem
fs1 = 4;
fs2 = 20;

Ts1 = 1/fs1;
Ts2 = 1/fs2;

% Parametros do controlador
wn = 4.46;
zeta = 0.597;
K = wn^2;
p = 2*zeta*wn;
c = 0.7;

% Planta e controlador em tempo continuo
s = tf('s');
Gs = 1/(s^2 + p*s);
Cs = K*(s+c)/(s+p);

% Controlador em tempo discreto
Cz1 = c2d(Cs, Ts1, 'tustin');
Cz2 = c2d(Cs, Ts2, 'tustin');

% Item A
param = [Cz1];


% Item B
param = [Cz2];