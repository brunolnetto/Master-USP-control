function turtlebot = load_turtlebot_control(turtlebot)
    syms v1_1 v1_2;
    syms v2_1 v2_2;

    syms ki_1 ki_2 ki_3;
    syms kp_1 kp_2 kp_3;
    
    % Gains for the controller
    Ki = diag([ki_1, ki_2, ki_3]);
    Kp = diag([kp_1, kp_2, kp_3]);
    
    % Inputs for the system
    v1 = [v1_1; v1_2];
    v2 = [v2_1; v2_2];
    
    % System derivatives
    C = turtlebot.C;
    Z = turtlebot.Z;
    H = turtlebot.H;
    h = turtlebot.h;
    y = turtlebot.y;
    y_ref = turtlebot.y_ref;
    
    % Partial exact linearization 
    turtlebot.control.u = Z\(H*v1 + h);
    
    q = turtlebot.q;
    qp = turtlebot.qp;
    
    % Quasi velocities
    p = turtlebot.p;
    
    % z - Intermediate coordinates    
    z_1 = sym('z_1%d', [2, 1]);
    z_2 = sym('z_2%d', [2, 1]);
    z_3 = sym('z_3%d', [3, 1]);
    
    % States declaration
    Pz = simplify(jacobian(y, q)*C);
    
    z1 = y;
    z2 = Pz*p;
    z3 = q(1:3);
    
    turtlebot.control.z1 = z1;
    turtlebot.control.z2 = z2;
    turtlebot.control.z3 = z3;
    
    % Diffeomorphic tranformation
    z13 = [z1; z3];
    z_13 = [z_1; z_3];
    turtlebot.control.z_13 = z_13;
    
    % Transformation - {q, p} -> z
    Qz = equationsToMatrix(z13, q);
    q2z = Qz\z_13;
    p2z = simplify(subs(Pz\z_2, q, q2z));
    q_p = [q; p];
    q_p2z = [q2z; p2z];
    
    qp2z = subs(C*p, q_p, q_p2z);
    
    Pzp = subs(dmatdt(Pz, q, qp), q_p, qp2z);

    turtlebot.control.zp_1 = subs(Pz*p, p, p2z);
    turtlebot.control.zp_2 = subs(Pzp*p + Pz*v1, p, p2z);
    turtlebot.control.zp_3 = subs(jacobian(z3, q)*qp, qp, qp2z);

    % w - Intermediate coordinates    
    w_1 = sym('w_1%d', [2, 1]);
    w_2 = sym('w_2%d', [2, 1]);
    w_3 = sym('w_3%d', [3, 1]);
    
    Pw = simplify(jacobian(y_ref, q)*C);
    
    w1 = y_ref;
    w2 = Pw*p;
    w3 = q(3:5);
    
    turtlebot.control.w1 = w1;
    turtlebot.control.w2 = w2;
    turtlebot.control.w3 = w3;
    
    w13 = [w1; w3];
    w_13 = [w_1; w_3];
    turtlebot.control.w_13 = w_13;
    
    % Transformation - {q, p} -> z
    Qw = equationsToMatrix(w13, q);
    
    q2w = Qw\w_13;
    p2w = simplify(subs(inv(Pw)*w_2, q, q2w));
        
    qp2w = subs(C*p, [q; p], [q2w; p2w]);
    
    Pwp = dmatdt(Pw, q, qp);

    % wp - Intermediate coordinates
    turtlebot.control.wp_1 = simplify(subs(Pw*p, p, p2w));
    turtlebot.control.wp_2 = simplify(subs(Pwp*p + Pw*v2, p, p2w));
    turtlebot.control.wp_3 = subs(jacobian(z3, q)*qp, qp, qp2z);
end