function turtlebot = load_turtlebot()
    
    % States and its derivatives
    q = [x, y, th_c, th_r, th_l].';
    qp = [xp, yp, thp_c, thp_r, thp_l].';
    qpp = [xpp, ypp, thpp_c, thpp_r, thpp_l].';
    
    % Turtle parts
    [chassi, wheel_r, wheel_l] = load_turtle_parts();
    
    q = [chassi.q; wheel_r.q; wheel_l.q];
    qp = [chassi.qp, wheel_r.qp, wheel_l.qp];
    qpp = [chassi.qpp, wheel_r.qpp, wheel_l.qpp];
    
    % Body builder
    bodies_descrip = [chassi, wheel_r, wheel_l];
    bodies = build_bodies(bodies_descrip);
    
    % Generalized outputs and output
    Fq = [0; 0; 0; tau_r; -tau_l];
    u = [tau_r; tau_l];
    
    % Output
    y = [th_r; th_l];
   
    turtlebot = struct('bodies', bodies, ...
                       'q', q, 'qp', qp, 'qpp', qpp, ...
                       'gravity', [0; 0; -g], 'g', g, ...
                       'states', [q; qp], 'Fq', Fq, ...
                       'u', u, 'y', y);
    
    R_0c = T_0c(1:3, 1:3);
    i_c = R_0c(:, 1);
    j_c = R_0c(:, 2);
                   
    turtlebot = kinematic_model(turtlebot);
    turtlebot = dynamic_model(turtlebot);    
end