% @Author: Bruno Peixoto
% @Date: 24/10/2018

mechanism = load_mechanism('sym');

% Required measures for kinematics
run('points');
run('velocities');
run('accelerations');

% Closed chain constraints
run('constraints');
