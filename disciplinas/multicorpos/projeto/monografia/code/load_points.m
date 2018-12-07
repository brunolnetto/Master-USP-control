function mechanism = load_points(mechanism)
    mechanism.endeffector.Be = {};

    for i = 1:3
        serial = mechanism.serials{i};
        endeffector = mechanism.endeffector;
        
        L1 = serial.bodies{1}.params.L1;
        L2 = serial.bodies{2}.params.L2;
        Le = getfield(endeffector.params, sprintf('Le%d', i));
        
        TN0 = serial.base.T;
        TN1 = serial.bodies{1}.T;
        TN2 = serial.bodies{2}.T;
        TNe = endeffector.T{i+1};

        mechanism.serials{i}.O = point(TN0, [0; 0; 0]);
        mechanism.serials{i}.A = point(TN1, [L1; 0; 0]);
        mechanism.endeffector.B{i} = point(TNe, [Le; 0; 0]); 
    end
end