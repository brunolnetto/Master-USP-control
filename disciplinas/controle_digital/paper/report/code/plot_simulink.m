hfig = figure('units','normalized','outerposition',[0 0 1 1]);
    
subplot(3,2, 1);
plot(x.time, x.signals.values(:, 1));
title('$x(t)$', 'interpreter', 'latex')

subplot(3,2, 2);
plot(x.time, x.signals.values(:, 4));
title('$\dot x(t)$', 'interpreter', 'latex')

subplot(3,2, 3);
plot(x.time, x.signals.values(:, 2));
title('$\theta_1(t)$', 'interpreter', 'latex')

subplot(3,2, 4);
plot(x.time, x.signals.values(:, 5));
title('$\dot \theta_1(t)$', 'interpreter', 'latex')

subplot(3,2, 5);
plot(x.time, x.signals.values(:, 3));
title('$\theta_2(t)$', 'interpreter', 'latex')

subplot(3,2, 6);
plot(x.time, x.signals.values(:, 6));
title('$\dot \theta_2(t)$', 'interpreter', 'latex')