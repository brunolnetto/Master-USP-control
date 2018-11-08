function L = lagrangian(sys)
    K = 0;
    U = 0;

    for body = sys.bodies
        body = body{1};
        body.K = kinetic_energy(body);
        body.U = potential_energy(body, sys.gravity);
        body.F = rayleigh_energy(body);
        
        K = K + body.K;
        U = U + body.U;

    end
       
    L = simplify(K - U);
end
