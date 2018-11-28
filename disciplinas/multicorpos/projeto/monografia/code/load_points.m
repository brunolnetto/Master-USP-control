function mechanism = load_points(mechanism)
    mechanism.endeffector.Be = {};

    for i = 1:3
        serials = mechanism.serials;
        endeffector = mechanism.endeffector;
        
        L1i = getfield(serials{i}.params, sprintf('L1%d', i));
        L2i = getfield(serials{i}.params, sprintf('L2%d', i));
        Lei = getfield(endeffector.params, sprintf('Le%d', i));

        TN0i = serials{i}.T{1};
        TN1i = serials{i}.T{2};
        TN2i = serials{i}.T{2};
        TNei = endeffector.T{i+1};

        mechanism.serials{i}.O = point(TN0i, [0; 0; 0]);
        mechanism.serials{i}.A = point(TN1i, [L1i; 0; 0]);
        mechanism.serials{i}.B = point(TN2i, [L2i; 0; 0]); 
        mechanism.endeffector.Be{i} = point(TNei, [Lei; 0; 0]); 
    end
end