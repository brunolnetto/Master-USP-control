function mechanism = load_sym_mechanism()
    mechanism = struct();
    mechanism.serials = [];
    
    % Serial mechanisms
    mechanism.serials = load_sym_serials();
    
    % End-effector
    mechanism.endeffector = load_sym_endeffector();
    
    % Constraints
    mechanism.constraints = load_constraints(mechanism);
end