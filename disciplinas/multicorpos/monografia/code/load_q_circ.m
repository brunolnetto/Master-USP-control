function [q_circ_fun, is_wp_fun] = load_q_circ(mechanism)
    
    q_circ_fun = [];
    is_wp_fun = [];
    q1i_temp = [];
    q2i_temp = [];
    
    for i = 1:3
        L1i = mechanism.serials{1}.bodies{1}.params.L1;
        L2i = mechanism.serials{1}.bodies{1}.params.L2;
        betai = mechanism.serials{1}.base.params.beta;
        
        xy = mechanism.eqdyn.q_bullet;
        d = [xy; 0];
        
        Pi = [d; 0];
        Bi = mechanism.endeffector.B;
        Oi = mechanism.serials{i}.O;
        
        ai = Bi + Pi - Oi;
        mi = ai(2);
        ni = ai(1);
        pi = (L2i^2 - norm(ai)^2 - L1i^2)/(2*L1i);
        deltai = mi^2 + ni^2 - pi^2;
        
        gammai = atan2(mi, ni) + atan2(sqrt(deltai), pi);
        q1i = gammai - betai;
        q2i = q1i + acos((ai.'* - L1i^2)/(L1i*L2i));
    end
end