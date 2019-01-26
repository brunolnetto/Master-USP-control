function [params, params_str] = load_single_mechanism_params()
    [params, params_str] = load_params();
    
    % Model parameters
    params = params(1:8);
end