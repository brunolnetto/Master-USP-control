function sims = calculate_sims(mechanism, trajectory)
    n = length(trajectory.t);
    
    % Begin of simulation
    sim = struct('');
    prev_sim = sim;
    
    f = waitbar(0,'1','Name','Updating simulation data...',...
    'CreateCancelBtn','setappdata(gcbf,''canceling'',1)');
    
    % Offline calculation of simulation parameters
    sims = {};
    for i = 1:n
        sim = update_sim(i, prev_sim, mechanism, trajectory);
        sims{i} = sim;
        
        prev_sim = sim;
        
         % Check for clicked Cancel button
        if getappdata(f,'canceling')
            break
        end
        
        % Update waitbar and message
        waitbar(i/n,f,sprintf('%d/%d', i, n))
    end
    
    delete(f);
end