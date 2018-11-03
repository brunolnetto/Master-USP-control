function mechanism = build_3RRR_mechanism(params)
% Build a 3R'RR mechanism
% Access the mechanism topology here: https://bit.ly/2znkaf0

    % Arm #1
    params1 = build_link_params(params.L01, params.beta1, ...
                                params.L11, params.L21, ...
                                params.L11cg, params.L21cg, ...
                                params.Le1, params.gamma1);

    mechanism.arms(1) = build_arm(params1);
    
    % Arm #2
    params2 = build_link_params(params.L02, params.beta1, ...
                                params.L12, params.L21, ...
                                params.L12cg, params.L21cg, ...
                                params.gamma2, params.gamma2);
    
    mechanism.arms(2) = build_arm(params2);

    % Arm #3
    params3 = build_link_params(params.L03, params.beta3, ...
                                params.L13, params.L23, ...
                                params.L13cg, params.L23cg);
    
    mechanism.arms(3) = build_arm(params3);

    % End-effector
    Te = @(x, y, alpha) T2d(alpha, [x; y]);
    mechanism.end_effector = build_end_effector(Te, params.Lecg, ...
                                                params.gammae_cg);
end

function arm = build_arm(params)
% Generate struct of i-th arm params
% Input:
%   params [struct]:
%       - L0 [m]: Length
%       - beta [m]: Angle respective to global CGS
%       - L1 [m]: Length of first link
%       - L1cg [m]: Position of first link baricenter
%       - L2 [m]: Length of second link
%       - L2cg [m]: Position of second link baricenter
% Output:
%   arm [struct]:
%       - Le [m]: Distance between reference point and joint in
%       end-effector
%       - gamma [rad]: Angle between x CGS and joint in end-effector
%       - link1 [struct]: Parameters of first link
%       - link2 [struct]: Parameters of second link

    T0i = @(angle,  L) T2d(0, rot2d(angle)*di(L));
    T1i = @(theta1) T2d(theta, [0; 0])*T0i(params.beta, params.L0);
    T2i = @(theta1, theta2) T2d(theta2, [0; 0])*T2d(0, [params.L1; 0])*T1i(theta1);
    
    arm.Le = params.Le;
    arm.gamma = params.gamma;
    arm.link1 = build_link(T1i, params.L1, params.L1cg);   
    arm.link2 = build_link(T2i, params.L2, params.L2cg);
end

function link = build_link(T, L, Lcg)
% Generate the struct of the i-th link
% Input:
%    L [m]: Length of the link 
%    Lcg [m]: Position of link's baricenter
% Output:
%   link [struct]

    link.T = T;
    link.L = L;
    link.Lcg = Lcg;
end

function end_effector = build_end_effector(T, Lecg, gammae_cg)
% Generate the struct of the end-effector
% Input:
%    Lecg [m]: Radius of baricenter relative to reference point on
%    end-effector
%    gammae_cg [m]: Angle of baricenter  relative to reference point on
%    end-effector
% Output:
%   link [struct]:

    end_effector.T = T;
    end_effector.Lcg = Lecg;
    end_effector.gamma_cg = gammae_cg;
end