function serial = transformations_serial(serial)
% Transformation matrices of coordinate systems
% Coordinate frame system 1 (CFS1i): Attached to motor i
% Coordinate frame system 2 (CFS2i): Attached to first bar i on motor
% shaft's center 
% Coordinate frame system 3 (CFS3i): Attached to second bar i on elbow
% Coordinate frame system e (CFSei): Attached to end-effector

    di = @(L) [L; 0; 0];

    beta = serial.base.params.beta;
    L0i = serial.base.params.L0;    

    L1i = serial.bodies{1}.params.L1;
    L2i = serial.bodies{2}.params.L2;

    q1i = serial.generalized.q(1);
    q2i = serial.generalized.q(2);
    
    TN0 = T3d(beta, [0; 0; 1], [0; 0 ; 0])*T3d(0, zeros(3, 1), di(L0i));
    serial.base.T = TN0;

    TN1 = TN0*T3d(q1i, [0; 0; 1], di(L1i));
    TN2 = TN1*T3d(q2i - q1i, [0; 0; 1], di(L2i));
    
    serial.bodies{1}.T = TN1;
    serial.bodies{2}.T = TN2;
end
