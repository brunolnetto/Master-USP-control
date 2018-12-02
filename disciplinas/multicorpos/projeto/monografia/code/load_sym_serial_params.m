function serial = load_sym_serial_params(i)
% Units
%   Mass    : [Kg]
%   Inertia : [Kg*m^2]
%   Length  : [m]
%   Angle   : [rad]
    % Base parameters
    base.params.L0 = sym(sprintf('L0%d', i), 'real');
    base.params.beta = sym(sprintf('beta%d', i), 'real');
       
    % 1st link
    body1.params.L1 = sym(sprintf('L1%d', i), 'real');
    body1.params.L1g = sym(sprintf('L1%dg', i), 'real');
    body1.params.cg = [body1.params.L1g; 0; 0];
       
    body1.params.m1 = sym(sprintf('m1%d', i), 'real');
    body1.params.J1 = sym(sprintf('J1%d', i), [3, 3], 'real');
    
    % 2nd link
    body2.params.L2 = sym(sprintf('L2%d', i), 'real');
    body2.params.L2g = sym(sprintf('L2%dg', i), 'real');
    body2.params.cg = [body2.params.L2g; 0; 0];

    body2.params.m2 = sym(sprintf('m2%dm', i), 'real');
    body2.params.J2 = sym(sprintf('J2_%dm', i), [3, 3], 'real');
    
    serial.base = base;
    serial.bodies = {body1, body2};
end