function pplace(sys, eigs)
    % MIMO sys
    A = sys.a;
    B = sys.b;
    C = sys.c;
    D = sys.d;
    
    is_imag_idx = imag(eigs) > 0;
    eig_imag = eigs(is_imag);
    
    if(any(sort(conj(a)) == sort(a)))
    	error('One must provide both imaginary and conjugate eigenvalues!')
    end
    
    
    
    R = -P/Vr;
end