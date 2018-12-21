function linsys =  lin_pendulum(sys, WP)
    linvars = [sys.states; sys.u];
    
    % Auxiliarry subs variables
    n = length(linvars);
    u = sym('u', [n, 1]);
    u_x = u(1:n-1);
    u_u = u(end);
    
    % System behaviour's function
    f_u = subs(sys.f, linvars, u);
    
    % Sensor behaviour's function
    g_u = subs(sys.g, linvars, u);
    
    % Matrices A, B, C and D for each working-point
    syms x_0 th1_0 th2_0 xp_0 th1p_0 th2p_0 PWM_0;
    linsys.linvars = [x_0; th1_0; th2_0; ...
                         xp_0; th1p_0; th2p_0; PWM_0];
    
    linsys.A0 = subs(jacobian(f_u, u_x), u, linvars);
    linsys.B0 = subs(jacobian(f_u, u_u), u, linvars);
    linsys.C0 = subs(jacobian(g_u, u_x), u, linvars);
    linsys.D0 = subs(jacobian(g_u, u_u), u, linvars);
    
    % Matrices on the provided working-point
    A = subs(linsys.A0, linvars, WP);
    B = subs(linsys.B0, linvars, WP);
    C = subs(linsys.C0, linvars, WP);
    D = subs(linsys.D0, linvars, WP);
         
    linsys.A = simplify(A);
    linsys.B = simplify(B);
    linsys.C = simplify(C);
    linsys.D = simplify(D);
        
    linsys.A = double(subs(linsys.A, sys.syms, sys.model_params));
    linsys.B = double(subs(linsys.B, sys.syms, sys.model_params));
    linsys.C = double(subs(linsys.C, sys.syms, sys.model_params));
    linsys.D = double(subs(linsys.D, sys.syms, sys.model_params));
    
    % State space representation
    sys_cont.ss = ss(linsys.A, linsys.B, linsys.C, linsys.D);
    
    % Poles, nulls, controlability and observability
    [sys_cont.nulls, ...
     sys_cont.poles, ...
     sys_cont.is_cont, ...
     sys_cont.is_obsv] = plant_behaviour(sys_cont.ss);
    
    % Sample time
    Ts = 1/100;
    
    % Discretized system
    sys1_disc.ts = Ts;
    sys1_disc.ss = c2d(sys_cont.ss, Ts, 'zoh');
    
    [sys1_disc.nulls, ...
     sys1_disc.poles, ...
     sys1_disc.is_cont, ...
     sys1_disc.is_obsv] = plant_behaviour(sys1_disc.ss);
    
    % Augmented state space representation - with input-delay
    sys2_disc.ts = Ts;

    ndelay = 1;
    sys2_disc.ss = inputdelay_dss(sys1_disc.ss, ndelay);
    
    % Poles, nulls, controlability and observability
    [sys2_disc.nulls, ...
     sys2_disc.poles, ...
     sys2_disc.is_cont, ...
     sys2_disc.is_obsv] = plant_behaviour(sys2_disc.ss);
 
    linsys.continuous.systems = {sys_cont};
    linsys.discrete.systems = {sys1_disc, sys2_disc};
end