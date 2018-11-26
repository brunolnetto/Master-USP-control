function params = load_params()
% Units
%   Mass    : [Kg]
%   Inertia : [Kg*m^2]
%   Length  : [m]
%   Angle   : [rad]
    
    params = struct();
    
    % 1st, 2nd and 3rd arms
    params = load_arm_params(params, 1);
    params = load_arm_params(params, 2);
    params = load_arm_params(params, 3);
           
    % End-Effector 
    params = load_endeffector_params(params);
end