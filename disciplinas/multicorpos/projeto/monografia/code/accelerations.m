% Center of mass accelerations
a11_cg = acceleration(T021pp, di(L11_cg));
a12_cg = acceleration(T022pp, di(L12_cg));
a13_cg = acceleration(T023pp, di(L13_cg));

a21_cg = acceleration(T031pp, di(L21_cg));
a22_cg = acceleration(T032pp, di(L22_cg));
a23_cg = acceleration(T033pp, di(L23_cg));

[xecg, yecg] = pol2cart(delta_e_cg, Le_cg);
de_cg = [xecg; yecg];
ae_cg = acceleration(T0epp, de_cg);
