% Transformation matrices of coordinate systems
% Coordinate frame system 1 (CFS1): Attached to motor i
% Coordinate frame system 2 (CFS2): Attached to first bar i on beginning of bar
% Coordinate frame system 3 (CFS3): Attached to second bar i on elbow
% Coordinate frame system e (CFSe): Attached to end-effector

di = @(L) [L; 0];

% Transformation matrices of position
% #CFS1
T011 = pol2cart(beta1, L01);
T012 = pol2cart(beta2, L02);
T013 = pol2cart(beta3, L03);

% # CFS2
T02i = @(T01i, th1i, di) simplify(T011*T2d(th1i, di));
T021 = T02i(T011, th11, di(0));
T022 = T02i(T012, th12, di(0));
T023 = T02i(T013, th13, di(0));

% # CFS3
T03i = @(T01i, th2i, L1i) T021*T2d(0, di(L1i))*T2d(th21, di(0));
T031 = T03i(T011, th21, L11);
T032 = T03i(T012, th22, L12);
T033 = T03i(T013, th23, L13);

% # CFSe
T0e = T2d(alpha, d);

% Transformation matrices of velocity
% # CFS1
T011p = Tp(T011, diff2p, varp);
T012p = Tp(T012, diff2p, varp);
T013p = Tp(T013, diff2p, varp);

% # CFS2
T021p = Tp(T021, diff2p, varp);
T022p = Tp(T022, diff2p, varp);
T023p = Tp(T023, diff2p, varp);

% # CFS3
T031p = Tp(T031, diff2p, varp);
T032p = Tp(T032, diff2p, varp);
T033p = Tp(T033, diff2p, varp);

% # CFSe
T0ep = Tp(T0e, diff2p, varp);

% Transformation matrices of acceleration
% # CFS1
T011pp = Tpp(T011, [diff2p, diff2pp], [varp, varpp]);
T012pp = Tpp(T012, [diff2p, diff2pp], [varp, varpp]);
T013pp = Tpp(T013, [diff2p, diff2pp], [varp, varpp]);

% # CFS2
T021pp = Tpp(T021, [diff2p, diff2pp], [varp, varpp]);
T022pp = Tpp(T022, [diff2p, diff2pp], [varp, varpp]);
T023pp = Tpp(T023, [diff2p, diff2pp], [varp, varpp]);

% # CFS3
T031pp = Tpp(T031, [diff2p, diff2pp], [varp, varpp]);
T032pp = Tpp(T032, [diff2p, diff2pp], [varp, varpp]);
T033pp = Tpp(T033, [diff2p, diff2pp], [varp, varpp]);

% # CFSe
T0epp = Tpp(T0e, [diff2p, diff2pp], [varp, varpp]);