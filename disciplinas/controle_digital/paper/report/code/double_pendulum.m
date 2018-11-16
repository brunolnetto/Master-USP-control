function sys = double_pendulum()
    % Mechanical part
    sys_m = double_pendulum_mechanics();
    
    % Electrical part
    sys_e = double_pendulum_motor();
    % Coupling component
    sys_p = pulley(sys_m, sys_e);

    % System description
    % Substitute redundant variables
    sys.f = sys_m.f;
    sys.f = subs(formula(sys.f), sys_m.u{1}, sys_p.F);
    sys.f = subs(formula(sys.f), sys_e.wm, sys_p.wm);
    
    % Sensors read
    sys.g = [sys_m.q{1}; sys_m.q{2}; sys_m.q{3}];
    
    % Subssystem of the whole system
    sys.subssystems = {sys_m, sys_e, sys_p};
    
    % States
    sys.states = [sys_m.q{1}; sys_m.q{2}; sys_m.q{3}];
    sys.states = [sys.states; sys_m.qp{1}; sys_m.qp{2}; sys_m.qp{3}];
    
    % Input
    sys.u = [sys_e.u{1}];

    % Parameters of the plant
    sys.model_params = load_params();
    
    % System symbolics
    sys.syms = [sys_m.syms, sys_e.syms, sys_p.syms];

    % Model parameters
    sys.model_params = load_params();
    
    % Linearization point
    sys.linearize = @(x0) lin_pendulum(sys, x0);
end