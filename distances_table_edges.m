function data = distances_table_edges(dist,A)
W = dist.*(A);
data = W;
f = figure;
colnames = {1:9};
rownames = {1:9};
t = uitable(f,'Data', data, 'ColumnName', colnames,'RowName',rownames,'Position', [20 20 530 360]);
% 
end