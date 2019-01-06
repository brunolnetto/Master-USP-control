function [q_circ_fun, is_ws_fun] = load_q_circ(mechanism)
    q_bullet = mechanism.eqdyn.q_bullet;
    
    q1is = [];
    q2is = [];
    deltas = [];
    
    for i = 1:3
        L1i = mechanism.serials{i}.bodies{1}.params.L1;
        L2i = mechanism.serials{i}.bodies{2}.params.L2;
        betai = mechanism.serials{1}.base.params.beta;
        
        d = mechanism.eqdyn.q_bullet(1:2);
        
        Pi = [d; 0];
        Bi = mechanism.endeffector.B{i};
        Oi = mechanism.serials{i}.O;
        
        ai = Bi - Oi;

        mi = ai(1);
        ni = ai(2);
        pi = (L2i^2 - norm(ai)^2 - L1i^2)/(2*L1i);
        deltai = mi^2 + ni^2 - pi^2;
        
        gammai = atan2(mi, ni) + atan2(sqrt(deltai), pi);
        q1i = gammai - betai;
        
        R01i = mechanism.serials{i}.bodies{1}.T(1:3, 1:3);
        R01i = subs(R01i, mechanism.serials{i}.generalized.q(1), q1i);
        L1ivec = [L1i; 0; 0];
        
        q2i = q1i + acos((ai.'*R01i*L1ivec - L1i^2)/(L1i*L2i));
        
        q1is = [q1is; q1i];
        q2is = [q2is; q2i];
        deltas = [deltas; deltai];
    end
    
    qs = [q1is; q2is];
    q_circ_fun = @(q) double(subs(qs, q_bullet, q));
    is_ws_fun = @(q) ~any(~(subs(deltas, q_bullet, q) >= 0));
end