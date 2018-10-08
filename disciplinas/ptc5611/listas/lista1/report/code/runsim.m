function [ans] = runsim(Cs, Ts, simname)
    Cz = c2d(Cs, Ts, 'tustin');

    Cz.Variable  = 'z^-1';
    
    Cnum = Cz.num{:};
    Cden = Cz.den{:}; 
    
    Cnum = Cnum';
    Cden = Cden';
    
    m = length(Cnum);
    n = length(Cden);
    
    % Erro e entradas iniciais
    u0 = zeros(m-1, 1);
    e0 = zeros(n, 1);

    % Tempo de simulacao [s]
    Tf = 10;
    
    stOutput = sim(simname, Tf);
    
    ans = stOutput;