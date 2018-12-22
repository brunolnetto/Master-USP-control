function [params, params_str] = load_mechanism_params()
    [params, params_str] = load_params();
    
    % Model parameters
    params = params(1:13);
end
