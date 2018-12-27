function sys = single_pendulum()
    % Mechanical part
    sys_m = single_pendulum_mechanics();
        
    % Coupling component
    sys_p = pulley();
    
    % Electrical part
    sys_e1 = pulley_motor();
    
    % Electrical part
    sys_e2 = bar_motor();

    % System description
    sys.leqdyns = sys_m.leqdyns;
    sys.reqdyns = sys_m.reqdyns;
    sys.l_r = sys_m.leqdyns - sys_m.reqdyns;
    
    % Interface variables
    yp = sys_p.transform(sys_p.u);
    F = yp(2);
    
    yp_1 = sys_p.transform_1(sys_p.y);
    wm_p = yp_1(1);
        
    ye_1 = sys_e1.transform(sys_e1.u, wm_p);    
    Tau_p = ye_1(1);
    
    wm_b = sys_m.qp(2);
    
    ye_2 = sys_e1.transform(sys_e2.u, wm_b);
    Tau_b = ye_2(1);
    
    % Interface substitutions
    sys.l_r = subs(sys_m.l_r, sys_m.u(1), F);
    sys.l_r = subs(sys.l_r, sys_m.u(2), Tau_b);
    sys.l_r = subs(sys.l_r, sys_p.u(1), wm_p);
    sys.l_r = subs(sys.l_r, sys_e2.y(1), wm_b);
    sys.l_r = subs(sys.l_r, sys_p.u(2), Tau_p);
        
    % Input
    sys.u = [sys_e1.u(1); sys_e2.u(1)];
    
    % States derivatives
    sys.qp = sys_m.qp;
    sys.qpp = sys_m.qpp;
   
    sys.g = symvar(sys_m.gravity);
    
    sys.H = jacobian(sys.l_r, sys.qpp);
    sys.Z = -jacobian(sys.l_r, sys.u);
    sys.h = sys.l_r - sys.H*sys.qpp + sys.Z*sys.u;
    
    % Sytem behaviour and sensoring
    qpps = sys.H\(sys.Z*sys.u - sys.h);
    qps = sys.qp;
    
    sys.f = [qps; qpps];
    sys.g = sys_m.q;
    
    % Subssystem of the whole system
    sys.subsystems = {sys_m, sys_e1, sys_e2, sys_p};
    
    % States
    sys.states = [sys_m.q(1); sys_m.q(2)];
    sys.states = [sys.states; sys_m.qp(1); sys_m.qp(2)];
    
    % System symbolics
    sys.syms = [sys_m.syms, sys_e1.syms, sys_e2.syms, sys_p.syms];

    % Parameters of the plant
    sys.model_params = load_single_params();
    pars = load_single_mechanism_params();
    sys.subsystems{1}.model_params = pars;
        
    % Working point
    x_WP = [0; pi; 0; 0];
    u_WP = [0; 0];
    WP = [x_WP; u_WP];
    
    % Time delays for the system
    ndelay = 2;
    
    % Sample time for the system
    Ts = 1/100;

    % Linearized system
    sys.lin_sys = lin_pendulum(sys, WP, Ts, ndelay);
end