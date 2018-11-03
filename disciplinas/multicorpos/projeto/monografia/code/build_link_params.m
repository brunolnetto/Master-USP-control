function params = build_link_params(L0, beta, ...
                                    L1, L1cg, m1, J1, ...
                                    L2, L2cg, m2, J2, ...
                                    Le, gamma)

    % Position of the motor #i
    params.L0 = L0;
    params.beta = beta;    
                                
    % Link #1i
    params.L1 = L1; 
    params.L1cg = L1cg; 
    params.m1 = m1;
    params.J1 = J1;

    % Link #2i
    params.L2 = L2;
    params.L2cg = L2cg;    
    params.m2 = m2;
    params.J2 = J2;
    
    % Joint #ei
    params.Le = Le;
    params.gamma = gamma;
end
    