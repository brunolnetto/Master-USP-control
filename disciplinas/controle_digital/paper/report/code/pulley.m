function sys = pulley()        
    % Pulley conversion
    syms xp wm Tau F real;
    syms D;
          
    sys.u = [wm; Tau];
    sys.y = [xp; F];
    A = [-D/2, 0; 0, -2/D];
    sys.transform = @(u) A*u;
    sys.transform_1 = @(y) A\y;
    
    sys.states = [];
    
    % System symbolics
    sys.syms = D;
end