% Transforma a funcao de tranferencia G em discreto
% pela transformação para fora
% Bruno Peixoto 2018
% 
%  >> G = tf([1], [1, 1]);
%  >> Ts = 1;
%  >> Gz = forward(G, Ts);
%    ans =
%   
%    1
%    -
%    z
%   
%  Sample time: 1 seconds
%  Discrete-time transfer function.

function[ans] = forward(G, Ts)

c = [1; -1];
d = [0; Ts];
ans = s2z(G, Ts, c, d);


