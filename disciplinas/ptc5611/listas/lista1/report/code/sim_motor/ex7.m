% @Author: Bruno Peixoto
% Exercicio 7 - Lista 1 da disciplina PTC5611
clear all;
close all;
clc;

% Coeficientes do PID
Kp = 18;
Ti = 0.42;
Td = 0.05;
N = 3;

% Velocidade inicial e valor de velocidade estacionaria
t0_vel = 5;
vel_estat = 3;

% Instante inicial e final da perturbacao
t0_dist = 10;
tf_dist = 25;
dist_val = 0.25;

% Parametos da planta
b = 0.1;
J = 0.01;
K = 0.01;
R = 1;
L = 0.5;

% Valor de saturacao do motor [V]
sat = 50;

% Tempo de amostragem [s]
Ts = 0.01;

% Tempo de simulacao [s]
Tf = 35;

% Desvio padrao do ruido
variance = 0.01;

% Controlador PID
s = tf('s');

mdlnome = 'dcIntrocomplete';

params.t0_vel = t0_vel;
params.vel_estat = vel_estat;

params.t0_dist = t0_dist;
params.tf_dist = tf_dist;
params.dist_val = dist_val;

params.Kp = Kp;
params.Ti = Ti;
params.Td = Td;

params.variance = variance;
params.sat = sat;
params.Ts = Ts;

params.b = b;
params.J = J;
params.K = K;
params.R = R;
params.L = L;

% --------------- Item a ---------------
params.N = 0;
params.antiwindup = false;
params.a = 0;

[wa, ea, da, ua, usata, ya] = sim_ex7(mdlnome, params, Tf);

% --------------- Item b ---------------
params.N = 0;
params.antiwindup = true;
params.a = 0;

[wb, eb, db, ub, usatb, yb] = sim_ex7(mdlnome, params, Tf);

% --------------- Item c ---------------
params.N = N;
params.antiwindup = true;
params.a = 0;

[wc, ec, dc, uc, usatc, yc] = sim_ex7(mdlnome, params, Tf);

% ------- Surprise - Item bonus! ------- 
params.N = N;
params.sat = sat;
params.antiwindup = true;
params.a = Ts/sqrt(Ti*Td);

[wd, ed, dd, ud, usatd, yd] = sim_ex7(mdlnome, params, Tf);

% Comparacao entre sinal PID com e sem anti-windup 
hfig = figure();
set(gca,'color','none') 
set(gca,'TickLabelInterpreter','latex')
set(groot, 'defaultTextInterpreter', 'latex');

subplot(2,2, 1)

plot(ua.time, ua.signals.values)
hold on
plot(ub.time, ub.signals.values)
hold off

title('Acao de controle antes da saturacao', 'interpreter', 'latex');
xlabel('Tempo [s]', 'interpreter', 'latex');
ylabel('Tensao [V]', 'interpreter', 'latex');

subplot(2,2, 2)

plot(ya.time, ya.signals.values)
hold on
plot(yb.time, yb.signals.values)
hold off

title('Saida do controlador', 'interpreter', 'latex');
xlabel('Tempo [s]', 'interpreter', 'latex');
ylabel('$\omega$ [$\frac{rad}{s}$]', 'interpreter', 'latex');

subplot(2,2, 3)
plot(usata.time, usata.signals.values)
hold on
plot(usatb.time, usatb.signals.values)
hold off

title('Acao de controle depois da saturacao', 'interpreter', 'latex');
xlabel('Tempo [s]', 'interpreter', 'latex');
ylabel('Tensao [V]', 'interpreter', 'latex');

subplot(2,2,4)
plot(ea.time, ea.signals.values)
hold on
plot(usatb.time, eb.signals.values)
hold off

title('Erro de malha', 'interpreter', 'latex');
xlabel('Tempo [s]', 'interpreter', 'latex');
ylabel('Erro [$\frac{rad}{s}$]', 'interpreter', 'latex');

legend('PID', 'PID com anti-windup', 'interpreter', 'latex');

