%% this function is for the prepared array
function A = adjacency_matrix()
A =    [0 1 1 1 0 0 0 0 0;
        1 0 0 0 1 0 0 1 0;
        1 0 0 0 1 1 0 0 0;
        1 0 0 0 0 1 1 0 1;
        0 1 1 0 0 1 1 1 0;
        0 0 1 1 1 0 1 0 0;
        0 0 0 1 1 1 0 1 1;
        0 1 0 0 1 0 1 0 1;
        0 0 0 1 0 0 1 1 0;];
end