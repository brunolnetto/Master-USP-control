function  traj = trajectory()
    % [s]
    dt = 0.1;
    
    % [m]
    R = 0.2;
    
    % [rad/s]
    omega = 10;
    
    % End time [s]
    tf = 2*pi/omega;
    
    % Time vector
    n = 20;
    t = linspace(0, tf, n);
    
    q = [R*cos(omega*t); R*sin(omega*t); omega*t].';
    qp = [-R*omega*sin(omega*t); R*omega*cos(omega*t); omega*ones(size(t))].';
    qpp = [-R*omega^2*cos(omega*t); -R*omega^2*sin(omega*t); zeros(size(t))].';
    
    traj.dt = dt;
    traj.t = t;
    traj.q = q;
    traj.qp = qp;
    traj.qpp = qpp;
end