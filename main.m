close all
clear variables
clc
%% call the function of creating the prepared array
[crdt,dist,labels] = random_vertices();  % calling the func of vertices
[A] = adjacency_matrix();           %# calling the func of adjacency matrix
%------------------------------------------------------------------------%

%%
fprintf('ploting the vertices\n')
%% enter the route
[first_node, first_node_coords, final_node, final_node_coords,] = node_definition(crdt);
%% plot vertices
plotvertices(crdt,A,labels);
%% plotting the distances table
[data] = distances_table_edges(dist,A);
%% astar
[parent_list, open_list, closed_list, G_n] = astar(crdt, first_node, final_node,data);