minimizar_espaco_branco(hfig.CurrentAxes);

orient(hfig, 'landscape');
saveas(hfig, '../../images/ex7PID_PIDantiwindup.pdf');

% Comparacao entre PID com anti-windup sem e com filtro para a parcela
% integrativa

hfig1 = figure();
set(gca,'TickLabelInterpreter','latex')
set(groot, 'defaultTextInterpreter', 'latex');

subplot(2,2, 1)

plot(ub.time, ub.signals.values)
hold on
plot(uc.time, uc.signals.values)
hold off

title('Acao de controle antes da saturacao', 'interpreter', 'latex');
xlabel('Tempo [s]', 'interpreter', 'latex');
ylabel('Tensao [V]', 'interpreter', 'latex');

subplot(2,2, 2)

plot(yb.time, yb.signals.values)
hold on
plot(yc.time, yc.signals.values)
hold off

title('Saida do controlador', 'interpreter', 'latex');
xlabel('Tempo [s]', 'interpreter', 'latex');
ylabel('$\omega$ [$\frac{rad}{s}$]', 'interpreter', 'latex');

subplot(2,2, 3)
plot(usatb.time, usatb.signals.values)
hold on
plot(usatc.time, usatc.signals.values)
hold off

title('Acao de controle depois da saturacao', 'interpreter', 'latex');
xlabel('Tempo [s]', 'interpreter', 'latex');
ylabel('Tensao [V]', 'interpreter', 'latex');

subplot(2,2,4)
plot(eb.time, eb.signals.values)
hold on
plot(ec.time, ec.signals.values)
hold off

title('Erro de malha', 'interpreter', 'latex');
xlabel('Tempo [s]', 'interpreter', 'latex');
ylabel('Erro [$\frac{rad}{s}$]', 'interpreter', 'latex');

legend('PID com anti-windup sem filtro', 'PID com anti-windup com filtro', 'interpreter', 'latex');

minimizar_espaco_branco(hfig.CurrentAxes);
orient(hfig1, 'landscape');
saveas(hfig1, '../../images/ex7PID_antiwindup_filtro.pdf');

% --------------------------------------

hfig2 = figure();

subplot(2,2, 1)
plot(uc.time, uc.signals.values)
hold on
plot(ud.time, ud.signals.values)
hold off

title('Acao de controle antes da saturacao', 'interpreter', 'latex');
xlabel('Tempo [s]', 'interpreter', 'latex');
ylabel('Tensao [V]', 'interpreter', 'latex');

subplot(2,2, 2)
plot(yc.time, yc.signals.values)
hold on
plot(yd.time, yd.signals.values)
hold off

title('Saida do controlador', 'interpreter', 'latex');
xlabel('Tempo [s]', 'interpreter', 'latex');
ylabel('$\omega$ [$\frac{rad}{s}$]', 'interpreter', 'latex');

subplot(2,2, 3)
plot(usatc.time, usatc.signals.values)
hold on
plot(usatd.time, usatd.signals.values)
hold off

title('Acao de controle depois da saturacao', 'interpreter', 'latex');
xlabel('Tempo [s]', 'interpreter', 'latex');
ylabel('Tensao [V]', 'interpreter', 'latex');

subplot(2,2, 4)
plot(usatc.time, ec.signals.values)
hold on
plot(ed.time, ed.signals.values)
hold off

title('Erro de malha', 'interpreter', 'latex');
xlabel('Tempo [s]', 'interpreter', 'latex');
ylabel('Erro [$\frac{rad}{s}$]', 'interpreter', 'latex');

legend('PID com anti-windup (1) e filtro', 'PID com anti-windup (2) e filtro', 'interpreter', 'latex');

minimizar_espaco_branco(hfig2.CurrentAxes);

orient(hfig2, 'landscape');
saveas(hfig2, '../../images/PID_antiwidup12_filtro.pdf');

% Salva modelos em simulink
open_system('dcIntrocomplete')
print('-sdcIntrocomplete','-dpdf','../../images/dcIntrocomplete.pdf')
close_system

