% Constraints of the problem
% Condition 1: Distance between elbow joint i and end-effector joint i is, 
% by definition, L2i
% Condition 2: Angle between vector BiAi and AiOi is, by definition, th2i

% Vectors for th1i solution
t1t2psym = sym('p', [1, 9], 'real');
posrel = [th11(t), th12(t), th13(t), ...
          th21(t), th22(t), th23(t), ...
          x(t), y(t), alpha(t),];

% Difference between points for th1 solution
diff_A1B1 = A1 - B1p;
diff_A2B2 = A2 - B2p;
diff_A3B3 = A3 - B3p;

% TAKE NOTE: subs does not consider a varfun for differentiation.
diff_A1B1 = subs(diff_A1B1, posrel, t1t2psym);      
diff_A2B2 = subs(diff_A2B2, posrel, t1t2psym);
diff_A3B3 = subs(diff_A3B3, posrel, t1t2psym);

% Arm #1
A1O1 = A1 - O1;
B1A1 = B1m - A1;

% Arm #2
A2O2 = A2 - O2;
B2A2 = B2m - A2;

% Arm #3
A3O3 = A3 - O3;
B3A3 = B3m - A3;

B1A1_ = subs(B1A1, posrel, t1t2psym);
A1O1_ = subs(A1O1, posrel, t1t2psym);

B2A2_ = subs(B2A2, posrel, t1t2psym);
A2O2_ = subs(A2O2, posrel, t1t2psym);

B3A3_ = subs(B3A3, posrel, t1t2psym);
A3O3_ = subs(A3O3, posrel, t1t2psym);

% Connection between point Ai and Bi
eqn_con1 = [L21^2 - diff_A1B1.'*diff_A1B1; ...
            L22^2 - diff_A2B2.'*diff_A2B2; ...
            L23^2 - diff_A3B3.'*diff_A3B3];

% Angle between vector BiAi and AiOi
eqn_con2 = [dot(B1A1_, A1O1_) - L11*L21*cos(th21); ...
            dot(B2A2_, A2O2_) - L12*L22*cos(th22); ...
            dot(B3A3_, A3O3_) - L13*L23*cos(th23)];

const = [eqn_con1; eqn_con2];
const = subs(const, t1t2psym, posrel);
eqn_con1 = subs(eqn_con1, t1t2psym, posrel);
eqn_con2 = subs(eqn_con2, t1t2psym, posrel);
