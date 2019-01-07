function  traj = trajectory()   
%     % [m]
%     R = 0.15;
%     
%     % [rad/s]
%     omega = 1;
%     
%     % End time [s]
%     tf = 2*pi/omega;

    P0 = [0; -0.1];
    P1 = [0; 0.1];
    A_max = 1;
    
    n_versor = (P1-P0)/norm(P1-P0);

    % End time [s]
    tf = 2*sqrt((1/A_max)*pinv(n_versor)*(P1-P0));
    
    % Time vector
    n = 40;
    t = linspace(0, tf, n);
    
    dt = t(2) - t(1);
    
    q = [];
    qp = [];
    qpp = [];
    
    for i = t
        if(i/tf < 0.5)
            t0 = 0;
            a0 = A_max;
            V0 = 0;
            S0 = P0;
        else
            t0 = 0.5*tf;
            a0 = -A_max;
            V0 = A_max*n_versor*0.5*tf;
            S0 = A_max*n_versor*(0.5*tf)^2/2 + P0;
        end
        
        S = a0*n_versor*(i - t0)^2/2 + V0*(i - t0) + S0;
        V = a0*n_versor*(i - t0) + V0;
        A = a0*n_versor;
                
        q = [q; [S; deg2rad(45)].'];
        qp = [qp; [V; 0].'];
        qpp = [qpp; [A; 0].'];
    end
    
%     q = [R*cos(omega*t); R*sin(omega*t); omega*t];
%     qp = [-R*omega*sin(omega*t); R*omega*cos(omega*t); omega*ones(size(t))];
%     qpp = [-R*omega^2*cos(omega*t); -R*omega^2*sin(omega*t); zeros(size(t))];

    traj.dt = dt;
    traj.t = t;
    traj.q = q;
    traj.qp = qp;
    traj.qpp = qpp;
end