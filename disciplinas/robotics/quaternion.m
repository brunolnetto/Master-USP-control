function q = quaternion(angle, vec)
    q = [cos(angle/2), cos(angle/2)*vec].';
end