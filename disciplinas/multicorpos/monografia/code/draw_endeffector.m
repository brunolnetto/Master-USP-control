function draw_endeffector(sim, mechanism)
    viscircles(double([sim.q(1), sim.q(2)]), ...
               mechanism.endeffector.params.Le1); 
end