clear all;
close all;
clc;

sym z;

Ts = 0.01;

% Backward
az = [2*Ts, 0];
bz = [-1, 1];

symz = [1; z];

num = [1]';
den = [1, 1]';

m = length(num);
n = length(den);

B = symz*bz;
[Vb, Db] = eig(A);
Wb = inv(Vb);

Sm = [];
for i = m:-1:0 :
   Sm = [Sm, Wb*(Db^i)*Vb];
end

Sn = [];
for i = n:-1:0 :
   Sn = [Sn, Wb*(Db^i)*Vb];
end

