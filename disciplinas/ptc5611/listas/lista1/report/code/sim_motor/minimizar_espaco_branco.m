function minimizar_espaco_branco(eixos)
    outerpos = eixos.OuterPosition;
    ti = eixos.TightInset; 
    esquerda = outerpos(1) + ti(1);
    baixo = outerpos(2) + ti(2);
    largura_eixos = outerpos(3) - ti(1) - ti(3);
    altura_eixos = outerpos(4) - ti(2) - ti(4);
    eixos.Position = [esquerda baixo largura_eixos altura_eixos];
end