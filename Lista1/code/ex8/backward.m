% Transforma a funcao de tranferencia G em discreto
% pela transformação para trás 
% Bruno Peixoto 2018
% 
% Ex.: Discretização para frente de uma PT1
%  >> G = tf([1], [1, 1]);
%  >> Ts = 1;
%  >> Gz = forward(G, Ts);
%    ans =
%  
%      1
%   -------
%   2 z - 1
%  
% Sample time: 1 seconds
% Discrete-time transfer function.

function[ans] = backward(G, Ts)

c = [1; -1];
d = [Ts; 0];
ans = s2z(G, Ts, c, d);
