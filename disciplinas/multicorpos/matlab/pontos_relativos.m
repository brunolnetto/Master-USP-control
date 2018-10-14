function ps = pontos_relativos(mems)
    syms xb1 yb1; 
    syms xb2 yb2; 
    syms xb3 yb3;

    ps(1).A = [mems(1).L1 , 0].';
    ps(1).B = [xb1, yb1].';
    
    ps(2).A = [mems(2).L1 , 0].';
    ps(2).B = [xb2, yb2].';
    
    ps(3).A = [mems(3).L1 , 0].';
    ps(3).B = [xb3, yb3].';
end
