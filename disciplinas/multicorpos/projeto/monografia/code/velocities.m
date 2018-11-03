% Center of mass velocities
v11_cg = velocity(T021p, di(L11cg));
v12_cg = velocity(T022p, di(L12cg));
v13_cg = velocity(T023p, di(L13cg));

v21_cg = velocity(T031p, di(L21cg));
v22_cg = velocity(T032p, di(L22cg));
v23_cg = velocity(T033p, di(L23cg));

ve_cg = velocity(T0ep, de_cg);

% Velocity for each member and each center of mass
V1_CG = [v11_cg; v12_cg; v13_cg];
V2_CG = [v21_cg; v22_cg; v23_cg];
Ve_CG = ve_cg;

% Angular velocity for each member and each center of mass
w1 = q1p;
w2 = q1p + q2p;           
we = alphap;

% Linear and angular velocities of eash member and body on mechanism
V_cg = [V1_CG; V2_CG; Ve_CG];
Omega = [w1; w2; we];

% Velocity vector
V = [V_cg; Omega];