function sys = double_pendulum()
    % Mechanical part
    sys_m = double_pendulum_mechanics();
    
    % Coupling component
    sys_p = pulley();
    
    % Electrical part
    sys_e = double_pendulum_motor();

    % System description
    sys.leqdyns = sys_m.leqdyns;   
    
    yp = sys_p.transform(sys_p.u);
    F = yp(2);
    
    yp_1 = sys_p.transform_1(sys_p.y);
    wm = yp_1(1);
    
    ye = sys_e.transform(sys_e.u, wm);    
    Tau = ye;
       
    sys.l_r = subs(sys_m.l_r, sys_m.u, F);
    sys.l_r = subs(sys.l_r, sys_e.y, Tau);
    sys.l_r = subs(sys.l_r, sys_p.u(2), wm);
       
    sys.u = sys_e.u;
    sys.qp = sys_m.qp;
    sys.qpp = sys_m.qpp;
    sys.g = symvar(sys_m.gravity);
    
    sys.H = equationsToMatrix(sys.l_r, sys.qpp.');
    
    sys.Z = -equationsToMatrix(sys.l_r, sys.u);
    sys.h = sys.l_r - sys.H*sys.qpp + sys.Z*sys.u;

    % Sytem behaviour and sensoring
    qpps = sys.H\(sys.Z*sys.u - sys.h);
    qps = sys.qp;
    
    sys.f = [qps; qpps];
    sys.g = [sys_m.q(1); sys_m.q(2); sys_m.q(3)];
    
    % Subssystem of the whole system
    sys.subssystems = {sys_m, sys_e, sys_p};
    
    % States
    sys.states = [sys_m.q(1); sys_m.q(2); sys_m.q(3)];
    sys.states = [sys.states; sys_m.qp(1); sys_m.qp(2); sys_m.qp(3)];
    
    % Input
    sys.u = sys_e.u(1);

    % Parameters of the plant
    sys.model_params = load_params();
    
    % System symbolics
    sys.syms = [sys_m.syms, sys_e.syms, sys_p.syms];

    % Model parameters
    sys.model_params = load_params();
    
    % Linearization point
    sys.linearize = @(x0) lin_pendulum(sys, x0);
end