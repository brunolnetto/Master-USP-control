function plot_qpu(sims)
    n = length(sims);
    
    t = zeros(1, n);
    q = zeros(n, 6);
    p = zeros(n, 6);
    constraints_error = zeros(n, 1);
    q_error = zeros(n, 1);
    
    % Constraints error
    for i = 1:n
        constraints_error(i) = sims{i}.constraints_error;
    end
    
    % q-error
    for i = 1:n
        q_error(i) = sims{i}.q_error;
    end
    
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
        t(i) = sims{i}.t;
        
        u(i,1) = sims{i}.u(1);
        u(i,2) = sims{i}.u(2);
        u(i,3) = sims{i}.u(3);
    end
    
    e_const = zeros(n, 3);
    e_q = zeros(n, 3);
    
    % Motors
    for i = 1:n
        t(i) = sims{i}.t;
        
        e_const = sims{i}.constraints_error;
        e_q = sims{i}.constraints_error;
    end
    
    figure();
    subplot(3, 1, 1);
    plot(t, u(:,1));
    title('Torque $\tau_1$', 'interpreter', 'latex')
    
    subplot(3, 1, 2);
    plot(t, u(:,2));
    title('Torque $\tau_2$', 'interpreter', 'latex')    
    
    subplot(3, 1, 3);
    plot(t, u(:,3));
    title('Torque $\tau_3$', 'interpreter', 'latex')    
    
    figure();
    subplot(3, 2, 1);
    plot(t, q(:,1));
    title('${}^1 q_1$', 'interpreter', 'latex');
    
    subplot(3, 2, 2);
    plot(t, q(:,2));
    title('${}^1 q_2$', 'interpreter', 'latex');
    
    subplot(3, 2, 3);
    plot(t, q(:,3));
    title('${}^2 q_1$', 'interpreter', 'latex');
    
    subplot(3, 2, 4);
    plot(t, q(:,1));
    title('${}^2 q_2$', 'interpreter', 'latex');
    
    subplot(3, 2, 5);
    plot(t, q(:,2));
    title('${}^3 q_1$', 'interpreter', 'latex');
    
    subplot(3, 2, 6);
    plot(t, q(:,3));
    title('${}^3 q_2$', 'interpreter', 'latex');
    
    figure();
    subplot(3, 2, 1);
    plot(t, p(:,1));
    title('${}^1 p_1$', 'interpreter', 'latex');
    
    subplot(3, 2, 2);
    plot(t, p(:,2));
    title('${}^1 p_2$', 'interpreter', 'latex');
    
    subplot(3, 2, 3);
    plot(t, p(:,3));
    title('${}^2 p_1$', 'interpreter', 'latex');
    
    subplot(3, 2, 4);
    plot(t, p(:,1));
    title('${}^2 p_2$', 'interpreter', 'latex');
    
    subplot(3, 2, 5);
    plot(t, p(:,2));
    title('${}^3 p_1$', 'interpreter', 'latex');
    
    subplot(3, 2, 6);
    plot(t, p(:,3));
    title('${}^3 p_2$', 'interpreter', 'latex');
    
    figure();
    plot(t, constraints_error);
    title('$\varphi(\mathbf{q}) = \epsilon_\varphi$', 'interpreter', 'latex');

    figure();
    plot(t, q_error);
    title('$|\mathbf{q}_{k} - \mathbf{q}_{k-1}| = \epsilon_{\Delta q}$', 'interpreter', 'latex');
end