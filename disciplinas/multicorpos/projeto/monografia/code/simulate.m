function simulate(sims, mechanism)
    % Draw mechanism movement
    for i = 1:n
         draw_mechanism(mechanism, sims{i});
         pause(trajectory.dt);
    end

end