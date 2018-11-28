function endeffector = load_num_endeffector()
    endeffector = struct();

    endeffector.generalized = load_generalized_endeffector();
    endeffector.params = load_num_endeffector_params();
    endeffector.T = transformations_endeffector(endeffector);
end