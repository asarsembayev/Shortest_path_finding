function [parent_list, open_list, closed_list, G_n] = astar(crdt, first_node, final_node,data)

H_first_node = norm(crdt(first_node,2:3)-crdt(final_node,2:3));
G_first = 0;
F_first_node = H_first_node+G_first;

current_node = [first_node;G_first;F_first_node];
closed_list = [0;0;0];
open_list = current_node;
parent_list = [0 0 0 0 0 0 0 0 0];


%% Astar

while current_node(1,:) ~= final_node
    [minVal, minInd] = min(open_list(3,:));
    current_node = open_list(:, minInd);
    if current_node(1,:) == final_node
        parent_list(neigh_n_ind(1,a))=current_node(1,:);
%         G = sum(closed_list(2,:))+current_node(2,:)
        fprintf('you have reached the final node');
    return
    else
        closed_list=[closed_list current_node];
        temp_row = data((current_node(1,:)),:);    %find the neighbour nodes >
        neigh_n_ind = find(temp_row~=0);        %> that are not equal to 0!
        
        
        for a = 1:length(neigh_n_ind)
            isinclosed = ismember(neigh_n_ind(1,a),closed_list(1,:));
            isinopen = ismember(neigh_n_ind(1,a),open_list(1,:));
            [O,M] = ismember(neigh_n_ind(1,a),open_list(1,:));
            [C,L] = ismember(neigh_n_ind(1,a),closed_list(1,:));
            
            Gcurrent = current_node(2,:);
            G_n(a) = Gcurrent + norm(crdt(current_node(1,:),2:3)-crdt(neigh_n_ind(a),2:3));
            h_n(a) = norm(crdt(neigh_n_ind(a),2:3)-crdt(final_node,2:3));
            f_n(a) = h_n(a)+G_n(a);
            
            if ismember(current_node(1,:),closed_list(1,:))&&ismember(current_node(1,:),open_list(1,:))
                [col,row] = ismember(current_node(1,:),open_list(1,:));
                open_list(:,row)=[];                                
            end

            if (isinclosed);
               if neigh_n_ind(a)==first_node
                   parent_list(neigh_n_ind(1,a))=0;
               elseif neigh_n_ind(a)==closed_list(1,3)
                   parent_list(neigh_n_ind(a))=closed_list(1,2);
               elseif closed_list(2,row)<G_n(a)
                   parent_list(neigh_n_ind(a))=parent_list(neigh_n_ind(a));
               else
                   parent_list(neigh_n_ind(1,a))=current_node(1,:);
               end
               G_n(a) = Gcurrent + norm(crdt(current_node(1,:),2:3)-crdt(neigh_n_ind(a),2:3));
               h_n(a) = norm(crdt(neigh_n_ind(a),2:3)-crdt(final_node,2:3));
               [I,J] = ismember(neigh_n_ind(1,a),closed_list(1,:));
               f_n(a) = h_n(a)+G_n(a);
               closed_list([2 3],J) = [G_n(a) f_n(a)];
            elseif (isinopen)&&(G_n(a)<open_list(2,M));
               G_n(a) = Gcurrent + norm(crdt(current_node(1,:),2:3)-crdt(neigh_n_ind(a),2:3));
               h_n(a) = norm(crdt(neigh_n_ind(a),2:3)-crdt(final_node,2:3));
               f_n(a) = h_n(a)+G_n(a);
               [I,J] = ismember(neigh_n_ind(1,a),open_list(1,:));
               open_list([2 3],J) = [G_n(a) f_n(a)];
               parent_list(neigh_n_ind(1,a))=current_node(1,:);
            elseif neigh_n_ind(a)==final_node;
                G = closed_list(2,end)+norm(crdt(neigh_n_ind(a),2:3)-crdt(current_node(1,1),2:3))
                parent_list(neigh_n_ind(1,a))=current_node(1,:);
                fprintf('you have reached the final node');
                return
            elseif (isinclosed==0)&&(isinopen==0);
               G_n(a) = Gcurrent + norm(crdt(current_node(1,:),2:3)-crdt(neigh_n_ind(a),2:3));
               h_n(a) = norm(crdt(neigh_n_ind(a),2:3)-crdt(final_node,2:3));
               f_n(a) = h_n(a)+G_n(a);
               neigh_n = [neigh_n_ind(a);G_n(a);f_n(a)];
               open_list = [open_list neigh_n];
               parent_list(neigh_n_ind(1,a))=current_node(1,:);
            else
                W = 0;
            end
        end 
    end
end

end