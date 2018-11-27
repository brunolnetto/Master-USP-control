function endeffector = load_num_endeffector()
    endeffector = struct();

    endeffector = structcat(endeffector, load_generalized_endeffector());
    endeffector = structcat(endeffector, load_num_endeffector_params());
end