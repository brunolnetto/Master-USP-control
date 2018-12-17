function sol = simulate_sys(sys, t, x0)
    df_ = @(t, q) df(t, q, sys);
    sol = ode45(df_, t, x0);
end

function dq = df(t, q, sys)
    dq_sym = vpa(subs(sys.f_subs, sys.syms, sys.model_params));
    q_syms = formula(sys.states);
    dq_ = vpa(subs(dq_sym, q_syms, q));
    dq = double(dq_);
end