function mechanism = load_num_mechanism()
    mechanism = struct();
    mechanism.serials = [];
    
    % Serial mechanisms
    mechanism.serials = load_num_serials();
    
    % End-effector
    mechanism.endeffector = load_num_endeffector();
    
    % Constraints
    mechanism.constraints = load_constraints(mechanism);
end