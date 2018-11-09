function params = load_params()
    % Alluminum components
    rho = 2700;

    % Car [m]
    params.L0 = 0.12;  
    params.W0 = 0.09;
    params.H0 = 0.03;
    
    % Bar 1 [m]
    params.L1 = 0.3;  
    params.W1 = 0.04;
    params.H1 = 0.03;
    
    % Bar 2 [m]
    params.L2 = 0.3;
    params.W2 = 0.04;
    params.H2 = 0.03;
    
    % [Kg]
    params.m0 = rho*params.L0*params.W0*params.H0;
    params.m1 = rho*params.L1*params.W1*params.H1;
    params.m2 = rho*params.L2*params.W2*params.H1;
    
    % [m]
    params.L1_cg = params.L1/2;
    params.L2_cg = params.L2/2;
    
    % [Kg m^2]
    params.I1_33 = params.m1*params.L1^2/12;
    params.I2_33 = params.m2*params.L2^2/12;
    
    params.b0 = 0.01;
    params.b1 = 0.01;
    params.b2 = 0.01;
end