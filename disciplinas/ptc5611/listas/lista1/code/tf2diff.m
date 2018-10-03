function [yk] = tf2diff(num, den, y_n, u_m)
m = length(G.num);
n = length(G.den);

a = num;
b = den;

yk = (b'*u_m - a(2:end)'*y_n)/a(1);

end