function mechanism = load_mechanism(params_type)
    if(nargin == 0)
        params_type = 'sym';
        
    elseif(~strcmp(params_type, 'sym') && ~strcmp(params_type, 'num'))
        error('paramstype must be num or sym!');
    
    else
        mechanism = struct();
        mechanism.serials = [];

        % Serial mechanisms
        mechanism.serials = load_serials(params_type);

        % End-effector
        mechanism.endeffector = load_endeffector();

        % Constraints
        mechanism.constraints = load_constraints(mechanism);
    end
end