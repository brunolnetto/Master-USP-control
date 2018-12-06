function sim = update_sim(i, mechanism, trajectory)
    % Generalized variables
    q_bullet = trajectory.q(i, :);
    qp_bullet = trajectory.qp(i, :);
    qpp_bullet = trajectory.qpp(i, :);
    
    [q_curr, ~, ...
     p_curr, pp_curr] = q_qp_p_pp(mechanism, q_bullet, qp_bullet, qpp_bullet);
    
    q = [mechanism.eqdyn.q_bullet, mechanism.eqdyn.q_circ];

    sim.q = q_curr;
    sim.p = p_curr;
    sim.pp = pp_curr;
    
    % Simulation variables
    % First iteration
    if(i == 1)
        sim.previous_time = trajectory.time(1);
        sim.current_time = trajectory.time(2);
        
        % Generalized variables
        q_bullet_next = trajectory.q(2, :);
        qp_bullet_next = trajectory.qp(2, :);
        qpp_bullet_next = trajectory.qp(2, :);
        
        [q_next, ~, ~] = generalized_variables(mechanism, ...
                                               xfun_q_bullet,...
                                               q_bullet_next, ...
                                               qp_bullet_next, ...
                                               qpp_bullet_next);
        
        % It seems inverted, but it was on purpose. The first iteration is
        % cumbersome and takes the next step in advance
        sim.C_prev = [];
        sim.C_curr = coupling_matrixC(mechanism, q_next);
    else
        sim.previous_time = sim.current_time;
        sim.current_time = trajectory.time(i);
        
        sim.C_prev = sim.C_curr;
        sim.C_curr = coupling_matrixC(mechanism, q_curr);
    end
    
    % Euler approximation
    t_prev = sim.previous_time;
    t_curr = sim.current_time;
    delta_t = t_curr - t_prev;
    
    sim.Cp = (sim.C_curr - sim.C_prev)/delta_t;

    for i = 1:3
        sim.serials{i}.A = subs(mechanism.serials{i}.A, q, q_curr);
        sim.serials{i}.O = subs(mechanism.serials{i}.O, q, q_curr);
        sim.endeffector.B{i} = subs(sim.endeffector.B{i}, q, q_curr);
    end
end