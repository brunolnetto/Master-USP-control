function sims = calculate_sims(mechanism, trajectory)
    n = length(trajectory.t);
    
    % Begin of simulation
    sim = struct('');
    
    % Offline calculation of simulation parameters
    sims = {};
    for i = 1:n
        sim = update_sim(i, sim, mechanism, trajectory);
        sims{i} = sim;
    end
end