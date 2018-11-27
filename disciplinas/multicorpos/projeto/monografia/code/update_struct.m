function A = update_struct(A, fnames)
    for i = 1:length(fnames)
        A = setfield(A, fnames{i}, []);
    end
end

