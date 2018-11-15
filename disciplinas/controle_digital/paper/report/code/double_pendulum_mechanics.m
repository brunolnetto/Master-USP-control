function sys = double_pendulum_mechanics()
    % Inertial parameters
    syms m0 m1 m2;
    syms L1_cg L2_cg; 

    % Gravity
    syms g;

    % Force applied to system
    syms F;
    
    % Viscuous friction
    syms b0 b1 b2;
       
    gravity = [0; -g; 0];

    I0 = zeros(3, 3);
    I1 = sym('I1_%d%d', [3, 3]);
    I2 = sym('I2_%d%d', [3, 3]);
    
    % Length parameters
    L = sym('L%d', [1, 2]);
    L0cg = [0; 0; 0];
    L1cg = [L1_cg; 0; 0];
    L2cg = [L2_cg; 0; 0];

    % Generalized variables
    syms x(t) th1(t) th2(t);
    syms xp(t)  th1p(t)  th2p(t);
    syms xpp(t) th1pp(t) th2pp(t);
    
    % Bodies
    % Car
    Ts_car = {T3d(0, [0, 0, 1].', [x; 0; 0])};
    
    car = build_body(m0, I0, b0, Ts_car, L0cg, x, xp, xpp, true);

    % Bar 1
    Ts_bar1 = {car.T, ...
               T3d(-pi/2, [0, 0, 1].', [0; 0; 0]), ...
               T3d(th1, [0, 0, 1].', [0; 0; 0])};

    bar1 = build_body(m1, I1, b1, Ts_bar1, L1cg, th1, th1p, th1p, false);

    % Bar 2
    Ts_bar2 = {bar1.T, T3d(0, [0, 0, 1].', [L(1); 0; 0]), ...
               T3d(th2, [0, 0, 1].', [0; 0; 0])};

    bar2 = build_body(m2, I2, b2, Ts_bar2, L2cg, th2, th2p, th2pp, ...
                      false);

    % System
    % Variables used to substitute by diff's
    sys.varq = [xp, th1p, th2p, xpp, th1pp, th2pp];
    sys.diffq = [diff(x, t), diff(th1, t), diff(th2, t), ...
                 diff(xp, t), diff(th1p, t), diff(th2p, t)];

    sys.bodies = {car, bar1, bar2}; 
    sys.gravity = gravity;
    sys.g = g;

    sys.q = {x; th1; th2};
    sys.qp = {xp; th1p; th2p};
    sys.qpp = {xpp; th1pp; th2pp};
    
    sys.Fq = {F; 0; 0};
    sys.u = {F};
    
    % Movement formalism
    sys = kinematic_model(sys);
    
    % Updated bodies
    sys.bodies{1}.previous_body = struct('');
    sys.bodies{2}.previous_body = sys.bodies{1};
    sys.bodies{3}.previous_body = sys.bodies{2};
    
    sys = dynamic_model(sys);
    
    % Sensors output
    sys.g = [x; th2];
    
    % System symbolics
    sys.syms = [g];
    
    sys.bodies{1}.syms = [m0, b0];
    sys.bodies{2}.syms = [m1, I1, b1, L(1), L1_cg];
    sys.bodies{3}.syms = [m2, I2, b2, L(2), L2_cg];
end