% Member Lengths [m]
syms L01 L02 L03 real;
syms L11 L12 L13 real;
syms L21 L22 L23 real;
syms Le1 Le2 Le3 real;

% Mass center distances and orientation [m, rad]
syms L11cg L12cg L13cg real;
syms L21cg L22cg L23cg real;
syms Lecg deltaecg real;

% Masses [Kg]
syms m11 m12 m13 real; 
syms m21 m22 m23 real;
syms me real;

% Inertial moments [Kg*m^2]
syms J11 J12 J13 real;
syms J21 J22 J23 real;
syms Je real;

% Orientation for motors and platform member joints [rad]
syms beta1 beta2 beta3 real;
syms gamma1 gamma2 gamma3 real;

% Platform orientation, velocity and acceleration [m, m/s, m/s^2]
syms alpha(t)   x(t)   y(t);
syms alphap(t)  xp(t)  yp(t);
syms alphapp(t) xpp(t) ypp(t);

% First bar orientation, velocity and acceleration [m, m/s, m/s^2]
syms th11(t)   th12(t)   th13(t);
syms th11p(t)  th12p(t)  th13p(t);
syms th11pp(t) th12pp(t) th13pp(t);

% First bar orientation, velocity and acceleration [m, m/s, m/s^2]
syms th21(t)   th22(t)   th23(t);
syms th21p(t)  th22p(t)  th23p(t);
syms th21pp(t) th22pp(t) th23pp(t);

% Motor efforts
syms Tau1 Tau2 Tau3 real;

assume([alpha(t),  x(t),   y(t), ...
       alphap(t),  xp(t),  yp(t), ...
       alphapp(t), xpp(t), ypp(t)], 'real');
   
assume([th11(t),   th12(t),   th13(t), ...
        th11p(t),  th12p(t),  th13p(t), ...
        th11pp(t), th12pp(t), th13pp(t)], 'real');
   
assume([th21(t),   th22(t),   th23(t), ...
        th21p(t),  th22p(t),  th23p(t), ...
        th21pp(t), th22pp(t), th23pp(t)], 'real');