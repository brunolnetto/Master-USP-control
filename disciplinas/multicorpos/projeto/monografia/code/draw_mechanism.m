function draw_mechanism(mechanism, sim)
    clf;
    axis equal;
    
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
       plot(Oi(1), Oi(2), strcat(colors(1), markers(1)))
       hold on;
       plot(Ai(1), Ai(2), strcat(colors(2), markers(2)))
       hold on;
       plot(Bi(1), Bi(2), strcat(colors(3), markers(3)))
       hold on;
       
       % Main segments
       W1 = mechanism.serials{i}.bodies{1}.params.W1;
       W2 = mechanism.serials{i}.bodies{2}.params.W2;
       
       line([xOi, xAi], [yOi, yAi], 'LineWidth', W1);
       line([xAi, xBi], [yAi, yBi], 'LineWidth', W2);
    end
            
    hold off;
    
    axis([-0.6 0.6 -0.6 0.6]);
    
    axis equal;
end