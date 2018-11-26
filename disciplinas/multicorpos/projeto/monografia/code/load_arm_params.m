function params = load_arm_params(params, i)
% Units
%   Mass    : [Kg]
%   Inertia : [Kg*m^2]
%   Length  : [m]
%   Angle   : [rad]
    
    meq = @(L, W, H, rho) L*W*H*rho;
    Jcgeq = @(m, a, b) m*(a^2 + b^2)/12;

    L0i_name = sprintf('L0%d', i);
    betai_name = sprintf('beta%d', i);
    
    % 1st link
    L1i_name = sprintf('L1%d', i);
    H1i_name = sprintf('H1%d', i);
    W1i_name = sprintf('W1%d', i);

    rho1i_name = sprintf('rho1%d', i);
    m1i_name = sprintf('m1%d', i);
    J1i_name = sprintf('J1%d', i);

    % 2nd link
    L2i_name = sprintf('L2%d', i);
    H2i_name = sprintf('H2%d', i);
    W2i_name = sprintf('W2%d', i);
    
    rho2i_name = sprintf('rho2%d', i);
    m2i_name = sprintf('m2%d', i);
    J2i_name = sprintf('J2%d', i);    
    
    % Base parameters
    params = setfield(params, L0i_name, 20/100);
    params = setfield(params, betai_name, i*2*pi/3);
    
    % 1st link
    params = setfield(params, rho1i_name, 2700);
    params = setfield(params, L1i_name, 10/100);
    params = setfield(params, H1i_name, 5/1000);
    params = setfield(params, W1i_name, 4/100);
    
    % 1st link Inertial params
    rho1i = getfield(params, rho1i_name);
    L1i = getfield(params, L1i_name);
    W1i = getfield(params, W1i_name);
    H1i = getfield(params, H1i_name);
    m1i = meq(L1i, W1i, H1i, rho1i);
    J1ix = Jcgeq(m1i, W1i, H1i);
    J1iy = Jcgeq(m1i, L1i, H1i);
    J1iz = Jcgeq(m1i, L1i, W1i);
    
    params = setfield(params, m1i_name, m1i);
    params = setfield(params, J1i_name, diag([J1ix, J1iy, J1iz]));
    
    % 2nd link
    params = setfield(params, rho2i_name, 2700);
    params = setfield(params, L2i_name, 20/100);
    params = setfield(params, H2i_name, 5/1000);
    params = setfield(params, W2i_name, 4/100);    
    
    % 1st link Inertial params
    rho2i = getfield(params, rho2i_name);
    L2i = getfield(params, L2i_name);
    W2i = getfield(params, W2i_name);
    H2i = getfield(params, H2i_name);
    m2i = meq(L2i, W2i, H2i, rho2i);
    J2ix = Jcgeq(m2i, W2i, H2i);
    J2iy = Jcgeq(m2i, L2i, H2i);
    J2iz = Jcgeq(m2i, L2i, W2i);
    
    params = setfield(params, m2i_name, m2i);
    params = setfield(params, J2i_name, diag([J2ix, J2iy, J2iz]));
end