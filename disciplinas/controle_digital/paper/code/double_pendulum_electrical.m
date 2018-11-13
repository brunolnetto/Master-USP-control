function sys = double_pendulum_electrical(sys)
    syms Kt Ke Ra Vcc PWM;
    syms R;
    
    % Shaft torque
    Tau = (Kt/Ra)*(Vcc*PWM - Ke*sys.qp{1}/R);
    
    % Wire traction
    F = sys.u{1};
    F_ = Tau/R;
    
    % Electrical and mechanical system
    sys.f = subs(sys.f, F, F_);
    sys.syms =  [sys.syms, Kt, Ra, Ke, R, Vcc];
end