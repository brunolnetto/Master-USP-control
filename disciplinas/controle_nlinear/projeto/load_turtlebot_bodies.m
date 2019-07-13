function bodies = load_turtlebot_bodies()
    % Positions
    syms x y real
    syms xp yp real
    syms xpp ypp real
    
    % Angles
    syms th_c th_r th_l real;
    syms thp_c thp_r thp_l real;
    syms thpp_c thpp_r thpp_l real;
    
    % Systems main parameters
    syms l_r l_l l_c l_b real; 
    syms D_r D_l real;
    syms m_c m_r m_l real;
        
    % Inertia tensor matrix
    I_c = sym('I%d%d_c', [3, 3]);
    I_r = sym('I%d%d_r', [3, 3]);
    I_l = sym('I%d%d_l', [3, 3]);
    
    % Chassi Symmetric inertia tensor
    I_c(2, 1) = I_c(1, 2);
    I_c(3, 1) = I_c(1, 3);
    I_c(3, 2) = I_c(2, 3);
    
    % Chassi Symmetric inertia tensor
    I_r(2, 1) = I_r(1, 2);
    I_r(3, 1) = I_r(1, 3);
    I_r(3, 2) = I_r(2, 3);
    
    % Chassi Symmetric inertia tensor
    I_l(2, 1) = I_l(1, 2);
    I_l(3, 1) = I_l(1, 3);
    I_l(3, 2) = I_l(2, 3);
    
    %------------------------------------------------%
    % Chassi
    q_c = [x, y, th_c].';
    qp_c = [xp, yp, thp_c].';
    qpp_c = [xpp, ypp, thpp_c].';
    
    % Chassi position related to center of mass
    p_cg_c = [l_c; 0; 0];
    d_c = [x, y, 0].';

    % Transformation matrices
    T_0c =  T3d(th_c, [0, 0, 1]', d_c);
    Ts_c = {T_0c};
    
    chassi.m = m_c;
    chassi.inertia = I_c;
    chassi.Ts = Ts_c;
    chassi.p_cg = p_cg_c;
    chassi.b = 0;    
    chassi.fric_is_linear = 0;
    chassi.q = q_c;
    chassi.qp = qp_c;
    chassi.qpp = qpp_c;    
    chassi.previous_body = struct('');
    chassi.params = [l_c, m_c];
    
    %------------------------------------------------%
    % Right wheel
    q_r = th_r;
    qp_r = thp_r;
    qpp_r = thpp_r;
    
    p_cg_r = [l_r; 0; 0];
    d_r = [0; -l_b/2; 0];
    T_cr =  T3d(th_r, [0, -1, 0]', d_r);
    T_0r = simplify(T_0c*T_cr);
    
    Ts_r = {T_0c, T_cr};
    
    wheel_r.m = m_r;
    wheel_r.inertia = I_r;
    wheel_r.Ts = Ts_r;
    wheel_r.p_cg = p_cg_r;
    wheel_r.b = 0;    
    wheel_r.q = th_r;
    wheel_r.qp = thp_r;
    wheel_r.qpp = thpp_r;
    wheel_r.fric_is_linear = 0;
    wheel_r.previous_body = chassi;
    wheel_r.params = [l_r, D_r, m_r];
        
    %------------------------------------------------%
    % Left wheel    
    q_l = th_l;
    qp_l = thp_l;
    qpp_l = thpp_l;
    
    p_cg_l = [0; l_c; 0];
    d_l = [0; l_b/2; 0];
    T_cl =  T3d(th_l, [0, 1, 0]', d_l);
    T_0l = T_0c*T_cl;
    
    Ts_l = {T_0c, T_cl};
    
    wheel_l.m = m_l;
    wheel_l.inertia = I_l;
    wheel_l.Ts = Ts_l;
    wheel_l.p_cg = p_cg_l;
    wheel_l.b = 0;    
    wheel_l.q = th_l;
    wheel_l.qp = thp_l;
    wheel_l.qpp = thpp_l;
    wheel_l.fric_is_linear = 0;
    wheel_l.previous_body = chassi;
    wheel_l.params = [l_l, D_l, m_l];
        
    % Body builder
    bodies_descrip = [chassi, wheel_r, wheel_l];
    
    bodies = build_bodies(bodies_descrip);
end