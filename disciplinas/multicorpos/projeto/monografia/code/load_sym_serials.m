function serials = load_sym_serials()
    serials = {};
    
    for i = 1:3
        % Generalized variables
        serial_i.generalized = load_generalized_serial(i);
        
        % Serial parameters
        serial_i.params = load_sym_serial_params(i);
        
        % Transformations
        serial_i.T = transformations_serial(i, serial_i);
        
        serials{end+1} = serial_i;
    end
end