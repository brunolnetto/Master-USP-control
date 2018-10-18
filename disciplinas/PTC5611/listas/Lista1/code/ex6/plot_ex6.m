function hfigs = plot_ex6(E, U, Y, legends)    
    n = length(legends);

    % Propriedades uteis
    set(groot, 'defaultTextInterpreter', 'latex'); 
    set(groot, 'defaultFigureUnits', 'normalized')
    set(groot, 'defaultFigurePosition', [0 0 1 1])
    
    titSize = 20;
    xlabSize = 15;
    ylabSize = 15;
    lgdSize = 12;
    
    for i = 1:n
        hfig1 = figure(1);
        
        % Sinal de saída
        plot(Y(i).time, Y(i).signals.values);
        ylab = ylabel('Amplitude');
        tit = title('Saida da planta', 'interpreter', 'latex');
        lgd = legend(legends{1:i});

        set(lgd, 'interpreter', 'latex');
        lgd.FontSize = lgdSize;
        tit.FontSize = titSize;
        ylab.FontSize = ylabSize;
        
        hold on    

        hfig2 = figure(2);
        % Acao de controle
        if i == 1
            plot(U(i).time, U(i).signals.values);
        else
            stairs(U(i).time, U(i).signals.values);
        end
        
        ylab = ylabel('Amplitude');
        tit = title('Saida do Controlador', 'interpreter', 'latex');
        lgd = legend(legends{1:i});

        set(lgd, 'interpreter', 'latex');
        lgd.FontSize = lgdSize;
        tit.FontSize = titSize;
        ylab.FontSize = ylabSize;        
        hold on 

        hfig3 = figure(3);
        % Erro de controle        
        if i == 1
            plot(E(i).time, E(i).signals.values);
        else
            stairs(E(i).time, E(i).signals.values);
        end
        
        ylab = ylabel('Amplitude');
        xlab = xlabel('Tempo [s]');
        tit = title('Erro');

        lgd = legend(legends{1:i});

        set(lgd, 'interpreter', 'latex');
        lgd.FontSize = lgdSize;
        tit.FontSize = titSize;
        ylab.FontSize = ylabSize;
        xlab.FontSize = xlabSize;
        
        hold on

    end
    hold off
    
    hfigs = [hfig1, hfig2, hfig3];
    
end
