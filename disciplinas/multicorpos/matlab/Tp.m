function ans = Tp(T, diffs, vars)
    Tp_ = diff(T, t);
    ans = subs*Tp_(Tp_, diffs, vars);
end