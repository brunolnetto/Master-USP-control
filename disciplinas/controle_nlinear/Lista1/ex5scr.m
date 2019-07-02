% Author: Bruno Peixoto
% Date: 22/06/19
% Exercicio 5 - Lista 1

x0 = [1, 1];
tf = 100;

m = 2;
n = 4;
p = 6;

sim('ex5sim')

figure(1)
plot(x.time, x.signals.values)
legend({'$x_1$', '$x_2$'}, 'Interpreter', 'latex')
grid

figure(2)
plot(u.time, u.signals.values)
legend({'$u$'}, 'Interpreter', 'latex')
grid