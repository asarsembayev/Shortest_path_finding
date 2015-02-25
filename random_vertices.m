%% this function is for the prepared array
function [crdt,dist,labels] = random_vertices()
%%-------------Coordinates of the vertices-(prepared)----------------------%

x = [10 25 25 25 122 96 138 150 150];
y = [60 100 60 15 81 50 48 100 15];
no_num = 9;
nums_arr=(1:no_num)';
crd = [x; y];                         %# Making the matrix of the vertices
crdt = [nums_arr crd'];                          %# Transposing it to 5by2 matrix

%%counting the distance of edges
N=9;
for i=1:N
    for j=i+1:N
        dist(i,j)=norm(crdt(i,2:3)-crdt(j,2:3));
        dist(j,i)=dist(i,j);
    end
end

%% assinging the letters to the vertices
labels = char('1'+(1:9)-1)';
end