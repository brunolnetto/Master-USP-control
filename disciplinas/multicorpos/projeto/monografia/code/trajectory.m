function  traj = trajectory()   
    % [m]
    R = 0.15;
    
    % [rad/s]
    omega = 10;
    
    % End time [s]
    tf = 5;
    
    % Time vector
    n = 70;
    t = linspace(0, tf, n);
    
    dt = t(2) - t(1);
    
    q = [R*cos(omega*t); R*sin(omega*t); omega*t].';
    qp = [-R*omega*sin(omega*t); R*omega*cos(omega*t); omega*ones(size(t))].';
    qpp = [-R*omega^2*cos(omega*t); -R*omega^2*sin(omega*t); zeros(size(t))].';
    
    traj.dt = dt;
    traj.t = t;
    traj.q = q;
    traj.qp = qp;
    traj.qpp = qpp;
end