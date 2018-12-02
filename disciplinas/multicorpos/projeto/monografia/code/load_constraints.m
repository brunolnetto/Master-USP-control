function constraints = load_constraints(mechanism)
% Constraints of the 3RRR mechanism
%   - (Bi - Ai).'*(Bi - Ai) == L2i^2
% 	- (Bi - Ai).'*(Ai - Oi) == L2i*L1i*cos(qi(2) - qi(1))

    constraints = {};
    
    for i = 1:3
        mechanism = load_points(mechanism);
        
        Oi = mechanism.serials{i}.O;
        Ai = mechanism.serials{i}.A;
        Bi = mechanism.endeffector.B{i};
        
        L1i = mechanism.serials{i}.bodies{1}.params.L1;
        L2i = mechanism.serials{i}.bodies{2}.params.L2;
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