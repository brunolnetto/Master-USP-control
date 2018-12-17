function validate_model(sys, t, x0, u0, plot_fun)
    sys.f_subs = subs(sys.f, sys.u, u0);

    t0 = tic;
    sol = simulate_sys(sys, t, x0);
    toc(t0);
    
    plot_fun(sol);
end