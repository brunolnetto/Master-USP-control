function turtlebot = load_turtlebot()
    
    % Positions
    syms x(t) y(t)
    syms xp(t) yp(t)
    syms xpp(t) ypp(t)

    % Angles
    syms th_c(t) th_r(t) th_l(t)
    syms thp_c(t) thp_r(t) thp_l(t)
    syms thpp_c(t) thpp_r(t) thpp_l(t)

    % Systems main parameters
    syms l_c l_b
    syms D_r D_l
    syms m_c m_r m_l
    syms w_r w_l
    
    % Inertia tensor
    I_c = sym('I%d%d_c', [3, 3]);
    I_r = sym('I%d%d_r', [3, 3]);
    I_l = sym('I%d%d_l', [3, 3]);

    diffs = {diff(x(t), t), diff(y(t), t), ...
             diff(th_c(t), t), diff(th_r(t), t), diff(th_l(t), t), ...
             diff(xp(t), t), diff(yp(t), t), ...
             diff(thp_c(t), t), diff(thp_r(t), t), diff(thp_l(t), t)};
    
    vars = {xp, yp, thp_c, thp_r, thp_l, ...
            xpp, ypp, thpp_c, thpp_r, thpp_l};
        
    q = [x, y, th_c, th_r, th_l].';
    qp = [xp, yp, thp_c, thp_r, thp_l].';
    qpp = [xpp, ypp, thpp_c, thpp_r, thpp_l].';
    
    %------------------------------------------------%
    
    % Chassi
    q_c = [x, y, th_c];
    qp_c = [xp, yp, thp_c];
    qpp_c = [xpp, ypp, thpp_c];
    
    p_cg_c = [0; l_c; 0];
    d_c = [x, y, 0].';

    T_0c =  T3d(th_c, [0, 0, 1]', d_c);
    
    Ts_c = {T_0c};
    
    chassi = build_body(m_c, I_c, 0, Ts_c, p_cg_c, ...
                        q_c, qp_c, qpp_c, ...
                        false, struct());
    Tp_0c = Tp(T_0c, diffs, vars);

    v_c = velocity(Tp_0c, p_cg_c);
    
    %------------------------------------------------%
    
    % Right wheel
    q_c = [x, y, th_c];
    qp_c = [xp, yp, thp_c];
    qpp_c = [xpp, ypp, thpp_c];
    
    p_cg_r = [0; w_r/2; 0];
    d_r = [-l_b/2; l_c; 0];
    T_cr =  T3d(th_r, [1, 0, 0]', d_r);
    T_0r = T_0c*T_cr;
    
    q_r = th_r;
    qp_r = thp_r;
    qpp_r = thpp_r;
    
    
    Ts_r = {T_0r, T_cr};
    
    wheel_r = build_body(m_r, I_r, 0, Ts_r, p_cg_r, ...
                         q_r, qp_r, qpp_r, ...
                         false, struct());
                         
    % Right wheel transformation derivative
    Tp_0r = Tp(T_0r, diffs, vars);
    v_r = velocity(Tp_0r, p_cg_r);
    
    %------------------------------------------------%
    
    % Left wheel
    p_cg_l = [w_r/2; 0; 0];
    d_l = [l_b/2; l_c; 0];
    T_cl =  T3d(th_l, [-1, 0, 0]', d_l);
    T_0l = T_0c*T_cl;
    
    Ts_l = {T_0l, T_cl};
    
    wheel_l = build_body(m_r, I_r, 0, Ts_r, p_cg_r, ...
                         q_r, qp_r, qpp_r, ...
                         false, struct());
    
    Tp_0l = Tp(T_0l, diffs, vars);
    v_l = velocity(Tp_0l, p_cg_l);
    
    %------------------------------------------------%
    
    turtlebot = struct('bodies', {chassi, wheel_r, wheel_l}, ...
                       'q', q, 'qp', qp, 'qpp', qpp);
    turtlebot = kinematic_model(turtlebot);
    
end