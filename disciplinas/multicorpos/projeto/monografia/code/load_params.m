function params = load_params()
% Units
%   Mass    : [Kg]
%   Inertia : [Kg*m^2]
%   Length  : [m]
%   Angle   : [rad]
    
    params = struct();
    
    % 1st, 2nd and 3rd arms
    params = load_arm_params(1, params);
    params = load_arm_params(2, params);
    params = load_arm_params(3, params);
           
    % End-Effector 
    params = load_endeffector_params(params);
end