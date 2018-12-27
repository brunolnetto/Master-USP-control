function P = discrete_lyapunov_equation(A, Q)
    % This function solves A * P * A' - P + Q = 0

    n = length(A);
    M = zeros(n^2);
    for k = 1 : n
        for l = 1 : n
            M((1:n)+n*(k-1),(1:n)+n*(l-1)) = A * A(k,l);
        end
    end
    P = reshape(-(M - eye(n^2)) \ Q(:), n, n);
end