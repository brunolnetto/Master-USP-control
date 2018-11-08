function v = velocity(Tp, d)
    v_ = Tp*[d; 1];
    v = formula(v_);
    v = simplify(v);
    v = v(1:2);
end