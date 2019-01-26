function plot_single_states(sol, to, fname)
    hfig = figure('units','normalized','outerposition',[0 0 1 1]);
    subplot(3,2, 1);
    plot(sol.x, sol.y(:, 1));
    title('$x(t)$', 'interpreter', 'latex')

    subplot(3,2, 2);
    plot(sol.x, sol.y(:, 3));
    title('$\dot x(t)$', 'interpreter', 'latex')

    subplot(3,2, 3);
    plot(sol.x, sol.y(:, 2));
    title('$\theta_1(t)$', 'interpreter', 'latex')

    subplot(3,2, 4);
    plot(sol.x, sol.y(:, 4));

    title('$\dot \theta_1(t)$', 'interpreter', 'latex')
    xlim([min(sol.x), max(sol.x)]);
    
    saveas(hfig, [to, fname, '.tiff']);
    saveas(hfig, [to, fname, '.fig']);
end
