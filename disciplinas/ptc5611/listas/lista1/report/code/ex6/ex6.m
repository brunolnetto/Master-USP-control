% @author: Bruno Peixoto
% Exercicio 6 - PTC5611 - Controle discreto

clear all;
close all;
clc;
 
% ------------------- Planta -------------------
c = 0.7;

s = tf('s');
G = 1/(s*(s+c));

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
polo_proj = wn*(-zeta + i*sqrt(1 - zeta^2));
% 

% Lugar das raizes
%         ^\omega 
%     |  |          -: Polos em malha fechada
%     -  |          x: Polos do sistema 
%     |  |
% _x__|__x______> \sigma
%     |  |
%     -  | 
%     |  |

C = (wn^2)*(s + c)/(s + 2*zeta*wn);
% ----------------------------------------------


% ------------- Simulacoes ---------------------
% Tempo de simulacao
Tf = 5;

% Simulacao continua
[ec, uc, yc] = sim_ex6(G, C, 'ex6continuo', Tf);

% ############### ZOH exato ####################
% Frequencia = 4 Hz
fs = 4;
Ts = 1/fs;
Cz4 = c2d(C, Ts, 'tustin');

[e4, u4, y4] = sim_ex6(G, Cz4, 'ex6discreto', Tf);

% Frequencia - 20 Hz
fs = 20;
Ts = 1/fs;
Cz20 = c2d(C, Ts, 'tustin');

[e20, u20, y20] = sim_ex6(G, Cz20, 'ex6discreto', Tf);

% ##############################################    

% ############### ZOH ~ Pade' ##################

% Frequencia = 4 Hz
fs = 4;
Ts = 1/fs;

C4_pade = C_zoh_approx_pade(G, polo_proj, Ts);

Cz4_pade = c2d(C4_pade, Ts, 'tustin');
[e4pade, u4pade, y4pade] = sim_ex6(G, Cz4_pade, 'ex6discreto', Tf);

% Frequencia = 4 Hz
fs = 20;
Ts = 1/fs;

C20_pade = C_zoh_approx_pade(G, polo_proj, Ts);

Cz20_pade = c2d(C20_pade, Ts, 'tustin');
[e20pade, u20pade, y20pade] = sim_ex6(G, Cz20_pade, 'ex6discreto', Tf);

% ##############################################
% ----------------------------------------------

% ------------- Visualizacao -------------------

% Plotagem dos sinais adquiridos
legends = {'Continuo', ...
           '$f_s$ =  4 Hz', '$f_s$ = 20 Hz', ...
           '$f_s$ = 4 Hz com Pade', '$f_s$ = 20 Hz com Pade'};

E = [ec, e4, e20, e4pade, e20pade];
U = [uc, u4, u20, u4pade, u20pade];
Y = [yc, y4, y20, y4pade, y20pade];

% Plota a a��o de controle e sa�das
hfig = plot_ex6(Y, U, E, legends);
saveas(hfig(1), '../../images/saidazoh.pdf');
saveas(hfig(2), '../../images/controlezoh.pdf');
saveas(hfig(3), '../../images/errozoh.pdf');
% close all;

% Salva modelos em simulink
open_system('ex6continuo')
print('-sex6continuo','-dpdf','../../images/ex6simcontinuo.pdf')
close_system

open_system('ex6discreto')
print('-sex6discreto','-dpdf','../../images/ex6simdiscreto.pdf')
close_system

% ----------------------------------------------