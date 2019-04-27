function [eigs, eig_is_obsv, sys_is_obsv] = obsv_hautus(A, C)
     eigs = eig(A);
     
     n = length(A);

     eig_is_obsv = [];
     for i = 1:n
         eig_is_obsv = [eig_is_obsv; rank([eigs(i)*eye(n) - A; C]) == n];
     end

     sys_is_obsv = all(eig_is_obsv);
     
     
end