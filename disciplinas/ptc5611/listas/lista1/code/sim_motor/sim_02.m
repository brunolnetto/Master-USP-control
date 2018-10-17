clear all; close all; clc;

Ts = 0.2; %setar isso nos blocos zoh e na F.T. discreta do controlador
s = tf('s');
G = 1/(s*(s+1)); %G(s)
num_G = G.num{:}; %Colocar no numerador da F.T. da planta
den_G = G.den{:}; %Colocar no denominador da F.T. da planta
C = 15.88*(s+1)/(s+5.69); %C(s) foi ajustado para considerar o efeito do ZOH
C_d = c2d(C,Ts,'matched'); %Equiv. discreto 
num_C_d = C_d.num{:}; %Colocar no numerador da F.T. do controlador digital
den_C_d = C_d.den{:}; %Colocar no denminador da F.T. do controlador digital
t_run = 6; % colocar no simulation stop time do SIMULINK
t_step = 1; % colocar no parâmetro step time do bloco step 
sim('controle_02'); %executa o arquivo controle_01 do SIMULINK

hfig = figure();

subplot(211); 

% Gráfico de saída
plot(tout, y,'k'); 
title('Saida y(t)', 'interpreter', 'latex');
ylabel('Amplitide ($\frac{rad}{s}$)', 'interpreter', 'latex');

subplot(212); 

% Gráfico do sinal de controle
n = 0:Ts:Ts*(length(u)-1); %vetor de tempo discreto
stairs(n, u,'k'); 
title('Sinal de controle u(t)', 'interpreter', 'latex');
xlabel('Tempo (s)', 'interpreter', 'latex'); 
ylabel('Amplitide (V)', 'interpreter', 'latex');

saveas(hfig, 'images/sim02.eps');
saveas(hfig, 'images/sim02.png');
close;
