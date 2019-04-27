% Planta nominal ----------------------------------------------------------
Ln = 0.019;
Rn = 0.1;
Cn = 0.000010;
fa = 20000;
Ta = 1/fa;
z = tf('z',Ta);

A = [-Rn/Ln -1/Ln; 1/Cn 0];
B = [-1/Ln; 0];
C = [1 0];

% Delay de uma amostra - atraso de c�lculo do sistema
[Phi, Gamma] = c2d(A,B,Ta);
PhiDelay = [Phi [0;0]; C 0];
GammaDelay = [Gamma; 0];
CDelay = [0 0 1];

% Malha Objetivo - Defini��o de mu e L e plot de GIK (aprox. GFK pela I.K.)
close all;
figure;
hold on;

%mu = 0.001;
%L = 0.02*[1; 0; 1] + 3*[0; -1; 0];

mu = 0.001;
L = 0.02*[1; 0; 1] + 4*[0; -1; 0];


    % Filtro de Kalman (FK) a partir de mu e L
[Sigma, eigfk, ganhosfk] = dare(PhiDelay',CDelay',L*L',mu);
H = Sigma*CDelay'*(mu+CDelay*Sigma*CDelay')^-1;
bode(CDelay*(z*eye(3)-PhiDelay)^-1*PhiDelay*H)

    % Regulador Linear Quadr�tico (RLQ) e Recupera��o de Malha (LTR) a
    % partir de rho e C
rho = 0.0000001;
[Krlq, eigrlq, ganhosrlq] = dare(PhiDelay, GammaDelay, CDelay'*CDelay, rho);
G = (rho+GammaDelay'*Krlq*GammaDelay)^-1*GammaDelay'*Krlq*PhiDelay;

    % Controlador LQG/LTR a partir de H e G
K = z*G*(z*eye(3)-(eye(3)-H*CDelay)*(PhiDelay-GammaDelay*G))^-1*H;
bode(CDelay*(z*eye(3)-PhiDelay)^-1*GammaDelay*K)

Vcc = 40;

fs=20000; Ts=1/fs;

ligainv=1;

amp_ref=0.1;
freq_ref=377*5;
def=2.4;

amp_dist=0;
freq_dist=2*pi*60*5;

amp_dist_2=0;
freq_dist_2=2*pi*60*7;

t_step=0.00005;
step_1=0;
step_2=1;

sim('lc_vsi');

figure
plot(t,-r,'LineWidth',2)
hold on;
plot(t,-y,'LineWidth',2)

xlabel('$Time [s]$','Interpreter','latex');
ylabel('Amplitude [A]','Interpreter','latex');
leg=legend('$r$','$y$');
set(leg,'Interpreter','latex','Location','northeast');
grid on
title('Filter Current (Simulation Results)','Interpreter','latex')
xlim([-.7 .7])

ylim([-.7 .7])

set(gcf, 'Position', [500, 500, 300, 250])

