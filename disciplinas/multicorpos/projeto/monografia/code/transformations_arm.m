function sys = transformations_arm(i, params)
% Transformation matrices of coordinate systems
% Coordinate frame system 1 (CFS1i): Attached to motor i
% Coordinate frame system 2 (CFS2i): Attached to first bar i on motor
% shaft's center 
% Coordinate frame system 3 (CFS3i): Attached to second bar i on elbow
% Coordinate frame system e (CFSei): Attached to end-effector

    di = @(L) [L; 0; 0];
    
    beta = getfield(params, sprintf('beta%d', i));
    L0i = getfield(params, sprintf('L0%d', i));
    L1i = getfield(params, sprintf('L1%d', i));
    L2i = getfield(params, sprintf('L2%d', i));
    th1i = getfield(params, sprintf('th1%d', i));
    th2i = getfield(params, sprintf('th2%d', i));
    
    TN0 = T3d(beta, [0; 0; 1], [0; 0 ; 0])*...
          T3d(0, [0; 0; 0], [L0i; 0 ; 0]);
    TN1 = TN0*T3d(th1i, [0; 0; 1], [L1i; 0 ; 0]);
    TN2 = TN1*T3d(th2i, [0; 0; 1], [L2i; 0 ; 0]);
    
    TN0 = T3d(beta, [0; 0; 1], [0; 0 ; 0])*...
          T3d(0, [0; 0; 0], [L0i; 0 ; 0]);
    TN1 = TN0*T3d(th1i, [0; 0; 1], [L1i; 0 ; 0]);
    TN2 = TN1*T3d(th2i, [0; 0; 1], [L2i; 0 ; 0]);
    
    sys.T = {vpa(simplify(TN0)), vpa(simplify(TN1)), vpa(simplify(TN2))};
end

