function hfigs = plot_ex6(Y, U, E, legends)    
    n = length(legends);

    % Propriedades uteis
    set(groot, 'defaultTextInterpreter', 'latex'); 

    titSize = 20;
    xlabSize = 15;
    ylabSize = 15;
    lgdSize = 15;
    
    hfig1 = figure(1);
    hfig2 = figure(2);
    hfig3 = figure(3);
    
    for i = 1:n
        % Saida da planta
        set(0, 'CurrentFigure', hfig1);
        plot(Y(i).time, Y(i).signals.values);

        ylab = ylabel('Amplitude');
        xlab = xlabel('Tempo [s]');
        tit = title('Saida da planta', 'interpreter', 'latex');
        lgd = legend(legends{1:i});
        
        set(lgd, 'interpreter', 'latex');
        lgd.FontSize = lgdSize;
        tit.FontSize = titSize;
        ylab.FontSize = ylabSize;
        xlab.FontSize = xlabSize;
        grid
        
        hold on
        
        % Acao de controle
        set(0, 'CurrentFigure', hfig2);
        if i == 1
            plot(U(i).time, U(i).signals.values);
        else
            stairs(U(i).time, U(i).signals.values);
        end
        
        ylab = ylabel('Amplitude');
        xlab = xlabel('Tempo [s]');
        tit = title('Saida do Controlador', 'interpreter', 'latex');
        lgd = legend(legends{1:i});
        
        set(lgd, 'interpreter', 'latex');
        lgd.FontSize = lgdSize;
        tit.FontSize = titSize;
        ylab.FontSize = ylabSize;
        xlab.FontSize = xlabSize;
        grid
        
        hold on 

        % Erro da saida e entrada
        set(0, 'CurrentFigure', hfig3);
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
        grid
        
        hold on

    end
    
    minimizar_espaco_branco(hfig1.CurrentAxes);
    minimizar_espaco_branco(hfig2.CurrentAxes);
    minimizar_espaco_branco(hfig3.CurrentAxes);
    
    hold off
    
    orient(hfig1,'landscape')
    orient(hfig2,'landscape')
    orient(hfig3,'landscape')
    
    hfigs = [hfig1, hfig2, hfig3];
    
end
