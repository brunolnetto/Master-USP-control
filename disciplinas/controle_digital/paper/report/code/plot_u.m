function plot_u(sol, to, filename)
    hfig = figure('units','normalized','outerposition', [0 0 1 1]);

    subplot(2,1, 1);
    stairs(sol.x, sol.u(:, 1));
    title('$PWM_1(t)$', 'interpreter', 'latex')
    ylim([-5, 5]);
    
    subplot(2, 1, 2);
    stairs(sol.x, sol.u(:, 2));
    title('$PWM_2(t)$', 'interpreter', 'latex')
    ylim([-5, 5]);
    
    saveas(gcf, [to, filename, '.tiff']);
    saveas(gcf, [to, filename, '.fig']);
end