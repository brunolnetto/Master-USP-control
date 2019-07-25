% Time delays for the system
ndelay = 1;

% Sample time for the system
Ts = 1/100;

% Plant parameters
sys = double_pendulum(Ts, ndelay);
