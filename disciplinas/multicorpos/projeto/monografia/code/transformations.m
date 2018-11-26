function sys = transformations(params)
% Transformation matrices of coordinate systems
% Coordinate frame system 1 (CFS1i): Attached to motor i
% Coordinate frame system 2 (CFS2i): Attached to first bar i on motor
% shaft's center 
% Coordinate frame system 3 (CFS3i): Attached to second bar i on elbow
% Coordinate frame system e (CFSei): Attached to end-effector
    
    sys.arm1 = transformations_arm(1, params);
    sys.arm2 = transformations_arm(2, params);
    sys.arm3 = transformations_arm(3, params);
    
    

end

