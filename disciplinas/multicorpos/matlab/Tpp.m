function ans = Tpp(T, diffs, vars)
    Tp_= T0ip(T, diffs, vars);
    Tpp_ = diff(Tp_, t);
    ans = subs(Tpp_, diffs, vars);
end