function vec = update(vec, actual)
    vec(1:end-1) = vec(2:end);
    vec(end) = actual;
