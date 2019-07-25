function turtlebot = load_turtlebot()
    % Required struct
    turtlebot = load_turtlebot_struct();
    
    % Kinematics
    turtlebot = kinematic_model(turtlebot);
    
    % Robot constraints
    turtlebot = load_turtlebot_constraints(turtlebot);
    
    % Dynamics
    turtlebot = dynamic_model(turtlebot);
end