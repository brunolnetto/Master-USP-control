function exprnova = subs2a2pontos(expr, antigo, novo)
    if length(antigo) ~= length(novo)
        error('Comprimentos de antigo e novo DEVEM ser iguais!');
    end
    
    temp = expr;
    
    for i = 1:length(antigo)
        temp = subs(temp, antigo(i), novo(i));
    end
    exprnova = temp;
end