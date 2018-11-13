function sys = double_pendulum()
    % Mechanical system
    sys = double_pendulum_mechanics();
    
    % State space form of mechanical system
    sys = state_space(sys);
    
    % Electrical system
    sys = double_pendulum_electrical(sys);
end