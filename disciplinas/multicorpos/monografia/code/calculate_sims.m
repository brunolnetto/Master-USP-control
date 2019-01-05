function sims = calculate_sims(mechanism, trajectory)
    n = length(trajectory.t);
    
    % Begin of simulation
    sim = struct('');
    prev_sim = sim;
    
    % Offline calculation of simulation parameters
    sims = {};
    for i = 1:n
        sim = update_sim(i, prev_sim, mechanism, trajectory);
        sims{i} = sim;
    
        prev_sim = sim;
    end
end