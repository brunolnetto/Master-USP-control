function constraints = load_constraints(mechanism)
% Constraints of the 3RRR mechanism
%   - (Bi - Ai).'*(Bi - Ai) == L2i^2
% 	- (Bi - Ai).'*(Ai - Oi) == L2i*L1i*cos(qi(2) - qi(1))

    constraints = {};
    
    for i = 1:3
        mechanism = load_points(mechanism);
        
        Oi = mechanism.serials{i}.O;
        Ai = mechanism.serials{i}.A;
        Bi = mechanism.serials{i}.B;
        
        L1i = getfield(mechanism.serials{i}.params, sprintf('L1%d', i));
        L2i = getfield(mechanism.serials{i}.params, sprintf('L2%d', i));
        qi = mechanism.serials{i}.generalized.q;
        
        % Constraint 1i
        constraints{i} = (Bi - Ai).'*(Bi - Ai) - L2i^2;
        
        % Constraint 2i
        constraints{i+3} = (Bi - Ai).'*(Ai - Oi) - L2i*L1i*cos(qi(2) - qi(1));
    end
end

function p_ = point(T, p)
    point_ = T*[p; 1];
    p_ = simplify(point_(1:3));
end