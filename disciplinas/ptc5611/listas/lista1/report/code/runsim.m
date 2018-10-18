function [] = runsim(Cs, Ts, simmodel_fname)
    global u_ant; global e_ant;
    
    assignin('base', 'Ts', Ts)
    
    Cz = c2d(Cs, Ts, 'tustin');
    Cz.variable  = 'z^-1';

    [m, n] = size(Cz);

    u_ant = zeros(m, 1);
    e_ant = zeros(n, 1);

    Cnum = Cz.num{:};
    Cden = Cz.den{:}; 
    
    assignin('base', 'Cnum', Cnum);
    assignin('base', 'Cden', Cden);
    
    sim(simmodel_fname);
