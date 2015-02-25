function [first_node, first_node_coords, final_node, final_node_coords] = node_definition(crdt)
%% enter the first node
first_node = input('enter the first node > ');
first_node_coords = crdt(first_node,[2 3]);
%% final node
final_node = input('enter the final node > ');
final_node_coords = crdt(final_node,[2 3]);
end