function draw_mechanism(mechanism, sim)
    clf;
    axis equal;
    
    axis([-0.4, 0.6, -0.6, 0.6]);
    
    % End-effector
    viscircles(double([sim.q(1), sim.q(2)]), ...
               mechanism.endeffector.params.Le1); 
    
    hold on;
    
    markers = ['o', 'x', '*'];
    colors = ['m', 'k', 'b'];
    
    for i = 1:3
       Oi = sim.serials{i}.O;
       Ai = sim.serials{i}.A;
       Bi = sim.endeffector.B{i};
       
       xOi = Oi(1);
       yOi = Oi(2);
       
       xAi = Ai(1);
       yAi = Ai(2);
       
       xBi = Bi(1);
       yBi = Bi(2);
       
       % Principal dots
       plot(Oi(1), Oi(2), strcat(colors(i), markers(1)))
       hold on;
       plot(Ai(1), Ai(2), strcat(colors(i), markers(2)))
       hold on;
       plot(Bi(1), Bi(2), strcat(colors(i), markers(3)))
       hold on;
       
       % Main segments
       Wi = getfield(mechanism.serials{i}.params, sprintf('W%d', i));
       
       line([xOi, xAi], [yOi, yAi], 'LineWidth', Wi);
       line([xAi, xBi], [yAi, yBi], 'LineWidth', Wi);
    end
    hold off;
    
    axis equal;

end