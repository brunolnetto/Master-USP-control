function a = acceleration(Tpp, d)
    a_ = Tpp*[d; 1];
    a = formula(a_);
    a = simplify(a);
    a = v(1:2);
end