function params = load_sym_params()
% Units
%   Mass    : [Kg]
%   Inertia : [Kg*m^2]
%   Length  : [m]
%   Angle   : [rad]

    params = struct();
    
    % 1st, 2nd and 3rd arms
    params.serials = load_sym_arm_params(1);
    params.serials = load_sym_arm_params(2);
    params.serials = load_sym_arm_params(3);
           
    % End-Effector 
    params = load_sym_endeffector_params();
end