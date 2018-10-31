% Motor joints Oi
O1 = point(T011, di(0));
O2 = point(T012, di(0));
O3 = point(T013, di(0));

% Elbow joint Ai
A1 = point(T021, di(L11));
A2 = point(T022, di(L12));
A3 = point(T023, di(L13));

% Platform joints Bi - Member side
B1m = point(T031, di(L21));
B2m = point(T032, di(L22));
B3m = point(T033, di(L23));

% Platform joints Bi - Platform side
B1p = point(T0e, rot2d(gamma1)*di(Le1));
B2p = point(T0e, rot2d(gamma2)*di(Le2));
B3p = point(T0e, rot2d(gamma3)*di(Le3));

% Center of mass
P11cg = point(T011, di(L11_cg));
P12cg = point(T012, di(L12_cg));
P13cg = point(T013, di(L13_cg));

P21cg = point(T021, di(L21_cg));
P22cg = point(T022, di(L22_cg));
P23cg = point(T023, di(L23_cg));

[xecg, yecg] = pol2cart(delta_e_cg, Le_cg);
de_cg = [xecg; yecg];
Pecg = point(T0e, de_cg);
