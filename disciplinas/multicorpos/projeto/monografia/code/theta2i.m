function th2i = theta2i(Bi, Ai, Oi, L1i, L2i)
% Calculates the angle of elbow respective to first link member
% Input:
%   - Bi [array]: Coordinates of point Bi;
%   - Ai [array]: Coordinates of point Ai;
%   - Oi [array]: Coordinates of point Oi;
% Output:
%   - result [array]: Two possible solutions for theta1i
%   - log [string]: Fail or success

    BiAi = Bi - Oi;
    AiOi = Ai - Oi;
    
    th2i = acos2(dot(BiAi, AiOi)/(L1i*L2i));
end