function pas = pontos_absolutos(mems)
    ps = pontos_relativos(mems);
    
    pas(1).A = relative2absolute(ps(1).T, ps(1).A);
    pas(1).B = relative2absolute(ps(4).T, ps(1).B);

    pas(2).A = relative2absolute(ps(2).T, ps(2).A);
    pas(2).B = relative2absolute(Ts(4).T, ps(2).B);
    
    pas(2).A = relative2absolute(ps(2).T, ps(3).A);
    pas(2).B = relative2absolute(ps(4).T, ps(3).B);   
end

function p_abs = relative2absolute(T, p)
    ph  = [p; 1];
    pha = T*ph;
    p_abs = pha(1:2);
end