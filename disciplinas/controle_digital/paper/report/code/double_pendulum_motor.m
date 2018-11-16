function sys = double_pendulum_motor()
    % Electrical part - motor 
    % Remarks: Inductance neglected
    syms Kt Ke Ra b_m;
    syms Vcc u PWM;

    % Mechanical part - motor 
    % Remarks: Inertia neglected
    syms wm;
    syms R;
    
    % Shaft torque
    sys.Tau = (Kt/Ra)*(u - (Ke + Ra*b_m/Kt)*wm);
    sys.wm = wm;
    sys.i = (1/Kt)*(sys.Tau + b_m*sys.wm);
    
    
    % Tension on armature
    u_ = Vcc*PWM;
    
    sys.u = {PWM};
    
    % Torque with main values substituted
    sys.Tau = subs(sys.Tau, u, u_);
    sys.i = subs(sys.i, u, u_);
    
    % Electrical and mechanical system
    sys.syms = [Kt, Ke, Ra, R, b_m, Vcc];
end