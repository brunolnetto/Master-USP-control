function [w, e, d, u, y] = sim_ex7(mdlnome, params, Tf)
    
    sat = params.sat;
    
    open_system(mdlnome);
    save_system;
    set_param(mdlnome, 'SaveOutput', 'on');
    stdOut = sim(mdlnome, 'StopTime', num2str(Tf), ...
                          'SrcWorkspace', 'current', ...
                          'AbsTol', '1e-10', ...
                          'RelTol', '1e-10');
    close_system
    
    w = stdOut.get('w');
    e = stdOut.get('e');
    d = stdOut.get('d');
    u = stdOut.get('u');
    y = stdOut.get('y');