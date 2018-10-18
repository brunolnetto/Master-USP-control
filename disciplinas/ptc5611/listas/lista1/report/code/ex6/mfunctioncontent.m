% @author: Bruno Peixoto
% Efetua o controle de posicao de um motor DC
% por transformacao de tustin
function uk = controlador(ek, params)
    persistent e_ant;
    persistent u_ant;
    
     % Primeira execucao
     if(isempty(e_ant))
         e_ant = [0, 0];
     end
     
     if(isempty(u_ant))
         u_ant = 0;
     end
    
    % Parâmetros do controlador
    b0 = params.b0;
    b1 = params.b1;
    a0 = params.a0;
    a1 = params.a1;

    % Atualizacao do erro
    e_ant(1) = e_ant(2);
    e_ant(2) = ek;
    
    % Valores para controle
    ek_1 = e_ant(1);
    ek = e_ant(2);
    uk_1 = u_ant;

    % Acao de controle
    uk = (b0/a0)*ek + (b1/a0)*ek_1 - (a1/a0)*uk_1;

    % Atualizacao da acao de controle
    u_ant = uk;
end