%% this function is for the prepared array
function [] = plotvertices(crdt,A,labels)
hold on
gplot(A, crdt(:,[2 3]), '-o');                       %# Plot the points

text(crdt(:,2), crdt(:,3),labels,'VerticalAlignment','bottom', ...
                             'HorizontalAlignment','right');
grid off;
hold off;
axis ([0 180 0 140]);
end