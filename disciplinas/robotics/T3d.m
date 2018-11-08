function [T] = T3d(theta, rot_vec, d)
    T = [rot3d(theta, rot_vec), d; zeros(1, 3), 1];
end