function R = rot_quaternion(q)

    % Norm of q
    s = norm(q);
    
    % q = qr + qx*i + qy*j + qz*k
    qr = q(1);
    qx = q(2);
    qy = q(3);
    qz = q(4);
    
    % Rotation matrix
    R = [1 - 2*s*(qy^.2 + qz.^2),     2*s*(qx*qy - qz*qr),     2*s*(qx*qz + qy*qr); ...
             2*s*(qx*qy + qz*qr), 1 - 2*s*(qx^.2 + qz.^2),     2*s*(qx*qz + qy*qr);  ...
             2*s*(qx*qz + qy*qr),     2*s*(qy*qz + qx*qr), 1 - 2*s*(qx^.2 + qy.^2)];
         
end