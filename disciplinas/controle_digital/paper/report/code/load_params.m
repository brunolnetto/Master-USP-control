function params = load_params()

    % Mechanical parameters
    % Distances between shafts
    L1 = 0.18;
    L2 = 0.215;
    
    % Distance to center of mass
    L1_cg = 0.16404822;
    L2_cg = 0.215/2;
    
    % Body masses
    m0 = 0.440;
    m1 = 0.153;
    m2 = 0.071;
    
    % Viscuous friction
    b0 = 0.01;
    b1 = 0.01;
    b2 = 0.01;
    b_m = 0.01;
    
    % Inertia
    I1_33 = 0.00068267;
    I2_33 = m2*L2^2/12;
    
    % Gravity
    g = 9.8;
    
    % Electrical params
    % Source voltage
    Vcc = 12;
    
    % Armature voltage
    Ra = 12/20;
    
    % Eletromechanical parameters
    Ke = 12/(2*pi*437/60);
    Kt = 2.157304/20;
    
    % Pulley's radius
    D = 2*0.0226;
    
    % Relation between trque and force
    eta = -1;
    
    % Model parameters
    params = [g, m0, b0, ...
              m1, I1_33, b1, L1, L1_cg, ...
              m2, I2_33, b2, L2, L2_cg, ...
              Kt, Ke, Ra, Vcc, D];
end
