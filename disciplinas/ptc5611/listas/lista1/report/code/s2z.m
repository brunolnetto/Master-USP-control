% Transforma a funcao de tranferencia G em discreto
% com numerador e denominador da transformacao linear 
% fornecida
% Bruno Peixoto 2018
% 
% Ex.: Discretizacao para frente de uma PT1
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

function[ans] = s2z(G, Ts, c, d)

syms z;

% Numerador e denomador da tf
num = G.num{1}';
den = G.den{1}';

% Grau do numerador e denominador
m = length(num);
n = length(den);

% Base do espaco z polinomial
Z = [z; 1];

% Matriz quadrada do numerador
C = Z*c';
[Vc, Dc] = eig(C);
Vcinv = inv(Vc);

% Matriz quadrada do denominador
D = Z*d.';
[Vd, Dd] = eig(D);
Vdinv = inv(Vd);

% Conversao do vetor base do numerador em S em Z
Sm = [];
for i = 1:m
    k = i-1;
    
    if(k == 0)
        Dc_k_1 = pinv(Dc);
        Dd_k_1 = pinv(Dd);
    else
        Dc_k_1 = Dc^(k-1);
        Dd_k_1 = Dd^(k-1);
    end
    
    numi = c'*Vc*Dc_k_1*Vcinv*Z;
    deni = d'*Vd*Dd_k_1*Vdinv*Z;
    Sm = [numi/deni; Sm];
end

% Conversao do vetor base do denominador em S em Z
Sn = [];
for i = 1:n
    k = i-1;
    if(k == 0)
        Dc_k_1 = pinv(Dc);
        Dd_k_1 = pinv(Dd);
    else
        Dc_k_1 = Dc^(k-1);
        Dd_k_1 = Dd^(k-1);
    end
    
    numi = c'*Vc*Dc_k_1*Vcinv*Z;
    deni = d'*Vd*Dd_k_1*Vdinv*Z;
    
    Sn = [numi/deni; Sn];
end

Gz = (num.'*Sm)/(den.'*Sn);
Gz = simplify(Gz);

ans = syms2tfz(Gz, Ts);
