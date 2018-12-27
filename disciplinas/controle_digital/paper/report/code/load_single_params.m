function [params, params_str] = load_single_params()

    % Mechanical parameters
    % Distances between shafts
    L1 = 0.18;
    
    % Distance to center of mass
    L1_cg = 0.16404822;
    
    % Body masses
    m0 = 0.440;
    m1 = 0.153;
    
    % Viscuous friction
    b0 = 0;
    b1 = 0;
    
    % Inertia
    I1 = 0.00068267;
    
    % Gravity
    g = 9.8;
    
    % Electrical params
    % Source voltage
    Vcc_p = 12;
    
    % Armature voltage
    Ra_p = 12/20;
    
    % Eletromechanical parameters
    Ke_p = 12/(2*pi*437/60);
    Kt_p = 2.157304/20;
    
    % Electrical params
    % Source voltage
    Vcc_b = 12;
    
    % Armature voltage
    Ra_b = 12/20;
    
    % Eletromechanical parameters
    Ke_b = 12/(2*pi*437/60);
    Kt_b = 2.157304/20;
    
    % Pulley's radius
    D = 2*0.0226;
    
    % Relation between trque and force
    eta = -1;
    
    % Model parameters
    params = [g, m0, b0, ...
              m1, I1, b1, L1, L1_cg, ...
              Kt_p, Ke_p, Ra_p, Vcc_p,...
              Kt_b, Ke_b, Ra_b, Vcc_b, D];
              
    % Structure system parameters
    params_str.g = g;
    params_str.m0 = m0;
    params_str.b0 = b0;
    params_str.m1 = m1;
    params_str.I1 = I1;
    params_str.b1 = b1;
    params_str.L1 = L1;
    params_str.L1_cg = L1_cg;
    params_str.Kt = Kt_b; 
    params_str.Ke = Ke_b; 
    params_str.Ra = Ra_b;
    params_str.Vcc = Vcc_b;
    params_str.D = D;
    params_str.nbits = 10; 
    params_str.x_WP = [0, pi, 0, 0].';
    params_str.u_WP = 0;
    params_str.y_WP = [0; pi];
    params_str.q0 = [0, pi];
    params_str.qp0 = [0, 0];
    params_str.tf = 4;
end
