function sys = transformations_end_effector(params)
    x = params.x(1);
    y = params.x(2);
    alpha = params.x(3);
    gamma = ;

    Te = T3d(alpha, [0; 0; 1], [x; y; 0]; 0);
    Te1 = Te*T3d(params.gamma1, [0; 0; 1], ...
                 [params.x(1); params.x(2)]; 0);
    
    sys.T = {vpa(simplify(TN0)), vpa(simplify(TN1)), vpa(simplify(TN2))};
end

