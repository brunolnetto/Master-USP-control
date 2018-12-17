function [nulls, poles, is_cont, is_obsv] = plant_behaviour(sys)   
    % Nullvalues and eigenvalues
    nulls = tzero(sys.a, sys.b, sys.c, sys.d);
    poles = pole(ss(sys.a, sys.b, sys.c, sys.d));
    
    n = length(sys.a); 
    
    Mc = ctrb(sys.a, sys.b);
    Mo = ctrb(sys.a, sys.b);
    
    is_cont = rank(Mc) == n;
    is_obsv = rank(Mo) == n;
end