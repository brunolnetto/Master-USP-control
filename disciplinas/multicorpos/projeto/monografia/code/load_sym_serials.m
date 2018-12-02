function serials = load_sym_serials()
    serials = {};
    
    for i = 1:3
        % Serial parameters
        serial_i = load_sym_serial_params(i);
        
        % Generalized variables
        serial_i.generalized = load_generalized_serial(i);
               
        % Transformations
        serial_i.T = transformations_serial(serial_i);
        
        serials{end+1} = serial_i;
    end
end