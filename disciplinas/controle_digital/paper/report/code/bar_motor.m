function sys = bar_motor()
    % Electrical part - motor 
    % Remarks: Inductance neglected
    syms Kt_b Ke_b Ra_b real;
    syms xp F real;
    syms Vcc_b u PWM_b real;

    % Mechanical part - motor 
    % Remarks: Inertia neglected
    syms wm_b Tau_b;
    
    % Shaft torque
    Vt = Ke_b*wm_b;
    V_pwm = Vcc_b*PWM_b;
    Tau_ = (Kt_b/Ra_b)*(V_pwm - Vt);
    sys.i = Tau_/Kt_b;
       
    % Tension on armature
    sys.u = PWM_b;
    sys.transform = @(u, wm_) subs(Tau_, [wm_b, sys.u], [wm_, u]);
    sys.y = [wm_b, Tau_b];
        
    sys.states = [];
    
    % Electrical and mechanical system
    sys.syms = [Kt_b, Ke_b, Ra_b, Vcc_b];
end