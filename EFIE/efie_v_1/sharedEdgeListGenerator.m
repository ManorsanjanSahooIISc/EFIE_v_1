%% ---------------Shared Edge Generator ----------- %%
function sharedEdges = sharedEdgeListGenerator(EdgeList)
totalEdge = size(EdgeList);
k =1;
% sharedEdges = zeros(totalEdge,4);
 a = zeros(1,3);
for i = 1:totalEdge
   a = EdgeList(i,:);
    for j = i+1:totalEdge
        if ((a(1,1) == EdgeList(j,1)) && (a(1,2) == EdgeList(j,2)) ||(a(1,1) == EdgeList(j,2)) && (a(1,2) == EdgeList(j,1)) )
        sharedEdges(k,1) = a(1,1);
        sharedEdges(k,2) = a(1,2);
        sharedEdges(k,3) = a(1,3);
        sharedEdges(k,4) = EdgeList(j,3);
        k = k+1;
        end
    end
end
