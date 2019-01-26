function plot_double_u(hfig, t, u, to, filename)
    stairs(t, u.signals.values);
    title('$u(t)$', 'interpreter', 'latex')
    
    xaxis = 10*[-1, 1];
    ylim();
    
    print(hfig, [to, filename], '-depsc');
end