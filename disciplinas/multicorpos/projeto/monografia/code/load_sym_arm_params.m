function params = load_sym_arm_params(i)
% Units
%   Mass    : [Kg]
%   Inertia : [Kg*m^2]
%   Length  : [m]
%   Angle   : [rad]
    params = struct();

    L0i_name = sprintf('L0%d', i);
    betai_name = sprintf('beta%d', i);
    gammai_name = sprintf('gamma%d', i);
    
    % 1st link
    L1i_name = sprintf('L1%d', i);

    m1i_name = sprintf('m1%d', i);
    J1i_name = sprintf('J1%d', i);
    J1ix_name = sprintf('J1%dx', i);
    J1iy_name = sprintf('J1%dy', i);
    J1iz_name = sprintf('J1%dz', i);

    % 2nd link
    L2i_name = sprintf('L2%d', i);
    
    m2i_name = sprintf('m2%d', i);
    J2i_name = sprintf('J2%d', i);
    J2ix_name = sprintf('J2%dx', i);
    J2iy_name = sprintf('J2%dy', i);
    J2iz_name = sprintf('J2%dz', i);
    
    % Base parameters
    params = setfield(params, L0i_name, sym(L0i_name));
    params = setfield(params, betai_name, sym(betai_name));
    
    % End-effector parameters
    params = setfield(params, gammai_name, sym(gammai_name));
    
    % 1st link
    params = setfield(params, L1i_name, sym(L1i_name));
    
    % 1st link Inertial params
    J1ix = sym(J1ix_name);
    J1iy = sym(J1iy_name);
    J1iz = sym(J1iz_name);
    
    params = setfield(params, m1i_name, sym(m1i_name));
    params = setfield(params, J1i_name, diag([J1ix, J1iy, J1iz]));
    
    % 2nd link
    params = setfield(params, L2i_name, sym(L2i_name));
    
    % 2nd link Inertial params
    J2ix = sym(J2ix_name);
    J2iy = sym(J2iy_name);
    J2iz = sym(J2iz_name);
    
    params = setfield(params, m2i_name, sym(m2i_name));
    params = setfield(params, J2i_name, diag([J2ix, J2iy, J2iz]));
    
    
end