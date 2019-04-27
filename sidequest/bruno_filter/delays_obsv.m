% Delayed system
[n, m] = size(Gamma_obsv);

Phi_aug = [Phi_obsv, zeros(n, (n_d-1)*m), Gamma_aug;
           zeros(m, n + n_d*m);
           zeros((n_d - 1)*m, n), eye((n_d - 1)*m), zeros((n_d - 1)*m, m)];

Gamma_aug = [zeros(n, m); 
             eye(m, m); 
             zeros((n_d-1)*m, (n_d-1)*m)];


C_obsv = [C_obsv, zeros(p, m*n_d)];

sys_name = [sys_name, sprintf(' + %d delay', n_d)];
is_ctrb_obsv(sys_name, Phi_obsv, Gamma_obsv, C_obsv)