function params = load_endeffector_params(params)
% For this simulation, the geometry of the end-effector is an equilater 
% triangle of side, thickness and material specified below
    % Material: Alluminum 
    %   density [kg/m^3]
    params.rhoe = 2700;

    % Circle radius [m]
    params.Le = 5/100;
    
    % End-effector thickness [m]
    params.he = 4/1000;
    
    % End-effector volume [m^3]
    params.Ve = params.he*pi*params.Le^2;
    
    % Mass [Kg]
    params.me = params.rhoe*params.Ve; 

    % Inertia [Kg*m^2] - Source: https://bit.ly/1DsCrVC
    Jex = (1/12)*params.me*(3*params.Le^2 + params.he);
    Jey = Jex;
    Jez = (1/2)*params.me*params.Le^2;
    
    params.Je = diag([Jex, Jey, Jez]);
    
    % Joint relative position 
    % By symmetry, the reference point is baricenter of the projected 
    % circle
    
    % End-effector distance between reference frame and  [m] 
    % Geometrically, the radius of an equilater triangle MUST a*sqrt(3)/3
    params.Le1 = params.Le;
    params.Le2 = params.Le;
    params.Le3 = params.Le;
    
    % Angles relative to coordinate frame system attached to the
    % end-effector
    params.gamma1 = 0;
    params.gamma2 = 2*pi/3;
    params.gamma3 = 4*pi/3;
    
    % End-effector coordinates
    params.x = [sym('x'), sym('y'), sym('alpha')];
    params.xp = [sym('xp'), sym('yp'), sym('alphap')];
    params.xpp = [sym('xpp'), sym('ypp'), sym('alphapp')];
    
end