function Gppade = tfpade(G, Ts, n)
    s = tf('s');

    [num, den] = pade(Ts, n);
    Gpade = tf(num, den);

    Gppade = ((1 - Gpade)/(s*Ts))*G;
    Gppade = minreal(Gppade);
end