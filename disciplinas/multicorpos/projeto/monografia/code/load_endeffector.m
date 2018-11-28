function endeffector = load_endeffector(params_type)
    endeffector = struct();
    
    % Generalized variables
    endeffector.generalized = load_generalized_endeffector();
    
    % Parameters
    params_fname = sprintf('load_%s_endeffector_params', params_type);
    endeffector.params = feval(params_fname);
    
    % End-effector
    endeffector.T = transformations_endeffector(endeffector);
end