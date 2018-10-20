% @Author: Bruno Peixoto
% Exercício 7 - Lista 1 da disciplina PTC5611

% Coeficientes do PID
Kp = 18;
Ti = 0.42;
Td = 0.05;
N = 3;

% Tempo de amostragem [s]
Ts = 0.01;

% Tempo de simulacao [s]
Tf = 35;

% Desvio padrão do ruido
sigma = 0.01;

% Controlador PID
s = tf('s');

mdlnome = 'dcIntrocomplete';

% --------------- Item a ---------------
params.Kp = 18;
params.Ti = 0.42;
params.Td = 0.05;
params.N = 0;
params.sat = 50;
params.antiwindup = false;
params.Tt = 0;

[wa, ea, da, ua, ya] = sim_ex7(mdlnome, params, Tf);

% --------------- Item b ---------------
params.Kp = 18;
params.Ti = 0.42;
params.Td = 0.05;
params.N = 0;
params.sat = 50;
params.antiwindup = true;
params.Tt = 0;

[wb, eb, db, ub, yb] = sim_ex7(mdlnome, params, Tf);

% --------------- Item c ---------------
params.Kp = 18;
params.Ti = 0.42;
params.Td = 0.05;
params.N = N;
params.sat = 50;
params.antiwindup = true;
params.Tt = 0;

[wc, ec, dc, uc, yc] = sim_ex7(mdlnome, params, Tf);

% ------- Surprise - Item bonus! ------- 
params.Kp = 18;
params.Ti = 0.42;
params.Td = 0.05;
params.N = N;
params.sat = 50;
params.antiwindup = true;
params.Tt = sqrt(Ti*Td);

[wd, ed, dd, ud, yd] = sim_ex7(mdlnome, params, Tf);

% Sinais das simulacoes
E = [ea eb ec ed];
D = [da db dc dd];
U = [ua ub uc ud];
Y = [ya yb yc yd];

