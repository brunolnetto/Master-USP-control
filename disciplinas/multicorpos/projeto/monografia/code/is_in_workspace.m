function is_in_workspace(p, params)
% Evaluate if the given point is in the workspace
% Input:
%   p []:

%   params:
%       - L0 
% Output:
%   - 

    d = [p(1); p(2)];
    alpha = p(3);
    
    d0i = [params.L0; 0];
    dei = [params.Le; 0];
    betai = params.beta;
    L1i = params.L1;
    L2i = params.L2;
    
    % Auxiliary variables
    ai = d - rot2d(betai)*d0i + rot2d(alpha + gammai)*dei;
    
   % Auxiliary variables for theta calculation
   pi = ai.'*ai + L1i^2 - L2i^2;
   mi = 2*L1i*ai(1);
   ni = 2*L1i*ai(2);
    
    mi^2 + ni^2 < pi^2;
end