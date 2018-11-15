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
    b0 = 0;
    b1 = 0;
    b2 = 0;
    
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
    R = 0.0226;

    params = [L1, L2, L1_cg, L2_cg, 
	      m0, m1, m2, b0, b1, b2, I1_33, I2_33, 
	      Vcc, Ra, Ke, Kt, R];
end
