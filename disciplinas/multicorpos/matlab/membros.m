function mems = membros()
    syms theta1(t) theta2(t) theta3(t);
    
    syms beta1 beta2 beta3;

    syms L11 L12 L13;
    syms m11 m12 m13;
    syms J11cg J12cg J13cg;

    syms L21 L22 L23;
    syms m21 m22 m23;
    syms J21cg J22cg J23cg;

    syms me Je;
 
    syms x01 y01 x02 y02 x03 y03;
    syms beta1 beta2 beta3;
    
    % Membro 1
    seg11 = segmento(L11, m11, J11cg, [0; 0], theta1);
    seg11.T = T2d([x01; y01], beta1)*seg11.T;
    
    % Atualizar assim que conseguir o angulo de rotacao relativo
    seg21 = segmento(L21, m21, J21cg, [L11; 0], 0);
    
    mems(1) = membro(seg11, seg21);

    % Membro 2
    seg12 = segmento(L12, m12, J12cg, [0; 0], theta2);
    seg12.T = T2d([x01; y01], beta2)*seg12.T;
    
    % Atualizar assim que conseguir o angulo de rotacao relativo
    seg22 = segmento(L22, m22, J22cg, [L12; 0], 0);
    mems(2) = membro(seg12, seg22);
 
    % Membro 3
    seg13 = segmento(L13, m13, J13cg, [0; 0], theta3);
    seg12.T = T2d([x03; y03], beta3)*seg13.T;
    
    % Atualizar assim que conseguir o angulo de rotacao relativo
    seg23 = segmento(L23, m23, J23cg, [L13; 0], 0);
    mems(3) = membro(seg13, seg23);

    % Efetuador
    mems(4) = efetuador(me, Je);
end

function seg = segmento(m, J, L, d, alpha)
    seg.m = m;
    seg.J = J;
    seg.L = L;
    seg.T = T2d(alpha, d);
end

function mem = membro(seg1, seg2)
    mem.seg1 = seg1;
    mem.seg2 = seg2;
end

function eff = efetuador(m, J)
    syms alpha(t) x(t) y(t);

    eff.m = m;
    eff.J = J;
    d = [x; y];
    T2d(d, alpha)
end
