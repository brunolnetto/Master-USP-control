function sys = pulley_motor()
    % Electrical part - motor 
    % Remarks: Inductance neglected
    syms Kt_p Ke_p Ra_p real;
    syms xp F real;
    syms Vcc_p u PWM_p real;

    % Mechanical part - motor
    syms wm_p Tau_p;
    
    % Shaft torque
    Vt = Ke_p*wm_p;
    V_pwm = Vcc_p*PWM_p;
    Tau_ = (Kt_p/Ra_p)*(V_pwm - Vt);
    sys.i = Tau_/Kt_p;
       
    % Tension on armature
    sys.u = PWM_p;
    sys.transform = @(u, wm_) subs(Tau_, [wm_p, sys.u], [wm_, u]);
    sys.y = [wm_p, Tau_p];
        
    sys.states = [];
    
    % Electrical and mechanical system
    sys.syms = [Kt_p, Ke_p, Ra_p, Vcc_p];
end