% Transforma a funcao de tranferencia G em discreto
% por Tustin
% Bruno Peixoto 2018
% 
% Ex.: Discretizacao para frente de uma PT1
%  >> G = tf([1], [1, 1]);
%  >> Ts = 1;
%  >> Gz = forward(G, Ts);
%    ans =
%  
%      1
%   ------
%   2 z - 1
%  
% Sample time: 1 seconds
% Discrete-time transfer function.

function [ans] = tustin_prop(G, Ts)

c = [2; 2];
d = [Ts; -Ts];
ans = s2z(G, Ts, c, d);










