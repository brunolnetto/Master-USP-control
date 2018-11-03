function params = load_mechanism_params()
% Units
%   Mass    : [Kg]
%   Inertia : [Kg*m^2]
%   Length  : [m]
%   Angle   : [rad]

    % Arm #1
    params.L01 = 1;
    params.beta1 = 0;

    % 1st link
    params.L11 = 2;
    params.H11 = 2/1000;
    params.W11 = 3/100;
    params.rho11 = 2700;
    params.m11eq = @(L, W, H, rho) L*W*H*rho;
    params.J11cgeq = @(L, W, m) m*(L^2 + W^2)/12;
    
    params.m11 = params.m11eq(params.L11, params.W11, ...
                              params.H11, params.rho11);
    params.J11cg = params.J11cgeq(params.L11, params.W11, params.m11);
    
    % 2nd link
    params.L21 = 3;    
    params.H21 = 2/1000;
    params.W21 = 3/100;
    params.rho21 = 2700;
    
    params.m21eq = @(L, W, H, rho) L*W*H*rho;
    params.J21cgeq = @(L, W, m) m*(L^2 + W^2)/12;
    
    params.m21 = params.m11eq(params.L21, params.W21, ...
                              params.H21, params.rho21);
    params.J21cg = params.J21cgeq(params.L21, params.W21, params.m21);
    
    % Arm #2
    params.L02 = 1;
    params.beta2 = 2*pi/3;
    
    % 1st link
    params.L12 = 2;
    params.H12 = 2/1000;
    params.W12 = 3/100;
    params.rho12 = 2700;
    params.m12eq = @(L, W, H, rho) L*W*H*rho;
    params.J12cgeq = @(L, W, m) m*(L^2 + W^2)/12;
    
    params.m12 = params.m12eq(params.L12, params.W12, ...
                              params.H12, params.rho12);
    params.J12cg = params.J12cgeq(params.L12, params.W12, params.m12);
    
    % 2nd link
    params.L22 = 3;
    params.H22 = 2/1000;
    params.W22 = 3/100;
    params.rho22 = 2700;
    
    params.m12eq = @(L, W, H, rho) L*W*H*rho;
    params.J12cgeq = @(L, W, m) m*(L^2 + W^2)/12;

    params.m12 = params.m12eq(params.L12, params.W22, ...
                              params.H22, params.rho22);
    params.J12cg = params.J12cgeq(params.L12, params.W12, params.m12);
       
    % Arm #3
    params.L03 = 1;
    params.beta3 = 4*pi/3;
    
    % 1st link
    params.L13 = 2;
    params.H13 = 2/1000;
    params.W13 = 3/100;
    params.rho13 = 2700;
    params.m13eq = @(L, W, H, rho) L*W*H*rho;
    params.J13cgeq = @(L, W, m) m*(L^2 + W^2)/12;
    
    params.m13 = params.m13eq(params.L13, params.W13, ...
                              params.H13, params.rho13);
    params.J13cg = params.J13cgeq(params.L12, params.W13, params.m13);
    
    % 2nd link
    params.L23 = 3;
    params.H23 = 2/1000;
    params.W23 = 3/100;
    params.rho23 = 2700;
    
    params.m13eq = @(L, W, H, rho) L*W*H*rho;
    params.J13cgeq = @(L, W, m) m*(L^2 + W^2)/12;

    params.m13 = params.m12eq(params.L13, params.W23, ...
                              params.H23, params.rho23);
    params.J13cg = params.J12cgeq(params.L13, params.W13, params.m13);
       
    % End-Effector 
    params = load_endeffector_params(params);
end