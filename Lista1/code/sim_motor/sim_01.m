clear all
close all
clc

s = tf('s');

%G(s)
G = 1/(s*(s+1)); 

% Numerador e denominador da planta
num_G = G.num{:}; 
den_G = G.den{:}; 

% C(s)
C = 13.162*(s+1)/(s+3.628); 

% Numerador e denominador do controlador
num_C = C.num{:}; 
den_C = C.den{:}; 

% Tempo de simulacao e inicio de degrau
t_run = 6;
t_step = 1;

% Executa o arquivo controle_01 do SIMULINK
sim('controle_01'); 

hfig = figure();
subplot(211); 

% Gráfico de saída
plot(tout, y,'k'); 
title('Saida y(t)', 'interpreter', 'latex');
ylabel('Amplitide ($\frac{rad}{s}$)', 'interpreter', 'latex');

subplot(212); 

% Gráfico do sinal de controle
plot(tout, u,'k');
title('Sinal de controle u(t)', 'interpreter', 'latex');
xlabel('Tempo (s)', 'interpreter', 'latex'); 
ylabel('Amplitide (V)', 'interpreter', 'latex');

saveas(hfig, 'images/sim01.eps');
saveas(hfig, 'images/sim01.png');
close;