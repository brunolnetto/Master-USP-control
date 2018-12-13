function plot_qpu(sims)
    n = length(sims);
    
    t = zeros(1, n);
    q = zeros(n, 6);
    p = zeros(n, 6);
    
    % q, p
    for i = 1:n
        for j = 1:6
            q(i,j) = sims{i}.q(j+3);
            p(i,j) = sims{i}.p(j+3);
        end
    end
    
    u = zeros(n, 3);
    
    % Motors
    for i = 1:n
        t(i) = sims{i}.curr_t;
        
        u(i,1) = sims{i}.u(1);
        u(i,2) = sims{i}.u(2);
        u(i,3) = sims{i}.u(3);
    end
    
    e_const = zeros(n, 3);
    e_q = zeros(n, 3);
    
    % Motors
    for i = 1:n
        t(i) = sims{i}.curr_t;
        
        e_const = sims{i}.constraints_error;
        e_q = sims{i}.constraints_error;
    end
    
    figure();
    subplot(3, 1, 1);
    plot(t, u(:,1));
    subplot(3, 1, 2);
    plot(t, u(:,2));
    subplot(3, 1, 3);
    plot(t, u(:,3));
    
    figure();
    subplot(3, 2, 1);
    plot(t, q(:,1));
    subplot(3, 2, 2);
    plot(t, q(:,2));
    subplot(3, 2, 3);
    plot(t, q(:,3));
    subplot(3, 2, 4);
    plot(t, q(:,1));
    subplot(3, 2, 5);
    plot(t, q(:,2));
    subplot(3, 2, 6);
    plot(t, q(:,3));
    
    figure();
    subplot(3, 2, 1);
    plot(t, p(:,1));
    subplot(3, 2, 2);
    plot(t, p(:,2));
    subplot(3, 2, 3);
    plot(t, p(:,3));
    subplot(3, 2, 4);
    plot(t, p(:,1));
    subplot(3, 2, 5);
    plot(t, p(:,2));
    subplot(3, 2, 6);
    plot(t, p(:,3));
    
end