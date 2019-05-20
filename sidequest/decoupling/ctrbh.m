function [is_ctrb, is_ctrbs, ews] = ctrbh(sys)
    % MIMO sys
    A = sys.a;
    B = sys.b;
    
    % Eigenvectors
    ews = eig(A);
    
    % System size
    n = length(A);
    ews = 1;
    is_ctrbs = [];
    
    % Controllability 
    for i = 1:n
        Mch = [(ews(i)*eye(n)-A), B];
        is_ctrbs = [is_ctrbs, rank(Mch) == n];
    end

    is_ctrb = sum(is_ctrbs) == n;
end