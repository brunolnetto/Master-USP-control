function  traj = trajectory()
    % [s]
    dt = 0.01;
    
    % [m]
    R = 0.1;
    
    % [rad/s]
    omega = 1;
    
    % End time [s]
    tf = 2*pi/omega;
    
    % Time vector
    t = 0:dt:tf;
    
    q = [R*cos(omega*t); R*sin(omega*t); omega*t].';
    qp = [-R*omega*sin(omega*t); R*omega*cos(omega*t); omega*ones(size(t))].';
    qpp = [-R*omega^2*cos(omega*t); R*omega^2*sin(omega*t); zeros(size(t))].';

    traj.t = t;
    traj.q = q;
    traj.qp = qp;
    traj.qpp = qpp;
end