function W = wheel(label, D, actuated, anticlockwise)
    th = sym(sprintf('th_%s', label), 'real');
    psi = sym(sprintf('psi_%s', label), 'real');
    
    thp = sym(sprintf('thp_%s', label), 'real');
    psip = sym(sprintf('psip_%s', label), 'real');
    
    thpp = sym(sprintf('thpp_%s', label), 'real');
    psipp = sym(sprintf('psipp_%s', label), 'real');
    
    m = sym(sprintf('m_%s', label), 'real');
    
    Ixx = sym(sprintf('Ixx_%s', label), 'real');
    Iyy = sym(sprintf('Iyy_%s', label), 'real');
    Izz = sym(sprintf('Izz_%s', label), 'real');
    
    syms tau_r;

    % -> Rotations
    R_th = rot3d(th_l, [0; 0; 1]);
    R_f_psi = rot3d(psi_l, [0; -1; 0]);

    R_f_0_Wl = R_f_th*R_f_psi;
    R_f_Wl_0 = R_f_0_Wf.';

    % -> Angular and linear velocities
    w_f_0 = omega(R_f_0_Wf, [th_f; psi_f], [thp_f; psip_f]);
    vg_f_0 = [D*psip_f*cos(th_f)/2; D*psip_f*sin(th_f)/2; 0];

    vg_f_Wf = simplify(R_l_Wl_0*vg_l_0);
    w_f_Wf = simplify(R_f_Wf_0*w_f_0);

    % -> Angular and linear accelerations
    ag_l_0 = dvecdt(vg_l_0, [th_l; psi_l; thp_l; psip_l], ...
                            [thp_l; psip_l; thpp_l; psipp_l]);

    wp_l_0 = dvecdt(w_l_0, [th_l; psi_l; thp_l; psip_l], ...
                           [thp_l; psip_l; thpp_l; psipp_l]);

    ag_l_Wl = simplify(R_l_Wl_0*ag_l_0);
    wp_l_Wl = simplify(R_l_Wl_0*wp_l_0);

    % -> Kinematic coupling
    p_l_circ = [vg_l_Wl; w_l_Wl];
    dp_l_circ_dp_l_bullet = jacobian(p_l_circ, [thp_l; psip_l]);

    Tau_l = [0; -tau_l; 0];
    I_l = diag([Ixx_l, Iyy_l, Izz_l]);

    f_l = [-m_l*eye(3)*ag_l_Wl; ...
           Tau_l - I_l*wp_l_Wl + skew(w_l_Wl)*I_l*w_l_Wl];

    Wheel_l.eq = simplify(dp_l_circ_dp_l_bullet.'*f_l); 
    Wheel_l.H = -simplify(jacobian(W_l.eq, [thpp_l; psipp_l]));
    Wheel_l.Z = simplify(jacobian(W_l.eq, tau_l));
    Wheel_l.h = -simplify(W_l.eq + W_l.H*[thpp_l; psipp_l] - W_l.Z*tau_l);

end