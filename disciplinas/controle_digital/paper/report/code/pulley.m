function sys = pulley(sys_m, sys_e)        
    % Pulley conversion
    syms eta;
    
    R = sys_e.syms(4);
    xp = sys_m.qp{1};
    
    Tau = sys_e.Tau;
    
    F_ =  eta*Tau/R;
    wm_ =  -xp/R;
    
    sys.F = F_;
    sys.wm = wm_;
    
    % System symbolics
    sys.syms = eta;
end