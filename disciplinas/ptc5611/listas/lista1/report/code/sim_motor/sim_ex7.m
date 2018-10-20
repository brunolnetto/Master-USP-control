function [w, e, d, u, usat, y] = sim_ex7(mdlnome, params, Tf)
    
    sat = params.sat;
    Ts = params.Ts;
    variance = params.variance;
    
    t0_dist = params.t0_vel;
    tf_dist = params.t0_vel;
    t0_vel = params.t0_vel;
    vel_estat = params.vel_estat;
    dist_val = params.dist_val;
    
    b = params.b;
    J = params.J;
    K = params.K;
    R = params.R;
    L = params.L;
    
    open_system(mdlnome);
    save_system;
    set_param(mdlnome, 'SaveOutput', 'on');
    stdOut = sim(mdlnome, 'StopTime', num2str(Tf), ...
                          'SrcWorkspace', 'current', ...
                          'AbsTol', '1e-10', ...
                          'RelTol', '1e-10');
    close_system
    
    w = stdOut.get('w');
    e = stdOut.get('e');
    d = stdOut.get('d');
    u = stdOut.get('u');
    usat = stdOut.get('usat');
    y = stdOut.get('y');