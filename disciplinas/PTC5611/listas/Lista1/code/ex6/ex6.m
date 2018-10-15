% @author: Bruno Peixoto
% Exercicio 6 - PTC5611 - Controle discreto

clear all;
close all;
clc;
 
% ------------------- Planat -------------------
c = 0.7;
G = tf([1], [1 c 0]);

% -- Criterios de projeto - Controle continuo --
% Tempo de subida [s]
tr = 1;

% Sobressinal []
M = 0.2;
% ----------------------------------------------

% -------- Projeto de Controle continuo --------
% Parametros em frequencia
zeta = sqrt(log(M)^2/(log(M)^2 + pi^2));
wn = (1/tr)*(1/sqrt(1 - zeta^2))*(pi - atan(sqrt(1 - zeta^2)/zeta));
% ----------------------------------------------

% ------------- Lugar das raizes ---------------
%         ^\omega 
%     |  |          -: Polos em malha fechada
%     -  |          x: Polos do sistema 
%     |  |
% _x__|__x______> \sigma
%     |  |
%     -  |
%     |  |

C = (wn^2)*tf([1 c], [1 2*zeta*wn]);
% ----------------------------------------------

% ------------- Simulacoes ---------------------
% Simulacao continua
[ec, uc, yc] = sim_ex6(G, C, 'ex6continuo');

% ############### ZOH exato ####################
% Frequencia = 4 Hz
fs = 4;
Ts = 1/fs;
Cz4 = c2d(C, Ts, 'tustin');

[e4, u4, y4] = sim_ex6(G, Cz4, 'ex6discreto');

% Frequencia - 20 Hz
fs = 20;
Ts = 1/fs;
Cz20 = c2d(C, Ts, 'tustin');

[e20, u20, y20] = sim_ex6(G, Cz20, 'ex6discreto');

% ##############################################

% ############### ZOH ~ Pade' ##################
% ##############################################

% ------------- Visualizacao -------------------

% Plotagem dos sinais adquiridos
legends = {'Continuo', '$f_s = 4 Hz$', '$f_s = 20 Hz$'};

E = [ec, e4, e20];
U = [uc, u4, u20];
Y = [yc, y4, y20];

% Plota a ação de controle e saídas
hfig = plot_ex6(E, U, Y, legends);
saveas(gca, '../../report/images/ex6zoh.pdf');
close(hfig);

% Salva modelos em simulink
open_system('ex6continuo')
print('-sex6continuo','-dpdf','../../report/images/ex6simcontinuo.pdf')
close_system

open_system('ex6discreto')
print('-sex6discreto','-dpdf','../../report/images/ex6simdiscreto.pdf')
close_system

% ----------------------------------------------