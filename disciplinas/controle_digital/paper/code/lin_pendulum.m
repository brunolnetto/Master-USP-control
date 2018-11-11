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
        Fq = sys.u{i};
        linvars = [states; Fq];
    end 
    
    sys.states = states;
    sys.linvars = linvars;
        
    % Auxiliarry subs variables
    n = max(size(formula(linvars)));
    u = sym('u', [n, 1]);
    u_x = u(1:n);
    u_u = u(end);
    
    % System behaviour's function 
    f_u = subs(sys.f, linvars, u);
    g_u = subs(sys.g, linvars, u);

    % Sensor behaviour's function     
    sys.A = simplify(subs(jacobian(f_u, u_x), u, WP));
    sys.B = simplify(subs(jacobian(f_u, u_u), u, WP));
    sys.C = simplify(subs(jacobian(g_u, u_x), u, WP));
    sys.D = simplify(subs(jacobian(g_u, u_u), u, WP));
end