function plot_single_states(sol, to, fname)
    hfig = figure('units','normalized','outerposition',[0 0 1 1]);
    
    subplot(2, 2, 1);
    plot(sol.x, sol.y(:, 1));
    title('$x(t)$', 'interpreter', 'latex')
%    ylim([-0.2, 0.2])
    xlim([min(sol.x), max(sol.x)]);    
    
    subplot(2, 2, 2);
    plot(sol.x, sol.y(:, 3));
    title('$\dot x(t)$', 'interpreter', 'latex')
%    ylim([-5, 5])
    xlim([min(sol.x), max(sol.x)]);
    
    subplot(2, 2, 3);
    plot(sol.x, sol.y(:, 2));
    title('$\theta_1(t)$', 'interpreter', 'latex')
%    ylim([-0.3 + pi, 0.3 + pi])
    xlim([min(sol.x), max(sol.x)]);
    
    subplot(2, 2, 4);
    plot(sol.x, sol.y(:, 4));
    title('$\dot \theta_1(t)$', 'interpreter', 'latex')
%    ylim([-3, 3])
    xlim([min(sol.x), max(sol.x)]);
    
    saveas(hfig, [to, fname, '.tiff']);
    saveas(hfig, [to, fname, '.fig']);
end