% @author: Bruno Peixoto
% Simula Os controladores projetado no exerc�cio 6 da lista 1
% da disciplina PTC5611
function [e, u, y, u_direto] = sim_ex6(G, C, mdlnome, Tf)
    % Caso discreto
    if (C.Ts ~= 0)
        % Tempo de amostragem
        Ts = C.Ts;
        C.Variable = 'z^-1';
        
        % Parametros do controlador
        params.b0 = C.num{1}(1);   
        params.b1 = C.num{1}(2);
        params.a0 = C.den{1}(1);
        params.a1 = C.den{1}(2);
        paramname = sprintf('params%d', 1/Ts);
        assignin('base', paramname, params);
    end
    
    % Simulacao
    open_system(mdlnome);
    save_system;
    set_param(mdlnome, 'SaveOutput', 'on');
    stdOut = sim(mdlnome, 'StopTime', num2str(Tf), ...
                          'SrcWorkspace', 'current', ...
                          'AbsTol', '1e-6');
    close_system
    
    % Acao de controle e saida da planta
    u_direto = stdOut.get('u_direto');
    u = stdOut.get('u');
    y = stdOut.get('y');
    e = stdOut.get('e');
end