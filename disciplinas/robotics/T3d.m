function [T] = T3d(theta, rot_vec, d)
    T = [rot3d(theta, rot_vec), d; zeros(1, 2), 1];
end