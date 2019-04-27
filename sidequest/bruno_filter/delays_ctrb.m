% Delayed system
[n, m] = size(Gamma_ctrb);

Phi_ctrb = [Phi_ctrb, zeros(n, (n_d-1)*m), Gamma_ctrb;
           zeros(m, n + n_d*m);
           zeros((n_d - 1)*m, n), eye((n_d - 1)*m), zeros((n_d - 1)*m, m)];

Gamma_ctrb = [zeros(n, m); 
             eye(m, m); 
             zeros((n_d-1)*m, (n_d-1)*m)];


C_ctrb = [C_ctrb, zeros(p, m*n_d)];

sys_name = [sys_name, sprintf(' + %d delay', n_d)];
is_ctrb_obsv(sys_name, Phi_ctrb, Gamma_ctrb, C_ctrb)