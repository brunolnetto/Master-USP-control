function is_cont = is_controllable(A, B)
    Co_cont = ctrb(A, B);
    is_cont = length(A) == length(A) - rank(Co_cont);
end