function is_ctrb_obsv(name, A, B, C)
    n = length(A);
    
    % Controlability assurance
    [eigs, eig_is_ctrb, sys_is_ctrb] = ctrb_hautus(A, B);
        
    for i = 1:n
        if(eig_is_ctrb(i))
            msg = sprintf('%f + %f j is controllable', ...
                          real(eigs(i)), imag(eigs(i)));
        else
            msg = sprintf('%f + %f j is not controllable', ...
                          real(eigs(i)), imag(eigs(i)));
        end

        disp(msg);
    end
    
    if(sys_is_ctrb)
        msg = sprintf('%s is controllable', name);
        disp(msg);
    else     
        msg = sprintf('%s is not controllable', name);
        disp(msg);
    end
    
    % Observability assurance
    [eigs, eig_is_obsv, sys_is_obsv] = obsv_hautus(A, C);

    for i = 1:n
        if(eig_is_obsv(i))
            msg = sprintf('%f + %f j is observable', ...
                          real(eigs(i)), imag(eigs(i)));
        else
            msg = sprintf('%f + %f j is not observable', ...
                          real(eigs(i)), imag(eigs(i)));
        end

        disp(msg);
    end
    
    if(sys_is_obsv)
        msg = sprintf('%s is observable', name);
        disp(msg);
    else
        msg = sprintf('%s is not observable', name);
        disp(msg);
    end
end