function sim = update_sim(i, sim, mechanism, trajectory)   
    % First iteration
    if(isempty(fieldnames(sim)))
        % Instants
        sim = struct('prev_t', trajectory.t(1), ...
                     'curr_t', trajectory.t(2));
                
        % Generalized variables
        q_bullet_curr = trajectory.q(2, :);
        qp_bullet_curr = trajectory.qp(2, :);
        qpp_bullet_curr = trajectory.qpp(2, :);
             
        % Generalized variables
        q_bullet_prev = trajectory.q(1, :);
        qp_bullet_prev = trajectory.qp(1, :);
        qpp_bullet_prev = trajectory.qp(1, :);
        
        q0_circ = zeros(1, 6);
    else
        % Instants
        sim.prev_t = trajectory.t(i-1);
        sim.curr_t = trajectory.t(i);
        
        % Generalized variables
        q_bullet_curr = trajectory.q(i, :);
        qp_bullet_curr = trajectory.qp(i, :);
        qpp_bullet_curr = trajectory.qpp(i, :);
             
        % Generalized variables
        q_bullet_prev = trajectory.q(i-1, :);
        qp_bullet_prev = trajectory.qp(i-1, :);
        qpp_bullet_prev = trajectory.qp(i-1, :);
        
        q0_circ = sim.q(length(q_bullet_curr)+1:end);
    end
    
    % Evaluated variables    
    [q_prev, ~, ~] = q_qp_p(mechanism, ...
                            q0_circ, ...
                            q_bullet_prev, ...
                            qp_bullet_prev, ...
                            qpp_bullet_prev);
    
    [q_curr, ~, p_curr] = q_qp_p(mechanism, ...
                                 q0_circ, ...
                                 q_bullet_curr, ...
                                 qp_bullet_curr, ...
                                 qpp_bullet_curr);
    
     % Main generalized variables
    sim.q = q_curr;
    sim.p = p_curr;
                     
    % Cp - Euler approximation
    sim.C_prev = coupling_matrixC(mechanism, q_prev);
    sim.C_curr = coupling_matrixC(mechanism, q_curr);
    
    delta_t = sim.curr_t - sim.prev_t;
    sim.Cp = (sim.C_curr - sim.C_prev)/delta_t;
    
    q = [mechanism.eqdyn.q_bullet, mechanism.eqdyn.q_circ];

    for i = 1:3
        A = subs(mechanism.serials{i}.A, q, q_curr);
        sim.serials{i}.A = double(A);
        
        O = subs(mechanism.serials{i}.O, q, q_curr);
        sim.serials{i}.O = double(O);
        
        Bi = subs(mechanism.endeffector.B{i}, q, q_curr);
        sim.endeffector.B{i} = double(Bi);
    end    
end

