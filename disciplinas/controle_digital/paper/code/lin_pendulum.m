function sys =  lin_pendulum(sys, WP)
    % Linearization on working point
    states = [];
    for i = 1:max(size(sys.q))
        states = [states; sys.q{i}];
    end 
    
    for  i = 1:max(size(sys.qp))
        states = [states; sys.qp{i}];
    end
    
    linvars = [];
    for  i = 1:max(size(sys.u))
        ui = sys.u{i};
        linvars = [states; ui];
    end 
    
    sys.states = states;
    sys.linvars = linvars;
        
    % Auxiliarry subs variables
    n = max(size(formula(linvars)));
    u = sym('u', [n, 1]);
    u_x = u(1:n-1);
    u_u = u(end);
    
    % System behaviour's function 
    f_u = subs(sys.f, linvars, u);
    
    % Sensor behaviour's function
    g_u = subs(sys.g, linvars, u);
    % Matrices A, B, C and D for each working-point
    syms x_0 th1_0 th2_0 xp_0 th1p_0 th2p_0 PWM_0;
    sys.lin_states = [x_0; th1_0; th2_0; xp_0; th1p_0; th2p_0; PWM_0];
    
    sys.jacf_x = subs(jacobian(f_u, u_x), u, sys.lin_states);
    sys.jacf_u = subs(jacobian(f_u, u_u), u, sys.lin_states);
    sys.jacg_x = subs(jacobian(g_u, u_x), u, sys.lin_states);
    sys.jacg_u = subs(jacobian(g_u, u_u), u, sys.lin_states);
    
    % Matrices on the provided working-point
    A = subs(sys.jacf_x, sys.lin_states, WP);
    B = subs(sys.jacf_u, sys.lin_states, WP);
    C = subs(sys.jacg_x, sys.lin_states, WP);
    D = subs(sys.jacg_u, sys.lin_states, WP);
    
    % Compact version of A, B, C and D matrices
    sys.A = simplify(A);
    sys.B = simplify(B);
    sys.C = simplify(C);
    sys.D = simplify(D);
end