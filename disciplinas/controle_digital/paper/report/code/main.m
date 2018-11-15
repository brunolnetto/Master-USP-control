% @Author: Bruno Peixoto
% @Date: 08/11
clear all;
close all;
clc;

% Plant parameters
sys = double_pendulum();

% Working point
PWM_0 = 0;
x_0 = [0; pi; 0; 0; 0; 0;];
WP = [x_0; PWM_0];
sys.WP = WP;

% Linearized pendulum
sys = lin_pendulum(sys, WP);

% System parameters
params = load_params();
sys.params = params;

sys = numerize_pendulum(sys, WP);

% Discrete system
Ts = 0.01;

[Phi, Gamma] = c2d(A_num, B_num, Ts);

% LQR control - Bryson's rule
Q = diag([1/0.15, 1/(5*pi/180), 1/(5*pi/180), 1, 1/(30*pi/180), (1/(30*pi/180))])^2;
R = 1;
K = dlqr(Phi, Gamma, Q, R);

% Controlability
if is_controllable(sys.A_num, sys.B_num)
   disp('Controllable! :D');

else
   disp('Not-controllable! :(') 
end

% Observability
if is_controllable(sys.A_num, sys.B_num)
   disp('Observable! :D');

else
   disp('Not-Observable! :(') 
end

