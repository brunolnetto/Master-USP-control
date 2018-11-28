function endeffector = load_sym_endeffector()
% Transformation matrices of coordinate systems
% Coordinate frame system E (CFSE): Reference point on the platform
% Coordinate frame system E1 (CFSE1): On the platform oriented to the 1st
% serial mechanism
% Coordinate frame system E2 (CFSE2): On the platform oriented to the 2st
% serial mechanism
% Coordinate frame system E3 (CFSE3): On the platform oriented to the 3st
% serial mechanism
    endeffector = struct();

    endeffector.generalized = load_generalized_endeffector();
    endeffector.params = load_sym_endeffector_params();
    endeffector.T = transformations_endeffector(endeffector);
end