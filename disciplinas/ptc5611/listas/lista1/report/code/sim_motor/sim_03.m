clear all; 
close all; 
clc;

%setar isso nos blocos zoh e na F.T. discreta do controlador
Ts = 0.2; 

s = tf('s');

%G(s)
G = 1/(s*(s+1));

% Numerador e denominador da planta
num_G = G.num{:}; 
den_G = G.den{:};

 %C(s) foi ajustado para considerar o efeito do ZOH
C = 15.88*(s+1)/(s+5.69);
C_d = zpk(c2d(C,Ts,'matched'));

a = C_d.z{:}; % Captura o zero da F.T. discreta do controlador
b = C_d.p{:}; % Captura o polo da F.T. discreta do controlador
K = C_d.k; % Captura o ganho da F.T. discreta do controlador
param = [a, b, K];

t_run = 6; % colocar no simulation stop time do SIMULINK
t_step = 1; % colocar no parâmetro step time do bloco step 

sim('controle_03'); %executa o arquivo controle_01 do SIMULINK

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

saveas(hfig, 'images/sim03.eps');
saveas(hfig, 'images/sim03.png');
close;
