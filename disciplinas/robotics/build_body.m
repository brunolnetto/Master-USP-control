function body = build_body(m, inertia, b, Ts, p_cg, q, qp, qpp, fric_is_linear, varq, diffq)
    syms t;
    
    body.m = m;
    body.I = inertia;

    % Generalized coordinates
    body.q = q;
    body.qp = qp;
    body.qpp = qpp;
       
    % Body position transformations
    body.T = eye(4, 4);
    u = sym('u', size(q));
    assume(u, 'real');
    
    for T = Ts
        T_ = subs(T{1}, q, u);
        body.T = simplify(body.T*T_);
        body.T = subs(body.T, u, q);
    end
     
    % Body velocity transformations
    body.Tp = Tp(body.T, diffq, varq);
    
    % Body acceleration transformations
    body.Tpp = Tp(body.T, diffq, varq);
    
    % Center of mass position
    body.p_cg = point(body.T, p_cg);
    
    % Center of mass velocity
    body.v_cg = velocity(body.Tp, p_cg);
    
    % Body angular velocity
    body.omega = omega(body.T, varq, diffq);
    
    % Friction information
    body.b = b;
    body.fric_is_linear = fric_is_linear;
end