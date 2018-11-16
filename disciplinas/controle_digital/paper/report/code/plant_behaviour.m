function sys = plant_behaviour(sys)   
    % Nullvalues and eigenvalues
    sys.nulls = tzero(sys.A, sys.B, sys.C, sys.D);
    sys.poles = pole(ss(sys.A, sys.B, sys.C, sys.D));
end