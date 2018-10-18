function hfig = plot_ex6(E, U, Y, legends)    
    n = length(legends);

    hfig = figure();

    % Propriedades uteis
    set(gcf, 'PaperPositionMode', 'auto');
    
    screensize = get(0,'Screensize');
    set(hfig, 'Position', 0.5*screensize)
    set(0,'DefaultAxesColor', 'none')
    set(groot, 'defaultTextInterpreter', 'latex'); 

    for i = 1:n       
        h1 = subplot(3, 1, 1);
        plot(Y(i).time, Y(i).signals.values);
        ylabel('Amplitude');
        title('Saida da planta', 'interpreter', 'latex');
        
        lgd = legend(legends{1:i});
        lgd.FontSize = 12;
        
        hold on    
        h2 = subplot(3, 1, 2);      

        if i == 1
            plot(U(i).time, U(i).signals.values);
        else
            stairs(U(i).time, U(i).signals.values);
        end
        
        ylabel('Amplitude');
        title('Saida do Controlador', 'interpreter', 'latex');
        
        hold on 
   
        h3 = subplot(3, 1, 3);      

        if i == 1
            plot(E(i).time, E(i).signals.values);
        else
            stairs(E(i).time, E(i).signals.values);
        end
        
        ylabel('Amplitude');
        xlabel('Tempo [s]');
        title('Erro');

        hold on

    end
    hold off
    
end
