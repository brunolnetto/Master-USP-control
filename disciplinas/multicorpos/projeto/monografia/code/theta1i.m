function [result, log] = theta1i(p, params)
% Calculates the motor angle respective to x axis
% Input:
%   - p [array]: End-effector coordinates;
%   - betai [rad]: Angle respective to the global coordinate frame system
%   (CGS) of the i-th motor;
%   - gammai [rad]: Angle respective to the CGS attached to the
%   end-effector
% Output:
%   - result [array]: Two possible solutions for theta1i
%   - log [string]: Fail or success

   % End-effector coordinates
   d = [p(1); p(2)];
   alpha = p(3);
    
   % Workspace guard
   if(isin_workspace())
       error_msg = 'Point (%.3f, %.3f, %.3f) does not belong to mechanism workspace!';
       log = fprint(error_msg, x, y, alpha);
       
       result = [];
   
   % Workspace guard
   else
       log = 'Success!';
        
       % [Craig, 2005]
       phii1 = atan2(mi, ni) + atan2(sqrt(mi^2 + ni^2 - pi^2), pi);
       phii2 = atan2(mi, ni) - atan2(sqrt(mi^2 + ni^2 - pi^2), pi);
       
       result = [phii1 - betai, phii2 - betai];
   end
end