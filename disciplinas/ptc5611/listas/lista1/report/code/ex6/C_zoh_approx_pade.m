function C = C_zoh_approx_pade(G, polo_proj, Ts)
    syms K p x;
    assume(K, 'real');
    assume(p, 'real');
    
    c = G.den{1}(2);
    s = tf('s');
    
    % Planta com aproximacao de pade
    Gproj = tfpade(G, Ts, 1);
       
    Gnum = Gproj.num{1};
    Gden = Gproj.den{1};    
    
    % Projeto de controlador com zero-hold
    G_num = poly2sym(Gnum)*(x + c);
    G_den = poly2sym(Gden)*(x + p);

    eq_projpol = subs(G_den, x, polo_proj) + K*subs(G_num, x, polo_proj);
    realproj = real(eq_projpol);
    imagproj = imag(eq_projpol);

    [K, p] = solve(realproj == 0, imagproj == 0, K, p);
    K = double(K);
    p = double(p);

    C = K*tf([1 c], [1 p]);  
end