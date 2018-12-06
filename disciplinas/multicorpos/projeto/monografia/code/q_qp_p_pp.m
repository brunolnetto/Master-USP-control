function [q, qp, p, pp] = q_qp_p_pp(mechanism, q0_circ, q_bullet, qp_bullet, qpp_bullet)   
    % Speed to derivative coordinates conversion
    D_bullet = double(subs(mechanism.eqdyn.D_bullet, ...
                           mechanism.eqdyn.q_bullet, ...
                           q_bullet));
    
    Dp_bullet = double(subs(mechanism.eqdyn.Dp_bullet, ...
                            [mechanism.eqdyn.q_bullet, ...
                            mechanism.eqdyn.qp_bullet], ...
                            [q_bullet, qp_bullet]));

    % Independent speed
    p_bullet = D_bullet*qp_bullet.';
    
    % Indepedent acceleration
    pp_bullet = D_bullet*qpp_bullet.' + Dp_bullet*qp_bullet.';
    pp_bullet = pp_bullet.';

    % Dependent coordinates
    q_circ_ = q_circ(mechanism, q0_circ, q_bullet);
   
    % Dependent speeds
    [A, ~] = coupling_matrixC(mechanism, [q_bullet, q_circ_]);
    p_circ_ = A*p_bullet;
    p_circ_ = p_circ_.';

    % Speed to derivative coordinates conversion
    D_circ = subs(mechanism.eqdyn.D_circ, ...
                  mechanism.eqdyn.q_circ, ...
                  q_circ_);
       
    % Dependent coordinates derivatives
    qp_circ_ = pinv(D_circ)*p_circ_.';
    qp_circ_ = qp_circ_.';

    Dp_circ = subs(mechanism.eqdyn.Dp_circ, ...
                   [mechanism.eqdyn.q_circ, ...
                    mechanism.eqdyn.qp_circ], ...
                   [q_circ_, qp_circ_]);

    % Depedent acceleration
    pp_circ_ = D_circ*qpp_circ.' + Dp_circ*qp_circ.';
    pp_circ_ = pp_circ.';

    % Generalized variables
    q = [q_bullet, q_circ_];
    qp = [qp_bullet, qp_circ_];
    p = [p_bullet, p_circ_];
    pp = [pp_bullet, pp_circ];
end