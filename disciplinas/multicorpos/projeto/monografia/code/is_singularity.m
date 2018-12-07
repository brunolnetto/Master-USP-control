function is_sing = is_singularity(mechanism, q)
    [A, C] = coupling_matrixC(mechanism, q);
    P = [C.'; A];
    m = rank(P);
    
    n = length(q);
    is_sing = m < n;
end