function [c, ceq] = nlcond(x, x_WP, R, states, Vdot)
    c = norm([x(1); x(2)] - [x_WP(1); x_WP(2)])^2 - R^2;
    ceq = double(subs(Vdot, states, x));
end