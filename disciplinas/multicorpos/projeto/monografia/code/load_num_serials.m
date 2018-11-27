function serials = load_num_serials()
    serials = {};
    
    for i = 1:3
        % Generalized variables
        gen_serial_i = structcat(struct(), load_generalized_serial(i));
        
        % Serial parameters
        serial_i = structcat(gen_serial_i, load_num_serial_params(i));
        
        serials{end+1} = serial_i;
    end
end