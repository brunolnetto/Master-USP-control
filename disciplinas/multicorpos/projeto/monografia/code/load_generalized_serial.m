function generalized = load_generalized_serial(i)
    generalized = struct();

    % Generalized coordinates
    th1_name = sprintf('th1%d', i);
    th2_name = sprintf('th2%d', i);
    
    q1i = sym(th1_name, 'real');
    q2i = q1i + sym(th2_name, 'real');
    
    % Generalized velocities
    th1p_name = sprintf('th1%dp', i);
    th2p_name = sprintf('th2%dp', i);
    
    p1i = sym(th1p_name, 'real');
    p2i = sym(th1p_name, 'real') + sym(th2p_name , 'real');

    % Generalized accelerations
    th1pp_name = sprintf('th1%dpp', i);
    th1pp_name = sprintf('th2%dpp', i);
    
    pp1i = sym(th1pp_name, 'real');
    pp2i = sym(th1pp_name , 'real') + sym(th2p_name , 'real');
    
    % Generalized variables
    generalized = setfield(generalized, 'q', [q1i, q2i]);
    generalized = setfield(generalized, 'p', [p1i, p2i]);
    generalized = setfield(generalized, 'pp', [pp1i, pp1i]);
end