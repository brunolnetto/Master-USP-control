% Position constraint - Equality
eqn_q1top = eqn_con1 == 0;
eqn_q2toq1_p = eqn_con2 == 0;

% Velocity constraint - Differentiation
eqn_q1ptopp = diff(eqn_q1top, t);
eqn_q1ptopp = subs(eqn_q1ptopp, diff2p, varp);

% Solution for motor velocities
tempt_eqn_q1ptopp = subs(eqn_q1ptopp, ...
                         [th11p, th12p, th13p], ...
                         sym('x', [1, 3]));
solq1ptopp = solve(tempt_eqn_q1ptopp, ...
                   sym('x', [1, 3]), ...
                   'ReturnConditions', true);

eqn_q2toq1p_pp = diff(eqn_q2toq1_p, t);
eqn_q2ptoq1ppp = subs(eqn_q2toq1p_pp, diff2p, varp);

tempt_eqn_q2ptoq1p_pp = subs(eqn_q2ptoq1ppp, ...
                            [th21p, th22p, th23p], ...
                            sym('x', [1, 3]));
solq2ptoq1p_pp = solve(tempt_eqn_q2ptoq1p_pp, ...
                     sym('x', [1, 3]), ...
                     'ReturnConditions', true);

% Acceleration constraint - Differentiation
eqn_q1top_pp = diff(eqn_q1top_p, t);
eqn_q1top_pp = subs(eqn_q1top_pp, [diff2p, diff2pp], [varp, varpp]);

eqn_q2toq1p_pp = diff(eqn_q2toq1_p, t);
eqn_q2toq1p_pp = subs(eqn_q2toq1p_pp, diff2p, varp);