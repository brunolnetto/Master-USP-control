function u_k = controlador(e_k, y_k, params)

persistent ui_ant;
persistent ud_ant;
persistent u_ant; 
persistent y_ant;

% Atribuicao para primeira iteracao
if isempty(ui_ant) && isempty(ud_ant) && isempty(y_ant)
    ui_ant = 0;
    ud_ant = 0;
    u_ant = 0;
    y_ant = 0;
end

% Parametros do controlador
sat = params.sat;
Ts = params.Ts;
Kp = params.Kp;
Ti = params.Ti;
Td = params.Td;
N = params.N;
a = params.a;

% Erro do integrador
% Estrategia anti-windup
if params.antiwindup
    if (u_ant >= sat) || (u_ant <= -sat)
        ei_k = 0;
    else
        ei_k = e_k;
    end
else
    ei_k = e_k;
end

if (u_ant >= sat)
    e_u = u_ant - sat;
elseif (u_ant <= -sat)
    e_u = u_ant + sat;
else
    e_u = 0;
end

% Saidas e acoes anteriores
y_k_1 = y_ant;
ui_k_1 = ui_ant;
ud_k_1 = ud_ant;

% Acao proporcional
up_k = Kp*e_k;

% Acao integrativa
ui_k = ui_k_1 + (Kp*Ts/Ti)*ei_k - a*e_u;

% Acao derivativa
ud_k = (Td/(Td + N*Ts))*ud_k_1 - (Kp*N*Td/(Td + N*Ts))*(y_k - y_k_1);

u_k = up_k + ui_k + ud_k;

% Valores salvos para a proxima iteracao
ui_ant = ui_k;
ud_ant = ud_k;
u_ant = u_k;
y_ant = y_k;
