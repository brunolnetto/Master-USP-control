function hfig = plot_double_states(t, x, to, fname)
    hfig = figure('units','normalized','outerposition',[0 0 1 1]);

    subplot(3, 2, 1);
    plot(t, x.signals.values(:, 1));
    title('$x(t)$', 'interpreter', 'latex')
    xlabel('[s]', 'Interpreter', 'latex');
    ylabel('[m]', 'Interpreter', 'latex');
    
    subplot(3, 2, 2);
    plot(t, x.signals.values(:, 4));
    title('$\dot x(t)$', 'interpreter', 'latex')
    xlabel('[s]', 'Interpreter', 'latex');
    ylabel('[m/s]', 'Interpreter', 'latex');
    
    subplot(3, 2, 3);
    plot(t, x.signals.values(:, 2));
    title('$\theta_1(t)$', 'interpreter', 'latex')
    xlabel('[s]', 'Interpreter', 'latex');
    ylabel('[rad]', 'Interpreter', 'latex');
    
    subplot(3, 2, 4);
    plot(t, x.signals.values(:, 4));

    title('$\dot \theta_1(t)$', 'interpreter', 'latex')
    xlim([min(t), max(t)]);
    xlabel('[s]', 'Interpreter', 'latex');
    ylabel('[rad/s]', 'Interpreter', 'latex');
    
    subplot(3, 2, 5);
    plot(t, x.signals.values(:, 3));
    xlabel('[s]', 'Interpreter', 'latex');
    ylabel('[rad/s]', 'Interpreter', 'latex');
    
    title('$\theta_2(t)$', 'interpreter', 'latex')
    xlim([min(t), max(t)]);
    xlabel('[s]', 'Interpreter', 'latex');
    ylabel('[rad]', 'Interpreter', 'latex');
    
    subplot(3, 2, 6);
    plot(t, x.signals.values(:, 6));

    title('$\dot \theta_2(t)$', 'interpreter', 'latex')
    xlim([min(t), max(t)]);
    xlabel('[s]', 'Interpreter', 'latex');
    ylabel('[rad/s]', 'Interpreter', 'latex');
    
    print(hfig, [to, fname], '-depsc');
end
