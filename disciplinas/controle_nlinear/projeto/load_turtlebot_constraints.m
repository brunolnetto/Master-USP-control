function turtlebot = load_turtlebot_constraints(turtlebot)
    R_c =  turtlebot.bodies(1).T(1:3, 1:3);
    R_r =  turtlebot.bodies(2).T(1:3, 1:3);
    R_l =  turtlebot.bodies(3).T(1:3, 1:3);
    
    i_c =  R_c(:, 1);
    j_c = R_c(:, 2);
    
    % Bodies center of mass
    v_cg_c = turtlebot.bodies(1).v_cg;
    v_cg_r = turtlebot.bodies(2).v_cg;
    v_cg_l = turtlebot.bodies(3).v_cg;
    
    % States for constraints
    thp_r = turtlebot.qp(4);
    thp_l = turtlebot.qp(5);

    % Radius
    R_r = turtlebot.bodies(2).params(2)/2;
    R_l = turtlebot.bodies(3).params(2)/2;
    
    % Wheel angles
    th_r = turtlebot.bodies(2).q;
    th_l = turtlebot.bodies(3).q;
    
    %  Cross velocity is zero on robot reference frame
    % and velocity of each wheel is along the robot's movement
    A = equationsToMatrix([dot(v_cg_c, j_c);
                           dot(v_cg_r, i_c) - R_r*thp_r;
                           dot(v_cg_l, i_c) - R_l*thp_l], turtlebot.qp);
                       
    A = simplify(A);
    
    turtlebot.is_constrained = true;
    turtlebot.unhol_constraints = A*turtlebot.qp;
    
    [n_p, n_q] = size(A);
    turtlebot.p = sym('p_%d', [n_q - n_p, 1]);
    turtlebot.pp = sym('pp_%d', [n_q - n_p, 1]);
end