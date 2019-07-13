function turtlebot = load_turtlebot_struct()    
    % Torque actions
    syms tau_r tau_l real;
    
    % Gravity
    syms g real;
    
    % Wheels and chassi
    bodies = load_turtlebot_bodies();
    
    % Generalized outputs and output
    Fq = [0; 0; 0; tau_r; -tau_l];
    u = [tau_r; tau_l];
    
    % Output
    y = [bodies(2).q(1); bodies(3).q(1)];
    
    chassi = bodies(1);
    wheel_r = bodies(2);
    wheel_l = bodies(3);
    
    % States and its derivatives
    q = [chassi.q; wheel_r.q; wheel_l.q];
    qp = [chassi.qp; wheel_r.qp; wheel_l.qp];
    qpp = [chassi.qpp; wheel_r.qpp; wheel_l.qpp];
     
    turtlebot = struct('bodies', bodies, ...
                       'q', q, 'qp', qp, 'qpp', qpp, ...
                       'gravity', [0; 0; -g], 'g', g, ...
                       'states', [q; qp], 'Fq', Fq, ...
                       'u', u, 'y', y);
end