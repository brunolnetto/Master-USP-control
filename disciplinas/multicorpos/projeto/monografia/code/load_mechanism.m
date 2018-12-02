function mechanism = load_mechanism(params_type)
    mechanism = struct();
    mechanism.serials = [];

    % Serial mechanisms
    mechanism.serials = load_serials(params_type);

    % End-effector
    mechanism.endeffector = load_endeffector(params_type);

    % Constraints
    mechanism.constraints = load_constraints(mechanism);
end