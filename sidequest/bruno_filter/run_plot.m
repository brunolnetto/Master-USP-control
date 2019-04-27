close all;

mdlname = 'LC_VSI_filter';

open_system(mdlname);
set_param(mdlname, 'SaveOutput', 'on');

simOut = sim('LC_VSI_filter', 'StopTime', num2str(0.1), ...
             'SrcWorkspace', 'current', ...
             'AbsTol', '1e-10', ...
             'RelTol', '1e-10');
% Line signal
% Noise
% I
% V
% pwm
% Saturated PWM

x = simOut.x.signals.values;
xhat = simOut.xhat.signals.values;
noise = simOut.noise.signals.values;
line_signal = simOut.line_signal.signals.values;

noise = [simOut.noise.time, noise];
line_signal = [simOut.line_signal.time, line_signal];

x = [simOut.x.time x(:, 1) x(:, 2)];
xtilde = [simOut.xhat.time xhat(:, 1:2)];
wtilde = xhat(:, 3:end);

line_tilde = [simOut.xhat.time wtilde(:, 1)];
noise_tilde = [simOut.xhat.time sum(wtilde(:, 2:end)')'];

% States
hfig = figure('units','normalized', ...
              'outerposition', [0 0 1 1], ...
              'PaperPositionMode', 'auto');
         
subplot(2, 1, 1)
plot(x(:, 1), x(:, 2))
hold on
plot(xtilde(:, 1), xtilde(:, 2))
hold off

title('Filter current','Interpreter','latex')          
xlabel('Time [s]','Interpreter','latex');
ylabel('Amplitude [A]','Interpreter','latex');

subplot(2, 1, 2)
plot(x(:, 1), x(:, 3))
hold on
plot(xtilde(:, 1), xtilde(:, 3))
hold off

title('Capacitor voltage','Interpreter','latex')          
xlabel('Time [s]','Interpreter','latex');
ylabel('Amplitude [V]','Interpreter','latex');

% Harmonic components
hfig = figure('units','normalized', ...
              'outerposition', [0 0 1 1], ...
              'PaperPositionMode', 'auto');

subplot(2, 1, 1)
plot(line_tilde(:, 1), line_tilde(:, 2))
hold on
plot(line_signal(:, 1), line_signal(:, 2))
hold off

xlabel('Time [s]','Interpreter','latex');
ylabel('Amplitude [V]','Interpreter','latex');

legend({'$\tilde{u}(t)$', '$\tilde{u}(t)$'}, ...
        'Location','best','Interpreter','latex')

subplot(2, 1, 2)
plot(noise_tilde(:, 1), noise_tilde(:, 2))
hold on
plot(noise(:, 1), noise(:, 2))
hold off

title('Harmonic noise prediction','Interpreter','latex')

xlabel('$Time [s]$','Interpreter','latex');
ylabel('Amplitude [V]','Interpreter','latex');

legend({'$\mathbf{\tilde{w}}$', '$\mathbf{\tilde{w}}$'}, ...
        'Location','best','Interpreter','latex')
