function [is_obsv, is_obsvs, ews] = obsvh(sys)
    % MIMO sys
    A = sys.a;
    C = sys.c;
    
    % Eigenvectors
    ews = eig(A);
    
    % System size
    n = length(A);
    ews = 1;
    is_obsvs = [];
    
    % 
    for i = 1:n
        Mbh = [(ews(i)*eye(n)-A); C];
        is_obsvs = [is_obsvs, rank(Mbh) == n];
    end

    is_obsv = sum(is_obsvs) == n;
end