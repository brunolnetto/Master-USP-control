function F = rayleigh_energy(body)
    if body.fric_is_linear
        % TO FIX: Fix with contact point of body and viscuous fluid
        F = (1/2)*body.b*body.v_cg.'*body.v_cg;
    else
        F = (1/2)*body.b*body.omega.'*body.omega;
        
end