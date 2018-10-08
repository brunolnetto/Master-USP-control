% Exercicio 6 - Lista 1
% Autor: Bruno Peixoto
% Data: 29/09
clear all;
clc;
close all;


% Frequencias de amostragem
fs1 = 4;
fs2 = 20;

Ts1 = 1/fs1;
Ts2 = 1/fs2;

% Planta
c = 0.7;
Gs = tf([1], [1 c 0]);

% Controlador
wn = 4.46;
zeta = 0.597;
p = 2*zeta*wn;
K = wn^2;

Cs = K*tf([1 c], [1 p]);
num = Gs.num{1};
den = Gs.den{1};

Ts = Ts1;

Cz = c2d(Cs, Ts, 'tustin');
Cz.Variable  = 'z^-1';

Cnum = Cz.num{:};
Cden = Cz.den{:}; 

Cnum = Cnum';
Cden = Cden';

m = length(Cnum);
n = length(Cden);

% Erro e entradas iniciais
u0 = zeros(m-1, 1);
e0 = zeros(n, 1);

% Item A
%res = runsim(Cs, Ts1, 'ex6sima');
%plotuy(u, y);

% ans = runsim(Cs, Ts2, 'ex6sima');
% plotuy(u, y);
% 
% % Item B
% ans = runsim(Cs, Ts1, 'ex6simb');
% plotuy(u, y);
% 
% ans = runsim(Cs, Ts2, 'ex6simb');% ans = runsim(Cs, Ts2, 'ex6sima');
% plotuy(u, y);
% 
% % Item B
% ans = runsim(Cs, Ts1, 'ex6simb');
% plotuy(u, y);
% 
% ans = runsim(Cs, Ts2, 'ex6simb');
% plotuy(u, y);
% 

% plotuy(u, y);
% 
