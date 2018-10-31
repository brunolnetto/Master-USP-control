% Position constraint - Equality
const_0 = const == 0;

% Velocity constraint - Differentiation
const_0p = diff(const_0, t);
const_0p = subs(const_0p, diff2p, varp);

% Acceleration constraint - Differentiation
const_0pp = diff(const_0p == 0, t);
const_0pp = subs(const_0pp, [diff2p, diff2pp], [varp, varpp]);
