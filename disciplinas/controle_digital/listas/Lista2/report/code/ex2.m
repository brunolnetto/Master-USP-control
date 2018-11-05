% Lista 2 - PTC5611
% Exercício 2
% Autor: Bruno Peixoto

% Constante de tempo do sistema em malha fechadas
q = 1;

% Tempo de amostragem
Ts = 0.5;

s = tf('s');
z = tf('z', Ts);

% Garantia de causalidade
% Tome nota: Este valor advem da condicao k >= n - m - 1, tal que o grau do
% denominador seja maior que do denominador e, assim, o sistema seja causal
k = 2;

% Malha fechada continua e discreta
Gmfc = exp(-k*Ts*s)*tf(1, [q, 1]);
Gmfd = absorbDelay(c2d(Gmfc, Ts));

% Sistema cnotrolado
Gc = exp(-s)*(1/((5*s + 1)*(3*s + 1)));
Gd = absorbDelay(c2d(Gc, Ts));

% Controlador de Dahlin classico
Cz = (1/Gd)*(Gmfd/(1 - Gmfd));
Cz = minreal(Cz, 1e-3);

% Sinal em malha fechada para saida e acao de controle - Dahlin classico
Gyw = minreal(Gd*Cz/(1 + Gd*Cz), 1e-3);
Guw = minreal(Cz/(1 + Gd*Cz), 1e-3);

% Reprojeto para evitar oscilações no sinal de controle
c = -0.9149;
K = 1/(1 - c);
Gmfd_ = K*((z - c)/z)*Gmfd;

% Controlador de Dahlin classico
Cz_ = (1/Gd)*(Gmfd_/(1 - Gmfd_));
Cz_ = minreal(Cz_);

% Sinal em malha fechada para saida e acao de controle - Dahlin classico
Gyw_ = absorbDelay(minreal(Gd*Cz_/(1 + Gd*Cz_), 1e-3));
Guw_ = absorbDelay(minreal(Cz_/(1 + Gd*Cz_), 1e-3));

hfig = figure('units','normalized','outerposition',[0 0 1 1]);
set(hfig, 'defaultLegendInterpreter','latex');

% Projeto #1
subplot(2, 2, 1)
step(Gyw);
xlim([0, 10])

subplot(2, 2, 2)
step(Guw);
xlim([0, 10])

% Projeto #2
subplot(2, 2, 3)
step(Gyw_);
xlim([0, 10])

subplot(2, 2, 4)
step(Guw_);
xlim([0, 10])

saveas(hfig, '../images/ex2.png');
close;