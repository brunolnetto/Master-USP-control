function sys =  lin_pendulum(sys, WP)
    sys.linvars = [sys.states; sys.u];
    
    % Auxiliarry subs variables
    n = length(formula(sys.linvars));
    u = sym('u', [n, 1]);
    u_x = u(1:n-1);
    u_u = u(end);
    
    % System behaviour's function 
    f_u = subs(sys.f, sys.linvars, u);
    
    % Sensor behaviour's function
    g_u = subs(sys.g, sys.linvars, u);
    
    % Matrices A, B, C and D for each working-point
    syms x_0 th1_0 th2_0 xp_0 th1p_0 th2p_0 PWM_0;
    sys.lin_states = [x_0; th1_0; th2_0; ...
                      xp_0; th1p_0; th2p_0; PWM_0];
    
    sys.A0 = subs(jacobian(f_u, u_x), u, sys.lin_states);
    sys.B0 = subs(jacobian(f_u, u_u), u, sys.lin_states);
    sys.C0 = subs(jacobian(g_u, u_x), u, sys.lin_states);
    sys.D0 = subs(jacobian(g_u, u_u), u, sys.lin_states);
    
    % Matrices on the provided working-point
    A = subs(sys.A0, sys.lin_states, WP);
    B = subs(sys.B0, sys.lin_states, WP);
    C = subs(sys.C0, sys.lin_states, WP);
    D = subs(sys.D0, sys.lin_states, WP);
         
    sys.A = simplify(A);
    sys.B = simplify(B);
    sys.C = simplify(C);
    sys.D = simplify(D);
    
    sys.A = double(subs(sys.A, sys.syms, sys.model_params));
    sys.B = double(subs(sys.B, sys.syms, sys.model_params));
    sys.C = double(subs(sys.C, sys.syms, sys.model_params));
    sys.D = double(subs(sys.D, sys.syms, sys.model_params));
    
    sys = plant_behaviour(sys);
end