function serials = load_serials(params_type)
    serials = {};
    
    for i = 1:3
        % Generalized variables
        serial_i.generalized = load_generalized_serial(i);
        
        % Serial parameters
        params_fname = sprintf('load_%s_serial_params', params_type);
        serial_i.params = feval(fcn_name, i);
        
        % Transformations
        serial_i.T = transformations_serial(i, serial_i);

        serials{end+1} = serial_i;
    end
end