function Gppade = tfpade(G, Ts, n)
    s = tf('s');

    num = [2/Ts];
    den = [1 2/Ts];
    Gzoh = tf(num, den);

    Gppade = Gzoh*G;
    Gppade = minreal(Gppade);
end