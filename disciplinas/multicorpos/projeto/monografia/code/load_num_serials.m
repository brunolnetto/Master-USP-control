function serials = load_num_serials(i)
    serials = {};
    
    serial_i = load_num_serial_params(i);                           
    serials{end+1} = serial_i;
end