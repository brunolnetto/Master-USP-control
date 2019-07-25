function turtlebot = load_turtlebot_control(turtlebot)
    v = sym('v_%d', size(turtlebot.u));

    Z = turtlebot.dyn.Z;
    H = turtlebot.dyn.H;
    h = turtlebot.dyn.h;
    turtlebot.dyn.u = inv(Z)*(H*v + h);
end