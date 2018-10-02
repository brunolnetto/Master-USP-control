function [yk] = tf2diff(G, y_n, u_m)

m = length(G.num);
n = length(G.den);

a = G.num{1};
b = G.den{1};

Jn_1 = flipud(eye(n));
Jm_1 = flipud(eye(m));

if n >= m:
    a_ = a;
    b_ = [zeros(n-m, 1); a'*Jn_1];
    F = [eye(n); zeros(1, n)];

else
    a_ = [zeros(m-n, 1); b'*Jn_1];
    b_ = b;
    F = [zeros(m-n, n); eye(n); zeros(1, n)];
end

m_ = length(a_);
n_ = length(b_);

delta = zeros(n_);
delta(n_, n_) = 1;

yk = (a_'*delta)^(-1)*(b_'*u_m - a_'*F*y_n);

end