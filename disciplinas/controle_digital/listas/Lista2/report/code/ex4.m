% Lista 2 - PTC5611
% Exercício 4
% Autor: Bruno Peixoto

close all
clear all
clc

% Parametros da planta

% Massa da bola [kg]
m = 0.1;

% Gravidade [m/s^2]
g = -9.8;

% Comprimento da barra [m]
L = 0.5;

% Raio da engrenagem [m]
d = 0.07;

% Inercia da bola [Kg m^2]
J = 4.129e-6;

% Raio da bola
R = 0.01;

% Criterios de projeto

% Maximo sobressinal []
M = 0.15;
zeta = sqrt(log(0.15)^2/(pi^2 + log(0.15)^2));

% Tempo de assentamento [s]
ts = 4;

% Tempo de simulacao [s]
tf = 10;

% Tempo de amostragem [s]
Ts = 1/20;

% Planta
A = [0, 1; 0, 0];
B = [0; -m*g*d/(L*(J/R^2 + m))];
C = [1, 0];
D = 0;
sys = ss(A, B, C, D);
sysd = c2d(sys, Ts);

% Item a
poles = [-3, -3];
K =  acker(sysd.A, sysd.B, poles);
F = inv(C*inv(eye(size(sysd.A)) - sysd.A + sysd.B*K)*sysd.B);
params.K = K;
params.F = F;

mdlnome = 'ex4sima';

open_system(mdlnome);
save_system;
set_param(mdlnome, 'SaveOutput', 'on');
simOuta = sim(mdlnome, 'StopTime', num2str(tf), ...
                       'SrcWorkspace', 'current', ...
                       'AbsTol', '1e-10', ...
                       'RelTol', '1e-10');
 close_system;
 
%  u = simOuta.get('u');
%  y = simOuta.get('y');
%  w = simOuta.get('w');
 
 
