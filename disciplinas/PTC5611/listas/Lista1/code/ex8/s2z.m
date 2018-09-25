% Transforma a funcao de tranferencia G em discreto
% com numerador e denominador da transformacao linear 
% fornecida
% Bruno Peixoto 2018
% 
% Ex.: Discretização para frente de uma PT1
%  >> c = [-1, 1];
%  >> d = [Ts, 0];
%  >> G = s2z(Gs, Ts, c, d);
%    ans =
%   
%    1
%    -
%    z
%   
%  Sample time: 1 seconds
%  Discrete-time transfer function.

function[ans] = s2z(G,Ts, c, d)

syms z;

% Numerador e denomador da tf
num = G.num{1}';
den = G.den{1}';

% Grau do numerador e denominador
m = length(num);
n = length(den);

% Base do espaço z polinomial
Z = [z; 1];

% Matriz quadrada do numerador
C = Z*c';
[Vc, Dc] = eig(C);
Wc = simplify(inv(Vc));

% Matriz quadrada do denominador
D = Z*d.';
[Vd, Dd] = eig(D);
Wd = simplify(inv(Vd));

% Conversao do vetor base do numerador em S em Z
Sm = [];
for i = 1:m
    Sm = [Sm; simplify((c'*Wc*(Dc^(i-1))*Vc*Z)/(d'*Wd*(Dd^i)*Vd*Z))];
end

% Conversao do vetor base do denominador em S em Z
Sn = [];
for i = 1:n
    Sn = [Sn; simplify((c'*Wc*Dc^i*Vc*Z)/(d'*Wd*Dd^i*Vd*Z))];
end

Gz = (num.'*Sm)/(den.'*Sn);

[symNum,symDen] = numden(Gz);
TFnum = sym2poly(symNum);
TFden = sym2poly(symDen);

ans = tf(TFnum,TFden, Ts);
