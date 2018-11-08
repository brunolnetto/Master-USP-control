% 
% @Author: Bruno Peixoto
% @Date: 08/11

% Plant parameters

% Inertial parameters
syms m0 m1 m2;

m = [m0; m1; m2];
I1 = sym('I1_%d%d', [3, 3]);
I2 = sym('I2_%d%d', [3, 3]);

% Length parameters
L = sym('L%d', [1,2]);
Lg = sym('L%d_g', [1,2]);

% Viscuous friction
syms b;

% Generalized variables
syms x   th1   th2;
syms xp(t)  th1p(t) th2p(t);
syms xpp(t) th1pp(t) th2pp(t);

q = [x, th1, th2];
qt = [sym('x(t)'), sym('th1(t)'), sym('th2(t)')];
qpt = [sym('xp(t)'), sym('th1p(t)'), sym('th2p(t)')];
qppt = [sym('xpp(t)'), sym('th1pp(t)'), sym('th2pp(t)')];

diffqt = [diff('x(t)', t), diff('th1(t)', t), diff('th2(t)', t)];
diffqpt = [diff('xp(t)', t), diff('th1p(t)', t), diff('th2p(t)', t)];

varp = [qpt];
diffvarp = [diffqpt];

varpp = [qpt, qppt];
diffvarpp = [diffqt, diffqpt];

% Bodies

% Transformations
car.T = T3d(0, [0, 0, 1].', [x, 0, 0].');
bar1.T = car.T*T3d(th1, [0, 0, 1].', [0; 0; 0]);
bar2.T = bar1.T*T3d(0, [0, 0, 1].', [L(1); 0; 0])*T3d(th2, [0, 0, 1].', [0; 0; 0]);

car.T = simplify(car.T);
bar1.T = simplify(bar1.T);
bar2.T = simplify(bar2.T);

car.T = subs(car.T, q, qt);
bar1.T = subs(bar1.T, q, qt);
bar2.T = subs(bar2.T, q, qt);

% Velocities
car.Tp = Tp(car.T, varp, diffvarp);
bar1.Tp = Tp(bar1.T, varp, diffvarp);
bar2.Tp = Tp(bar2.T, varp, diffvarp);

% Accelerations
car.Tpp = Tp(car.T, varpp, diffvarpp);
bar1.Tpp = Tp(bar1.T, varpp, diffvarpp);
bar2.Tpp = Tp(bar2.T, varpp, diffvarpp);