function sys = transformations_arm(params)

    Te = T3d(params.x(3), [0; 0; 1], [params.x(1); params.x(2)]; 0);
    Te1 = Te*T3d(params.gamma1, [0; 0; 1], ...
                 [params.x(1); params.x(2)]; 0);;
    
    sys.T = {vpa(simplify(TN0)), vpa(simplify(TN1)), vpa(simplify(TN2))};
end

