function hfig = plot_double_xxhat(w, x, xhat, to, fname)
    hfig = figure('units','normalized','outerposition',[0 0 1 1]);

    subplot(3, 2, 1);
    plot(x.time, x.signals.values(:, 1));
    hold on;
    hold on;
    plot(w.time, w.signals.values);
    plot(xhat.time, xhat.signals.values(:, 1));
    hold off
    
    title('$x(t)$', 'interpreter', 'latex')
    xlabel('[s]', 'Interpreter', 'latex');
    ylabel('[m]', 'Interpreter', 'latex');
    hleg = legend({'$x$', '$\hat{x}$', '$w$'}, ...
                  'Location','best','Interpreter','latex');
    
    subplot(3, 2, 2);
    plot(x.time, x.signals.values(:, 4));
    hold on;
    plot(xhat.time, xhat.signals.values(:, 4));
    hold off
    
    title('$\dot x(t)$', 'interpreter', 'latex')
    xlabel('[s]', 'Interpreter', 'latex');
    ylabel('[m/s]', 'Interpreter', 'latex');
    legend({'$\dot x$', '$\hat{\dot x}$'}, ...
           'Location','best','Interpreter','latex');    
    
    subplot(3, 2, 3);
    plot(x.time, x.signals.values(:, 2));
    hold on;
    plot(xhat.time, xhat.signals.values(:, 2));
    hold off
    
    title('$\theta_1(t)$', 'interpreter', 'latex')
    xlabel('[s]', 'Interpreter', 'latex');
    ylabel('[rad]', 'Interpreter', 'latex');
    legend({'$\theta_1$', '$\hat{\theta_1}$'}, ...
           'Location','best','Interpreter','latex');
    
    subplot(3, 2, 4);
    plot(x.time, x.signals.values(:, 5));
    hold on;
    plot(xhat.time, xhat.signals.values(:, 5));
    hold off
    
    title('$\dot \theta_1(t)$', 'interpreter', 'latex')
    xlabel('[s]', 'Interpreter', 'latex');
    ylabel('[rad/s]', 'Interpreter', 'latex');
    legend({'$\dot \theta_1$', '$\hat{\dot \theta_1}$'}, ...
           'Location','best','Interpreter','latex');
    
    subplot(3, 2, 5);
    plot(x.time, x.signals.values(:, 3));
    hold on;
    plot(xhat.time, xhat.signals.values(:, 3));
    hold off
    
    xlabel('[s]', 'Interpreter', 'latex');
    ylabel('[rad/s]', 'Interpreter', 'latex');
    legend({'$\theta_2$', '$\hat{\theta_2}$'}, ...
           'Location','best','Interpreter','latex');
    
    title('$\theta_2(t)$', 'interpreter', 'latex')
    xlabel('[s]', 'Interpreter', 'latex');
    ylabel('[rad]', 'Interpreter', 'latex');
    
    subplot(3, 2, 6);
    plot(x.time, x.signals.values(:, 6));
    hold on;
    plot(xhat.time, xhat.signals.values(:, 6));
    hold off
    
    title('$\dot \theta_2(t)$', 'interpreter', 'latex')
    xlabel('[s]', 'Interpreter', 'latex');
    ylabel('[rad/s]', 'Interpreter', 'latex');
    legend({'$\dot \theta_2$', '$\hat{\dot \theta_2}$'}, ...
           'Location','best','Interpreter','latex');
    
    print(hfig, [to, fname], '-depsc');
end
