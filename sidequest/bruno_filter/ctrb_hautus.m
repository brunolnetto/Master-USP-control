function [eigs, eig_is_ctrb, sys_is_ctrb] = ctrb_hautus(A, B)
    eigs = eig(A);
    
    n = length(A);

    eig_is_ctrb = [];
    for i = 1:n
        eig_is_ctrb = [eig_is_ctrb; rank([eigs(i)*eye(n) - A, B]) == n];
    end

    sys_is_ctrb = all(eig_is_ctrb);
end